USE wonderland_elections_project;

CREATE TABLE IF NOT EXISTS Place (
	place_id INT AUTO_INCREMENT,
    street_number VARCHAR(25) NOT NULL,
    street_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(25) NOT NULL,
    zip_code CHAR(5) NOT NULL,
    x_coordinate DECIMAL(10, 7) NOT NULL,
    y_coordinate DECIMAL(10, 7) NOT NULL,
    PRIMARY KEY (place_id),
    UNIQUE (street_number, street_name, city, state, zip_code),
    UNIQUE (x_coordinate, y_coordinate)
);

CREATE TABLE IF NOT EXISTS Voting_Center (
	place_id INT,
    acronym CHAR(4) NOT NULL UNIQUE,
    PRIMARY KEY (place_id),
    FOREIGN KEY (place_id) REFERENCES Place(place_id) ON DELETE CASCADE,
	CHECK (acronym REGEXP '^[A-Z0-9]{4}$')
);

CREATE TABLE IF NOT EXISTS Residence (
	place_id INT,
    household_size INT,
    PRIMARY KEY (place_id),
    FOREIGN KEY (place_id) REFERENCES Place(place_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Folks (
	folk_id CHAR(16),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    nickname VARCHAR(50),
    date_of_birth DATE NOT NULL,
    primary_phone_number CHAR(10) NOT NULL UNIQUE,
    secondary_phone_number CHAR(10),
    place_id INT NOT NULL,
    PRIMARY KEY (folk_id),
    FOREIGN KEY (place_id) REFERENCES Residence(place_id) ON DELETE RESTRICT,
    CHECK (folk_id REGEXP '^[0-9]{16}$'),
    CHECK (primary_phone_number REGEXP '^[0-9]{10}$'),
    CHECK (secondary_phone_number REGEXP '^[0-9]{10}$')
);

CREATE TABLE IF NOT EXISTS Folks_Email (
	folk_id CHAR(16),
    email VARCHAR(100) NOT NULL,
    PRIMARY KEY (folk_id, email),
    FOREIGN KEY (folk_id) REFERENCES Folks(folk_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Elections_Staff (
	folk_id CHAR(16),
    staff_role ENUM('Clerk', 'Monitor') NOT NULL,
    PRIMARY KEY (folk_id),
    FOREIGN KEY (folk_id) REFERENCES Folks(folk_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Operating_Period (
	op_id INT AUTO_INCREMENT,
    start_datetime DATETIME NOT NULL,
    end_datetime DATETIME NOT NULL,
    place_id int NOT NULL,
    PRIMARY KEY (op_id),
    FOREIGN KEY (place_id) REFERENCES Voting_Center(place_id) ON DELETE CASCADE,
    CHECK (start_datetime < end_datetime)
);

CREATE TABLE IF NOT EXISTS Works_At (
	folk_id CHAR(16),
    place_id INT,
    start_shift_datetime DATETIME NOT NULL,
    end_shift_datetime DATETIME NOT NULL,
    PRIMARY KEY (folk_id, place_id, start_shift_datetime),
    FOREIGN KEY (folk_id) REFERENCES Elections_Staff(folk_id) ON DELETE CASCADE,
    FOREIGN KEY (place_id) REFERENCES Voting_Center(place_id) ON DELETE CASCADE,
    CHECK (start_shift_datetime < end_shift_datetime)
);

CREATE TABLE IF NOT EXISTS Poll (
	poll_name_id CHAR(4),
    question_text TEXT NOT NULL,
    start_datetime_availability DATETIME NOT NULL,
    end_datetime_availability DATETIME NOT NULL,
    PRIMARY KEY (poll_name_id),
    CHECK (poll_name_id REGEXP '^[A-Z0-9]{4}$')
);

CREATE TABLE IF NOT EXISTS Voting_Registration (
	registration_id INT AUTO_INCREMENT,
    desired_voting_date DATE NOT NULL,
    validation_status ENUM('Valid', 'Invalid', 'Pending') NOT NULL DEFAULT 'Pending',
    folk_id CHAR(16) NOT NULL,
    center_id INT NOT NULL,
    PRIMARY KEY (registration_id),
    FOREIGN KEY (folk_id) REFERENCES Folks(folk_id) ON DELETE CASCADE,
    FOREIGN KEY (center_id) REFERENCES Voting_Center(place_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Ballot (
	ballot_id INT AUTO_INCREMENT,
    voter_choice ENUM('YES', 'NO', 'ABSTAIN') DEFAULT NULL,
    cast_datetime DATETIME DEFAULT CURRENT_TIMESTAMP,
    ballot_status ENUM('Counted', 'Spoiled', 'Pending') NOT NULL DEFAULT 'Pending',
    registration_id INT NOT NULL,
    poll_name_id CHAR(4) NOT NULL,
    folk_id char(16) NOT NULL,
    center_id INT NOT NULL,
    PRIMARY KEY (ballot_id),
    FOREIGN KEY (registration_id) REFERENCES Voting_Registration(registration_id) ON DELETE RESTRICT,
    FOREIGN KEY (poll_name_id) REFERENCES Poll(poll_name_id) ON DELETE RESTRICT,
    FOREIGN KEY (folk_id) REFERENCES Folks(folk_id) ON DELETE RESTRICT,
    FOREIGN KEY (center_id) REFERENCES Voting_Center(place_id) ON DELETE RESTRICT,
    UNIQUE (folk_id, poll_name_id)
);

-- Trigger 1: Check insert into Voting_Center if it's already in Residence (ensures disjoint relationship for Place)
-- If a Place already in Residence is attempted to be inserted into Voting_Center, this trigger will block the insert via
-- purposefully violating the not null constraint and send an error message.
DELIMITER $$
CREATE TRIGGER check_voting_center_insert
BEFORE INSERT ON Voting_Center
FOR EACH ROW
BEGIN
    -- Check if the place_id to be inserted is already in Residence
    IF (SELECT COUNT(*) FROM Residence WHERE place_id = NEW.place_id) > 0 THEN
        SET NEW.place_id = NULL; -- If so, set the place_id to be inserted to null to send an error message and block the insertion
    END IF;
END$$
DELIMITER ;

-- Trigger 2: Check insert into Residence if it's already in Voting_Center (ensures disjoint relationship for Place)
-- If a Place already in Voting_Center is attempted to be inserted into Residence, this trigger will block the insert via
-- purposefully violating the not null constraint and send an error message.
DELIMITER $$
CREATE TRIGGER check_residence_insert
BEFORE INSERT ON Residence
FOR EACH ROW
BEGIN
    -- Check if the place_id to be inserted is already in Voting_Center
    IF (SELECT COUNT(*) FROM Voting_Center WHERE place_id = NEW.place_id) > 0 THEN
        SET NEW.place_id = NULL; -- If so, set the place_id to be inserted to null to send an error message and block the insertion
    END IF;
END$$
DELIMITER ;

-- Trigger 3: Prevent Poll modifications if there are cast ballots
-- If a modification is attempted on a Poll with ballots already cast to it, 
-- this trigger will block the modification and send an error message.
DELIMITER $$
CREATE TRIGGER check_poll_modification
BEFORE UPDATE ON Poll
FOR EACH ROW
BEGIN
    -- Check if any ballots have been cast for this poll
    IF (SELECT COUNT(*) FROM Ballot WHERE poll_name_id = OLD.poll_name_id) > 0 THEN
        SET NEW.poll_name_id = NULL; -- If so, set the poll_name_id to null to send an error message and block the modification
    END IF;
END$$
DELIMITER ;

-- Trigger 4: Validate or Invalidate voting registration status
-- This trigger will check the desired voting date of the registration to make sure it is within the
-- operating periods for the desired voting center.
DELIMITER $$
CREATE TRIGGER validate_registration_status
BEFORE INSERT ON Voting_Registration
FOR EACH ROW
BEGIN
    -- Check if the desired_voting_date is within one of the operating periods for the designated voting center
    IF (
        SELECT COUNT(*)
        FROM Operating_Period
        WHERE place_id = NEW.center_id
          AND NEW.desired_voting_date BETWEEN DATE(start_datetime) AND DATE(end_datetime)
    ) > 0 THEN
        SET NEW.validation_status = 'Valid'; -- If so, validate the registration
    ELSE
        SET NEW.validation_status = 'Invalid'; -- If not, make the registration invalid
    END IF;
END$$
DELIMITER ;

-- Trigger 5: Validate ballot and fill folk_id and center_id information
-- This trigger will fill a ballot tuple with the same folk_id and voting center id as the one used in its associated registration
-- This trigger will also check if the associated registration is valid, and if the date the ballot is cast is valid
DELIMITER $$
CREATE TRIGGER validate_and_fill_ballot_insert
BEFORE INSERT ON Ballot
FOR EACH ROW
BEGIN
    -- Set the folk_id of the ballot to be the same one on the registration
    SET NEW.folk_id = (
        SELECT folk_id 
        FROM Voting_Registration 
        WHERE registration_id = NEW.registration_id
    );
    -- Set the center_id of the ballot to be the same one on the registration
    SET NEW.center_id = (
        SELECT center_id 
        FROM Voting_Registration 
        WHERE registration_id = NEW.registration_id
    );
    -- Do various checks to make sure the ballot is valid
    IF (
        -- Check if the associated voting_registration is valid, if not, block the ballot insertion
        (SELECT validation_status FROM Voting_Registration WHERE registration_id = NEW.registration_id) != 'Valid'
    ) 
    OR (
        -- Check if the desired_voting_date matches the date the ballot is cast, if not, block the ballot insertion
        (SELECT desired_voting_date FROM Voting_Registration WHERE registration_id = NEW.registration_id) != DATE(NEW.cast_datetime)
    ) 
    OR (
        -- Check if the cast_datetime of the ballot is within the Operating_Period of the voting center, if not, block the ballot insertion
        (
            SELECT COUNT(*)
            FROM Operating_Period
            WHERE place_id = NEW.center_id 
              AND NEW.cast_datetime BETWEEN start_datetime AND end_datetime
        ) = 0
    ) THEN
        SET NEW.registration_id = NULL; -- If any of the checks fail, set the registration_id to null to violate NOT NULL constraint to block the insert
    END IF;
END$$
DELIMITER ;

-- Trigger 6: Prevent modification of Operating_Period if registrations exist for it already
-- This trigger prevents updates to a voting center's operating period if voting registrations for it have been made
DELIMITER $$
CREATE TRIGGER check_operating_period_modification
BEFORE UPDATE ON Operating_Period
FOR EACH ROW
BEGIN
    -- Check the amount of voting registrations that exist within this voting center's operating period
    IF (
        SELECT COUNT(*) 
        FROM Voting_Registration
        WHERE center_id = OLD.place_id
          AND desired_voting_date BETWEEN DATE(OLD.start_datetime) AND DATE(OLD.end_datetime)
    ) > 0 THEN
        SET NEW.op_id = NULL; -- If registrations exist, block the modification by sending a NOT NULL constraint error
    END IF;
END$$
DELIMITER ;

-- Trigger 7: Prevent invalidation of a cast ballot's valid voting registration
-- This trigger makes sure that a voting registration with a ballot cast cannot be invalidated
DELIMITER $$
CREATE TRIGGER check_registration_invalidation
BEFORE UPDATE ON Voting_Registration
FOR EACH ROW
BEGIN
    -- If the validation_status of the registration is being modified,
    -- check if ballots have already been cast using this registration
    IF OLD.validation_status = 'Valid' AND NEW.validation_status != 'Valid' THEN
        IF (SELECT COUNT(*) FROM Ballot WHERE registration_id = OLD.registration_id) > 0 THEN
            SET NEW.registration_id = NULL; -- If so, block the modification using a NOT NULL constraint violation
        END IF;
    END IF;
END$$
DELIMITER ;

-- Index 1: Creates an index on Place for city
-- I created this index because it is useful for Query/Report B.6
CREATE INDEX Place_city_index ON Place(city);

-- Index 2: Creates an index on Voting_Registration for center_id and desired_voting_date
-- I created this index because it is useful for Query/Report B.4 and B.6
CREATE INDEX Voting_Registration_center_date_index ON Voting_Registration(center_id, desired_voting_date);

-- Index 3: Creates an index on Place for state
-- I created this index because it is useful for Query/Report B.7
CREATE INDEX Place_state_index ON Place(state);
