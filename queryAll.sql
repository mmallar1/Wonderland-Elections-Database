USE wonderland_elections_project;

/*
Query B.1: List the name, city, and email (any single email suffices) of all folks.
*/
SELECT Folks.first_name, Folks.last_name, Place.city, MIN(Folks_Email.email) AS email
FROM Folks, Place, Folks_Email
WHERE Folks.place_id = Place.place_id AND Folks.folk_id = Folks_Email.folk_id
GROUP BY Folks.folk_id, Folks.first_name, Folks.last_name, Place.city;


/*
Query B.2: List the city, state, and the number of residents of each city in Wonderland (skip cities with no residents) in decreasing order of number of residents.
*/
SELECT Place.city, Place.state, COUNT(Folks.folk_id) AS number_of_residents
FROM Folks, Residence, Place
WHERE Folks.place_id = Residence.place_id AND Residence.place_id = Place.place_id
GROUP BY Place.city, Place.state
HAVING number_of_residents > 0
ORDER BY number_of_residents DESC;


/*
Query B.3: List each center together with its number of currently registered folks (include states with no inhabited places) in increasing alphabetical order of their zipcode.
*/
SELECT Voting_Center.acronym, Place.zip_code, COUNT(Voting_Registration.registration_id) AS num_registered_folks
FROM Voting_Center
INNER JOIN Place ON Voting_Center.place_id = Place.place_id
LEFT OUTER JOIN Voting_Registration ON Voting_Center.place_id = Voting_Registration.center_id
GROUP BY Voting_Center.acronym, Place.zip_code
ORDER BY Place.zip_code ASC;


/*
Query B.4: Find the distinct identifiers and names of folks registered at a given voting center within a given time period.
*/
-- @inputted_center_id is a scripting variable, this is used to define which voting center the user wants information from
SET @inputted_center_id = 5;       -- Example: Looking for registrations at Voting_Center 5 (DAMA)
-- @inputted_start_date is a scripting variable, this is used to define the starting time period the user wants information from
SET @inputted_start_date = '2026-01-01';       -- Example: Looking for registrations at DAMA starting from 2026-01-01
-- @inputted_end_date is a scripting variable, this is used to define the end time period the user wants information from
SET @inputted_end_date = '2026-01-31';       -- Example: Looking for registrations at DAMA up until from 2026-01-31

SELECT DISTINCT Folks.folk_id, Folks.first_name, Folks.last_name
FROM Folks, Voting_Registration
WHERE Folks.folk_id = Voting_Registration.folk_id AND Voting_Registration.center_id = @inputted_center_id 
	AND Voting_Registration.desired_voting_date BETWEEN @inputted_start_date AND @inputted_end_date;


/*
Query B.5: Find for a given month, the number of unique registrations at any voting center which is within 3 miles from the center of Megapolis, 
except for voting centers in a given (exclusion) list of voting centers.
NOTE: MEGAPOLIS COORDINATES ARE (0,0)
*/
-- @input_month is a scripting variable, this is used to define which month the user wants information from
SET @inputted_month = 03;       -- Example: Looking at the month of March
-- @inputted_year is a scripting variable, this is used to define which year the user wants information from
SET @inputted_year = 2026;       -- Example: Looking at the year 2026
-- @excluded_center_id is a scripting variable, this is used to define which year the user wants information from
SET @excluded_center_id = 12;       -- Example: Exclude registrations from Voting_Center 12 (BETH)

SELECT COUNT(DISTINCT Voting_Registration.registration_id) AS unique_registrations
FROM Voting_Registration, Voting_Center, Place
WHERE Voting_Registration.center_id = Voting_Center.place_id
	AND Voting_Center.place_id = Place.place_id
	AND MONTH(Voting_Registration.desired_voting_date) = @inputted_month 
	AND YEAR(Voting_Registration.desired_voting_date) = @inputted_year
    AND Voting_Registration.center_id != @excluded_center_id
    AND SQRT(POWER(Place.x_coordinate, 2) + POWER(Place.y_coordinate, 2)) < 3;


/*
Query B.6: Find the most popular voting center(s) (in terms of total number of registrations) in a given time period among those in a given city.
*/
-- @inputted_city is a scripting variable, this is used to define which city the user wants information from
SET @inputted_city = 'Damascus';       -- Example: Looking at the voting centers in the city Damascus
-- @inputted_start_date is a scripting variable, this is used to define the starting time period the user wants information from
SET @inputted_start_date = '2026-01-01';       -- Example: Looking for registrations starting from 2026-01-01
-- @inputted_end_date is a scripting variable, this is used to define the end time period the user wants information from
SET @inputted_end_date = '2026-01-31';       -- Example: Looking for registrations up until 2026-01-31
-- CTE Total_Registrations_Count_Per_Voting_Center calculates the total amount of voting registrations per center in a given city
WITH Total_Registrations_Count_Per_Voting_Center AS (
    SELECT Voting_Center.acronym, COUNT(Voting_Registration.registration_id) AS total_number_of_registrations
    FROM Voting_Center, Place, Voting_Registration
    WHERE Voting_Center.place_id = Place.place_id
      AND Voting_Center.place_id = Voting_Registration.center_id
      AND Place.city = @inputted_city
      AND Voting_Registration.desired_voting_date BETWEEN @inputted_start_date AND @inputted_end_date
    GROUP BY Voting_Center.place_id, Voting_Center.acronym
)
SELECT acronym, total_number_of_registrations
FROM Total_Registrations_Count_Per_Voting_Center
WHERE total_number_of_registrations = (SELECT MAX(total_number_of_registrations) FROM Total_Registrations_Count_Per_Voting_Center);


