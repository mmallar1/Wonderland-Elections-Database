USE wonderland_elections_project;

-- Populate Place Relation
INSERT INTO Place(street_number, street_name, city, state, zip_code, x_coordinate, y_coordinate) VALUES('9000', 'Ridge Road', 'Damascus', 'Maryland', '20872', -1.5, 2.0);
INSERT INTO Place(street_number, street_name, city, state, zip_code, x_coordinate, y_coordinate) VALUES('4500', 'Frederick Road', 'Germantown', 'Maryland', '20874', 4.0, 3.0);
INSERT INTO Place(street_number, street_name, city, state, zip_code, x_coordinate, y_coordinate) VALUES('3737', 'Maple Drive', 'Arlington', 'Virginia', '20301', 15.0, -1.2);
INSERT INTO Place(street_number, street_name, city, state, zip_code, x_coordinate, y_coordinate) VALUES('4587', 'Gold Street', 'Damascus', 'Maryland', '20872', -2.5, 3.5);
INSERT INTO Place(street_number, street_name, city, state, zip_code, x_coordinate, y_coordinate) VALUES('7005', 'Ridge Road', 'Damascus', 'Maryland', '20872', -3.7, 5.7);
INSERT INTO Place(street_number, street_name, city, state, zip_code, x_coordinate, y_coordinate) VALUES('8845', 'Frederick Road', 'Germantown', 'Maryland', '20874', 6.7, 2.3);
INSERT INTO Place(street_number, street_name, city, state, zip_code, x_coordinate, y_coordinate) VALUES('1000', 'Chestnut Drive', 'Arlington', 'Virginia', '20301', 17.0, -3.4);
INSERT INTO Place(street_number, street_name, city, state, zip_code, x_coordinate, y_coordinate) VALUES('5200', 'Raven Lane', 'Baltimore', 'Maryland', '21250', 2.5, 10.2);
INSERT INTO Place(street_number, street_name, city, state, zip_code, x_coordinate, y_coordinate) VALUES('2035', 'Eagle Street', 'Philadelphia', 'Pennsylvania', '19000', 20.0, 10.2);
INSERT INTO Place(street_number, street_name, city, state, zip_code, x_coordinate, y_coordinate) VALUES('6342', 'Philly Drive', 'Philadelphia', 'Pennsylvania', '19000', 22.0, 12.2);
INSERT INTO Place(street_number, street_name, city, state, zip_code, x_coordinate, y_coordinate) VALUES('1111', 'Cole Street', 'Rockville', 'Maryland', '20877', 0.7, 1.2);
INSERT INTO Place(street_number, street_name, city, state, zip_code, x_coordinate, y_coordinate) VALUES('2222', 'Water Lane', 'Bethesda', 'Maryland', '20879', 1.2, 1.2);
INSERT INTO Place(street_number, street_name, city, state, zip_code, x_coordinate, y_coordinate) VALUES('9832', 'Hawkins Road', 'Damascus', 'Maryland', '20872', -3.3, 5.2);
INSERT INTO Place(street_number, street_name, city, state, zip_code, x_coordinate, y_coordinate) VALUES('0123', 'Ice Street', 'Damascus', 'Maryland', '20872', -2.5, 4.5);

-- Populate Voting_Center Relation
INSERT INTO Voting_Center VALUES(5, 'DAMA');
INSERT INTO Voting_Center VALUES(6, 'GERM');
INSERT INTO Voting_Center VALUES(7, 'ARLI');
INSERT INTO Voting_Center Values(9, 'PHIL');
INSERT INTO Voting_Center Values(11, 'ROCK');
INSERT INTO Voting_Center Values(12, 'BETH');
INSERT INTO Voting_Center Values(13, 'DAM2');
INSERT INTO Voting_Center Values(14, 'DAM3');

-- Populate Residence Relation
INSERT INTO Residence VALUES(1, 4);
INSERT INTO Residence VALUES(2, 4);
INSERT INTO Residence VALUES(3, 3);
INSERT INTO Residence VALUES(4, 4);
INSERT INTO Residence VALUES(8, 1);
INSERT INTO Residence VALUES(10, 0);

