USE wonderland_elections_project;

-- @voter_choice_input is a scripting variable, this is used to set the voter's choice on their ballot for a poll
SET @voter_choice_input = 'NO';       -- Example: The voter marked 'NO' on their ballot for the poll
-- @cast_datetime_input is a scripting variable, this is used to set the time the voter cast their ballot for a poll
SET @cast_datetime_input = '2026-01-15 10:00:05';       -- Example: The voter cast their ballot at 2026-01-15 10:00:05
-- @registration_id_input is a scripting variable, this is used to connect their ballot to a voting registration
-- A folk needs a valid registration to cast a ballot
SET @registration_id_input = 15;       -- Example: The voter's registration_id is 15
-- @poll_name_id_input is a scripting variable, this is used to specify what poll this ballot is for
SET @poll_name_id_input = 'XP07';       -- Example: This voter's ballot is for the poll 'XP07'

-- Set the transaction level to SERIALIZABLE to prevent double voting, issues with concurrent operations, and other failures
-- This protects the data integrity of the Ballots
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
START TRANSACTION;
INSERT INTO Ballot(voter_choice, cast_datetime, registration_id, poll_name_id) VALUES (@voter_choice_input, @cast_datetime_input, @registration_id_input, @poll_name_id_input);
COMMIT;

-- Query the Ballot relation to check if the Ballot was successfully inserted
SELECT * FROM Ballot WHERE registration_id = @registration_id_input;