/*
Query B.7: Find the unique folk that have valid registrations with every voting center on a given state. 
*/
-- @inputted_state is a scripting variable, this is used to define which state the user wants information from
SET @inputted_state = 'Maryland';       -- Example: Looking at the voting centers in Maryland

SELECT Folks.folk_id, Folks.first_name, Folks.last_name
FROM Folks, Voting_Registration, Voting_Center, Place
WHERE Folks.folk_id = Voting_Registration.folk_id
	AND Voting_Registration.center_id = Voting_Center.place_id
    AND Voting_Center.place_id = Place.place_id
	AND Place.state = @inputted_state 
    AND Voting_Registration.validation_status = 'Valid'
GROUP BY Folks.folk_id, Folks.first_name, Folks.last_name
HAVING COUNT(DISTINCT Voting_Registration.center_id) = (
        SELECT COUNT(*)
        FROM Voting_Center
        INNER JOIN Place ON Voting_Center.place_id = Place.place_id
        WHERE Place.state = @inputted_state
    );


/*
Query B.8: Find folks that registered at a voting center that is farther away than the voting center closest to their residence (break ties alphabetically by center’s acronym). 
*/
SELECT DISTINCT Folks.folk_id, Folks.first_name, Folks.last_name, Voting_Center.acronym AS registered_voting_center,
    -- Subquery to find closest voting center from the folk's residence
    (
        SELECT Voting_Center.acronym
        FROM Voting_Center, Place
        WHERE Voting_Center.place_id = Place.place_id
        ORDER BY SQRT(POWER(Folk_Residence.x_coordinate - Place.x_coordinate, 2) + POWER(Folk_Residence.y_coordinate - Place.y_coordinate, 2)) ASC, Voting_Center.acronym ASC
        LIMIT 1
    ) AS closest_voting_center
FROM Folks
INNER JOIN Place AS Folk_Residence ON Folks.place_id = Folk_Residence.place_id
INNER JOIN Voting_Registration ON Folks.folk_id = Voting_Registration.folk_id
INNER JOIN Voting_Center ON Voting_Registration.center_id = Voting_Center.place_id
INNER JOIN Place AS Center_Registered ON Voting_Center.place_id = Center_Registered.place_id
WHERE SQRT(POWER(Folk_Residence.x_coordinate - Center_Registered.x_coordinate, 2) + POWER(Folk_Residence.y_coordinate - Center_Registered.y_coordinate, 2)) > (
        SELECT MIN(SQRT(POWER(Folk_Residence.x_coordinate - Place.x_coordinate, 2) + POWER(Folk_Residence.y_coordinate - Place.y_coordinate, 2)))
        FROM Voting_Center, Place
        WHERE Voting_Center.place_id = Place.place_id
    );


/*
Query B.9: Write a SQL function that returns the acronym of the voting center closest to the residence of a given folk among those whose operating period(s) contain a given date 
(return NULL if no such center exists; break ties at alphabetically by acronym).
*/
DROP FUNCTION IF EXISTS display_closest_voting_center_from_folk;
CREATE FUNCTION display_closest_voting_center_from_folk(inputted_folk_id CHAR(16), inputted_date DATE)
RETURNS CHAR(4)
CONTAINS SQL READS SQL DATA
    RETURN (
        SELECT Voting_Center.acronym
        FROM Voting_Center
        INNER JOIN Place AS Center ON Voting_Center.place_id = Center.place_id
        INNER JOIN Operating_Period ON Voting_Center.place_id = Operating_Period.place_id
        INNER JOIN Folks ON Folks.folk_id = inputted_folk_id
        INNER JOIN Place AS Folk_Residence ON Folks.place_id = Folk_Residence.place_id
        WHERE inputted_date BETWEEN DATE(Operating_Period.start_datetime)
                                AND DATE(Operating_Period.end_datetime)
        ORDER BY SQRT(POWER(Folk_Residence.x_coordinate - Center.x_coordinate, 2) + POWER(Folk_Residence.y_coordinate - Center.y_coordinate, 2)),
            Voting_Center.acronym
        LIMIT 1
    );
-- Example Inputs for B.9:
SET @test_folk_id = '1357900000000000';
SET @test_date = '2026-01-09';
SELECT display_closest_voting_center_from_folk(@test_folk_id, @test_date) AS closest_voting_center_from_folk_residence;


/*
Query B.10: For a given poll, construct a cross-tabulation of voting centers (acronym) as rows, unique poll answers (options) as columns, and cells indicating number
of cast ballots at the row’s center with the column’s option.
*/
-- @inputted_poll_name_id is a scripting variable, this is used to define which poll the user wants information from
SET @inputted_poll_name_id = 'XP01';       -- Example: Looking at the voting centers in Maryland
SELECT Voting_Center.acronym AS 'Voting Center', @inputted_poll_name_id AS 'Poll Name',
    SUM(CASE WHEN Ballot.voter_choice = 'YES' THEN 1 ELSE 0 END) AS 'YES',
    SUM(CASE WHEN Ballot.voter_choice = 'NO' THEN 1 ELSE 0 END) AS 'NO',
    SUM(CASE WHEN Ballot.voter_choice = 'ABSTAIN' THEN 1 ELSE 0 END) AS 'ABSTAIN',
    COUNT(Ballot.ballot_id) AS 'Total Ballots Cast'
FROM Voting_Center
LEFT JOIN Ballot ON Voting_Center.place_id = Ballot.center_id AND Ballot.poll_name_id = @inputted_poll_name_id
GROUP BY Voting_Center.acronym;