-- Populate Folks Relation with 15 tuples
INSERT INTO Folks VALUES('1357900000000000', 'Mikhail', 'Mallari', 'Miko', '2000-12-17', '4439997150', NULL, 1);
INSERT INTO Folks VALUES('1357900000000001', 'Austin', 'Reaves', 'AR', '1999-08-13', '2408953497', NULL, 1);
INSERT INTO Folks VALUES('1357900000000002', 'Rui', 'Hachimura', NULL, '1996-04-21', '3015439160', NULL, 1);
INSERT INTO Folks VALUES('1357900000000003', 'LeBron', 'James', 'King', '1986-12-30', '5350195720', '6839105629', 1);
INSERT INTO Folks VALUES('1357900000000004', 'Bronny', 'James', NULL, '2004-05-12', '1295830681', '7381920472', 2);
INSERT INTO Folks VALUES('1357900000000005', 'Marcus', 'Smart', 'Marc', '1995-07-15', '7982895013', '5927504816', 2);
INSERT INTO Folks VALUES('1357900000000006', 'Jake', 'LaRavia', NULL, '2000-01-16', '8502374065', '3850193850', 2);
INSERT INTO Folks VALUES('1357900000000007', 'Luka', 'Doncic', 'Don', '1999-04-01', '9175937102', NULL, 2);
INSERT INTO Folks VALUES('1357900000000008', 'Lamar', 'Jackson', 'Action', '1999-04-04', '9375897801', NULL, 3);
INSERT INTO Folks VALUES('1357900000000009', 'Zay', 'Flowers', NULL, '2003-02-05', '8018503917', '8018503928', 3);
INSERT INTO Folks VALUES('1357900000000010', 'Mark', 'Andrews', 'Mandrews', '1997-06-17', '4719287481', '4719287482', 3);
INSERT INTO Folks VALUES('1357900000000011', 'Derrick', 'Henry', NULL, '1997-02-11', '1846398172', '1927364931', 4);
INSERT INTO Folks VALUES('1357900000000012', 'Kyle', 'Hamilton', NULL, '2002-09-04', '9029374123', NULL, 4);
INSERT INTO Folks VALUES('1357900000000013', 'Malaki', 'Starks', 'Mali', '2004-01-01', '8027492017', NULL, 4);
INSERT INTO Folks VALUES('1357900000000014', 'Tyler', 'Loop', NULL, '2002-03-02', '6192830129', NULL, 4);
INSERT INTO Folks VALUES('1357900000000015', 'Max', 'Verstappen', NULL, '2000-07-17', '4438896250', NULL, 8);

-- Populate Folks_Email Relation
INSERT INTO Folks_Email VALUES('1357900000000000', 'mmallari@gmail.com');
INSERT INTO Folks_Email VALUES('1357900000000000', 'mmallari27@yahoo.com');
INSERT INTO Folks_Email VALUES('1357900000000001', 'areaves@gmail.com');
INSERT INTO Folks_Email VALUES('1357900000000002', 'rhachimura@gmail.com');
INSERT INTO Folks_Email VALUES('1357900000000003', 'ljames@gmail.com');
INSERT INTO Folks_Email VALUES('1357900000000003', 'ljames23@yahoo.com');
INSERT INTO Folks_Email VALUES('1357900000000003', 'ljames6@outlook.com');
INSERT INTO Folks_Email VALUES('1357900000000004', 'bjames3@gmail.com');
INSERT INTO Folks_Email VALUES('1357900000000005', 'msmart36@gmail.com');
INSERT INTO Folks_Email VALUES('1357900000000005', 'msmart30@yahoo.com');
INSERT INTO Folks_Email VALUES('1357900000000006', 'jlaravia@gmail.com');
INSERT INTO Folks_Email VALUES('1357900000000007', 'ldoncic77@gmail.com');
INSERT INTO Folks_Email VALUES('1357900000000007', 'thedon77@outlook.com');
INSERT INTO Folks_Email VALUES('1357900000000008', 'ljackson08@gmail.com');
INSERT INTO Folks_Email VALUES('1357900000000008', 'ljackson8@yahoo.com');
INSERT INTO Folks_Email VALUES('1357900000000009', 'zflowers4@gmail.com');
INSERT INTO Folks_Email VALUES('1357900000000010', 'mandrews89@gmail.com');
INSERT INTO Folks_Email VALUES('1357900000000011', 'dhenry22@gmail.com');
INSERT INTO Folks_Email VALUES('1357900000000011', 'dhenry022@yahoo.com');
INSERT INTO Folks_Email VALUES('1357900000000012', 'khamilton@gmail.com');
INSERT INTO Folks_Email VALUES('1357900000000013', 'mstarks@gmail.com');
INSERT INTO Folks_Email VALUES('1357900000000014', 'tloop@gmail.com');
INSERT INTO Folks_Email VALUES('1357900000000015', 'mverstappen@gmail.com');

