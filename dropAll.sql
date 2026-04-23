USE wonderland_elections_project;

-- Drop the function created in B.9
DROP FUNCTION IF EXISTS display_closest_voting_center_from_folk;

-- Drop the indices
DROP INDEX Place_city_index ON Place;
DROP INDEX Voting_Registration_center_date_index ON Voting_Registration;
DROP INDEX Place_state_index ON Place;

-- Drop all of the triggers
DROP TRIGGER IF EXISTS check_voting_center_insert;
DROP TRIGGER IF EXISTS check_residence_insert;
DROP TRIGGER IF EXISTS check_poll_modification;
DROP TRIGGER IF EXISTS validate_registration_status;
DROP TRIGGER IF EXISTS validate_and_fill_ballot_insert;
DROP TRIGGER IF EXISTS check_operating_period_modification;
DROP TRIGGER IF EXISTS check_registration_invalidation;

-- Drop all of the relations
DROP TABLE IF EXISTS Ballot;
DROP TABLE IF EXISTS Voting_Registration;
DROP TABLE IF EXISTS Poll;
DROP TABLE IF EXISTS Works_At;
DROP TABLE IF EXISTS Operating_Period;
DROP TABLE IF EXISTS Elections_Staff;
DROP TABLE IF EXISTS Folks_Email;
DROP TABLE IF EXISTS Folks;
DROP TABLE IF EXISTS Residence;
DROP TABLE IF EXISTS Voting_Center;
DROP TABLE IF EXISTS Place;