-- Populate Election_Staff relation with 8 members
INSERT INTO Elections_Staff VALUES('1357900000000000', 'Clerk');
INSERT INTO Elections_Staff VALUES('1357900000000001', 'Clerk');
INSERT INTO Elections_Staff VALUES('1357900000000002', 'Clerk');
INSERT INTO Elections_Staff VALUES('1357900000000003', 'Clerk');
INSERT INTO Elections_Staff VALUES('1357900000000004', 'Monitor');
INSERT INTO Elections_Staff VALUES('1357900000000005', 'Monitor');
INSERT INTO Elections_Staff VALUES('1357900000000006', 'Monitor');
INSERT INTO Elections_Staff VALUES('1357900000000007', 'Monitor');

-- Populate Operating_Period Relation
-- Voting Center DAMA
INSERT INTO Operating_Period(start_datetime, end_datetime, place_id) VALUES('2026-01-09 08:00:00', '2026-01-09 17:00:00', 5);
INSERT INTO Operating_Period(start_datetime, end_datetime, place_id) VALUES('2026-01-11 08:30:00', '2026-01-11 17:30:00', 5);
INSERT INTO Operating_Period(start_datetime, end_datetime, place_id) VALUES('2026-01-19 08:00:00', '2026-01-19 17:00:00', 5);
INSERT INTO Operating_Period(start_datetime, end_datetime, place_id) VALUES('2026-02-14 08:30:00', '2026-02-14 17:30:00', 5);
-- Voting Center GERM
INSERT INTO Operating_Period(start_datetime, end_datetime, place_id) VALUES('2026-01-09 08:00:00', '2026-01-09 17:00:00', 6);
INSERT INTO Operating_Period(start_datetime, end_datetime, place_id) VALUES('2026-01-11 08:30:00', '2026-01-11 17:30:00', 6);
INSERT INTO Operating_Period(start_datetime, end_datetime, place_id) VALUES('2026-01-18 09:30:00', '2026-01-18 16:30:00', 6);
INSERT INTO Operating_Period(start_datetime, end_datetime, place_id) VALUES('2026-02-20 09:30:00', '2026-02-20 16:30:00', 6);
-- Voting Center ARLI
INSERT INTO Operating_Period(start_datetime, end_datetime, place_id) VALUES('2026-01-08 08:00:00', '2026-01-08 17:00:00', 7);
INSERT INTO Operating_Period(start_datetime, end_datetime, place_id) VALUES('2026-01-10 08:30:00', '2026-01-10 17:30:00', 7);
INSERT INTO Operating_Period(start_datetime, end_datetime, place_id) VALUES('2026-01-15 07:30:00', '2026-01-15 15:30:00', 7);
INSERT INTO Operating_Period(start_datetime, end_datetime, place_id) VALUES('2026-02-21 07:30:00', '2026-02-21 15:30:00', 7);
INSERT INTO Operating_Period(start_datetime, end_datetime, place_id) VALUES('2027-01-02 07:30:00', '2027-02-02 17:30:00', 7);
-- Voting Center ROCK
INSERT INTO Operating_Period(start_datetime, end_datetime, place_id) VALUES('2026-03-08 08:00:00', '2026-03-08 17:00:00', 11);
INSERT INTO Operating_Period(start_datetime, end_datetime, place_id) VALUES('2026-03-18 08:00:00', '2026-03-18 17:00:00', 11);
-- Voting Center BETH
INSERT INTO Operating_Period(start_datetime, end_datetime, place_id) VALUES('2026-03-18 08:00:00', '2026-03-18 17:00:00', 12);
INSERT INTO Operating_Period(start_datetime, end_datetime, place_id) VALUES('2026-03-19 08:00:00', '2026-03-19 17:00:00', 12);
-- Voting Center DAM2
INSERT INTO Operating_Period(start_datetime, end_datetime, place_id) VALUES('2026-01-02 08:00:00', '2026-01-02 17:00:00', 13);
INSERT INTO Operating_Period(start_datetime, end_datetime, place_id) VALUES('2026-01-03 08:00:00', '2026-01-03 17:00:00', 13);
-- Voting Center DAM3
INSERT INTO Operating_Period(start_datetime, end_datetime, place_id) VALUES('2026-01-02 08:00:00', '2026-01-02 17:00:00', 14);
INSERT INTO Operating_Period(start_datetime, end_datetime, place_id) VALUES('2026-01-04 08:00:00', '2026-01-04 17:00:00', 14);

-- Populate Works_At Relation
-- Worker 1 (Clerk)
INSERT INTO Works_At VALUES('1357900000000000', 5, '2026-01-09 08:00:00', '2026-01-09 17:00:00');
INSERT INTO Works_At VALUES('1357900000000000', 5, '2026-01-11 08:30:00', '2026-01-11 17:30:00');
INSERT INTO Works_At VALUES('1357900000000000', 5, '2026-01-19 08:00:00', '2026-01-19 17:00:00');
INSERT INTO Works_At VALUES('1357900000000000', 6, '2026-01-20 09:30:00', '2026-01-20 16:30:00');
-- Worker 5 (Monitor)
INSERT INTO Works_At VALUES('1357900000000004', 5, '2026-01-09 08:00:00', '2026-01-09 17:00:00');
INSERT INTO Works_At VALUES('1357900000000004', 5, '2026-01-11 08:30:00', '2026-01-11 17:30:00');
INSERT INTO Works_At VALUES('1357900000000004', 5, '2026-01-19 08:00:00', '2026-01-19 17:00:00');
INSERT INTO Works_At VALUES('1357900000000004', 6, '2026-02-20 09:30:00', '2026-02-20 16:30:00');
-- Worker 2 (Clerk)
INSERT INTO Works_At VALUES('1357900000000001', 6, '2026-01-09 08:00:00', '2026-01-09 17:00:00');
INSERT INTO Works_At VALUES('1357900000000001', 6, '2026-01-11 08:30:00', '2026-01-11 17:30:00');
INSERT INTO Works_At VALUES('1357900000000001', 6, '2026-01-18 09:30:00', '2026-01-18 16:30:00');
INSERT INTO Works_At VALUES('1357900000000001', 5, '2026-02-14 08:30:00', '2026-02-14 17:30:00');
-- Worker 6 (Monitor)
INSERT INTO Works_At VALUES('1357900000000005', 6, '2026-01-09 08:00:00', '2026-01-09 17:00:00');
INSERT INTO Works_At VALUES('1357900000000005', 6, '2026-01-11 08:30:00', '2026-01-11 17:30:00');
INSERT INTO Works_At VALUES('1357900000000005', 6, '2026-01-18 09:30:00', '2026-01-18 16:30:00');
INSERT INTO Works_At VALUES('1357900000000005', 5, '2026-02-14 08:30:00', '2026-02-14 17:30:00');
-- Worker 3 (Clerk)
INSERT INTO Works_At VALUES('1357900000000002', 7, '2026-01-08 08:00:00', '2026-01-08 17:00:00');
INSERT INTO Works_At VALUES('1357900000000002', 7, '2026-01-10 08:30:00', '2026-01-10 17:30:00');
INSERT INTO Works_At VALUES('1357900000000002', 7, '2026-01-15 07:30:00', '2026-01-15 15:30:00');
INSERT INTO Works_At VALUES('1357900000000002', 7, '2026-02-21 07:30:00', '2026-02-21 15:30:00');
-- Worker 7 (Monitor)
INSERT INTO Works_At VALUES('1357900000000006', 7, '2026-01-08 08:00:00', '2026-01-08 17:00:00');
INSERT INTO Works_At VALUES('1357900000000006', 7, '2026-01-10 08:30:00', '2026-01-10 17:30:00');
INSERT INTO Works_At VALUES('1357900000000006', 7, '2026-01-15 07:30:00', '2026-01-15 15:30:00');
INSERT INTO Works_At VALUES('1357900000000006', 7, '2026-02-21 07:30:00', '2026-02-21 15:30:00');
-- Worker 4 (Clerk)
INSERT INTO Works_At VALUES('1357900000000003', 5, '2026-01-09 08:00:00', '2026-01-09 17:00:00');
INSERT INTO Works_At VALUES('1357900000000003', 6, '2026-01-11 08:30:00', '2026-01-11 17:30:00');
INSERT INTO Works_At VALUES('1357900000000003', 7, '2026-01-15 07:30:00', '2026-01-15 15:30:00');
-- Worker 8 (Monitor)
INSERT INTO Works_At VALUES('1357900000000007', 5, '2026-01-09 08:00:00', '2026-01-09 17:00:00');
INSERT INTO Works_At VALUES('1357900000000007', 6, '2026-01-11 08:30:00', '2026-01-11 17:30:00');
INSERT INTO Works_At VALUES('1357900000000007', 7, '2026-01-15 07:30:00', '2026-01-15 15:30:00');

-- Populate Poll Relation
INSERT INTO Poll VALUES('XP01', 'Should we lower taxes?', '2026-01-01 00:00:01', '2026-01-21 17:30:00');
INSERT INTO Poll VALUES('XP02', 'Should we repave the roads?', '2026-01-01 00:00:01', '2026-01-21 17:30:00');
INSERT INTO Poll VALUES('XP03', 'Should we build a new government building?', '2026-02-01 00:00:01', '2026-02-22 15:30:00');
INSERT INTO Poll VALUES('XP04', 'Should we build a zoo?', '2026-02-01 00:00:01', '2026-02-22 15:30:00');
INSERT INTO Poll VALUES('XP05', 'Should we build a spaceship?', '2026-03-01 00:00:01', '2026-03-29 15:30:00');
INSERT INTO Poll VALUES('XP06', 'Should we build a school?', '2026-01-01 00:00:01', '2026-01-29 15:30:00');
INSERT INTO Poll VALUES('XP07', 'Should we build a prison?', '2026-01-01 00:00:01', '2026-01-29 15:30:00');

-- Populate Voting_Registration Relation
-- Center 5 (DAMA) in January
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-01-09', '1357900000000000', 5);
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-01-09', '1357900000000001', 5);
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-01-09', '1357900000000002', 5);
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-01-11', '1357900000000003', 5);
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-01-11', '1357900000000011', 5);
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-01-11', '1357900000000012', 5);
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-01-19', '1357900000000013', 5);
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-01-19', '1357900000000014', 5);
-- Center 6 (GERM) in January
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-01-09', '1357900000000004', 6);
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-01-09', '1357900000000005', 6);
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-01-11', '1357900000000006', 6);
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-01-11', '1357900000000007', 6);
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-01-18', '1357900000000000', 6);
-- Center 7 (ARLI) in January
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-01-08', '1357900000000008', 7);
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-01-10', '1357900000000009', 7);
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-01-15', '1357900000000010', 7);

-- Center 5 (DAMA) in February
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-02-14', '1357900000000000', 5);
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-02-14', '1357900000000001', 5);
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-02-14', '1357900000000002', 5);
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-02-14', '1357900000000003', 5);
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-02-14', '1357900000000011', 5);
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-02-14', '1357900000000012', 5);
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-02-14', '1357900000000013', 5);
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-02-14', '1357900000000014', 5);
-- Center 6 (GERM) in February
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-02-20', '1357900000000004', 6);
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-02-20', '1357900000000005', 6);
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-02-20', '1357900000000006', 6);
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-02-20', '1357900000000007', 6);
-- Center 7 (ARLI) in February
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-02-21', '1357900000000008', 7);
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-02-21', '1357900000000009', 7);
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-02-21', '1357900000000010', 7);

-- Center 11 (ROCK) in MARCH
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-03-08', '1357900000000008', 11);
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-03-18', '1357900000000009', 11);
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-03-08', '1357900000000010', 11);
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-03-18', '1357900000000014', 11);
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-03-08', '1357900000000000', 11);
-- Center 12 (BETH) in MARCH
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-03-08', '1357900000000007', 12);
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-03-19', '1357900000000000', 12);
-- Center 13 (DAM2) in January
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-01-02', '1357900000000002', 13);
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-01-02', '1357900000000003', 13);
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-01-02', '1357900000000004', 13);
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-01-02', '1357900000000000', 13);
-- Center 14 (DAM3) in January
INSERT INTO Voting_Registration(desired_voting_date, folk_id, center_id) VALUES ('2026-01-04', '1357900000000000', 14);

-- Populate Ballot Relation
INSERT INTO Ballot(voter_choice, cast_datetime, registration_id, poll_name_id) VALUES('YES', '2026-01-09 10:30:00', 1, 'XP01');
INSERT INTO Ballot(voter_choice, cast_datetime, registration_id, poll_name_id) VALUES('YES', '2026-01-09 12:35:00', 2, 'XP01');
INSERT INTO Ballot(voter_choice, cast_datetime, registration_id, poll_name_id) VALUES('NO', '2026-01-09 15:30:00', 3, 'XP01');
INSERT INTO Ballot(voter_choice, cast_datetime, registration_id, poll_name_id) VALUES('NO', '2026-01-09 10:30:00', 1, 'XP02');
INSERT INTO Ballot(voter_choice, cast_datetime, registration_id, poll_name_id) VALUES('YES', '2026-01-09 12:35:00', 2, 'XP02');
INSERT INTO Ballot(voter_choice, cast_datetime, registration_id, poll_name_id) VALUES('NO', '2026-01-09 15:30:00', 3, 'XP02');
INSERT INTO Ballot(voter_choice, cast_datetime, registration_id, poll_name_id) VALUES('YES', '2026-01-11 11:30:00', 11, 'XP01');
INSERT INTO Ballot(voter_choice, cast_datetime, registration_id, poll_name_id) VALUES('YES', '2026-01-11 13:30:00', 12, 'XP01');
INSERT INTO Ballot(voter_choice, cast_datetime, registration_id, poll_name_id) VALUES('YES', '2026-01-11 11:30:00', 11, 'XP02');
INSERT INTO Ballot(voter_choice, cast_datetime, registration_id, poll_name_id) VALUES('NO', '2026-01-11 13:30:00', 12, 'XP02');
INSERT INTO Ballot(voter_choice, cast_datetime, registration_id, poll_name_id) VALUES('YES', '2026-01-15 14:30:00', 15, 'XP01');
INSERT INTO Ballot(voter_choice, cast_datetime, registration_id, poll_name_id) VALUES('YES', '2026-01-15 14:30:00', 15, 'XP02');
INSERT INTO Ballot(voter_choice, cast_datetime, registration_id, poll_name_id) VALUES('ABSTAIN', '2026-02-14 09:00:00', 20, 'XP03');
INSERT INTO Ballot(voter_choice, cast_datetime, registration_id, poll_name_id) VALUES('YES', '2026-02-14 09:30:00', 21, 'XP03');
INSERT INTO Ballot(voter_choice, cast_datetime, registration_id, poll_name_id) VALUES('NO', '2026-02-14 09:00:00', 20, 'XP04');
INSERT INTO Ballot(voter_choice, cast_datetime, registration_id, poll_name_id) VALUES('NO', '2026-02-14 09:30:00', 21, 'XP04');
INSERT INTO Ballot(voter_choice, cast_datetime, registration_id, poll_name_id) VALUES('YES', '2026-02-20 11:30:00', 24, 'XP03');
INSERT INTO Ballot(voter_choice, cast_datetime, registration_id, poll_name_id) VALUES('YES', '2026-02-20 10:45:00', 25, 'XP03');
INSERT INTO Ballot(voter_choice, cast_datetime, registration_id, poll_name_id) VALUES('NO', '2026-02-20 11:30:00', 24, 'XP04');
INSERT INTO Ballot(voter_choice, cast_datetime, registration_id, poll_name_id) VALUES('ABSTAIN', '2026-02-20 10:45:00', 25, 'XP04');
INSERT INTO Ballot(voter_choice, cast_datetime, registration_id, poll_name_id) VALUES('NO', '2026-02-21 08:30:00', 28, 'XP03');
INSERT INTO Ballot(voter_choice, cast_datetime, registration_id, poll_name_id) VALUES('YES', '2026-02-21 08:30:00', 28, 'XP04');