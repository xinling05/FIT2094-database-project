/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T2-oo-insert.sql

--Student ID: 35664029
--Student Name: Xin Ling Chong

/* GenAI Acknowledgement and Prompts:
I used ChatGPT (GPT-5 Thinking) to help me generate sample data for address_street,address_town,address_pcode and country_code 
in the ADDRESS table as well as passenger_fname, passenger_lname and passenger_gender in the PASSENGER table.I reviewed and edited 
the generated data to make sure it complies with the FIT2094 S2 2025 Assignment 2 brief (Task 2) and produce complete test data for 
tables. No AI assistance was used for the MANIFEST data ,I created those manually from the provided information in 
oo-schema-insert.sql file.

Prompts used:
"Generate 10 fictional addresses across Australia, New Zealand, United Kingdom of Great Britain and Northern Ireland and 
Singapore with street, town, postcode and country code (AUS/NZL/GBR/SGP)."

"Generate 20 fictional first and last names, and also gender."

*/

-- Task 2 Load the ADDRESS, PASSENGER and MANIFEST tables with your own
-- test data following the data requirements expressed in the brief

-- =======================================
-- ADDRESS — 10 rows, at least 3 different countries
-- Keys used: address_id = 11..20  (all < 100)
-- =======================================
-- AUS = Australia, NZL = New Zealand, GBR = United Kingdom, SGP = Singapore

INSERT INTO address (
    address_id,
    address_street,
    address_town,
    address_pcode,
    country_code
) VALUES ( 11,
           '12 Lygon St',
           'Melbourne',
           '3000',
           'AUS' );

INSERT INTO address (
    address_id,
    address_street,
    address_town,
    address_pcode,
    country_code
) VALUES ( 12,
           '88 George St',
           'Sydney',
           '2000',
           'AUS' );

INSERT INTO address (
    address_id,
    address_street,
    address_town,
    address_pcode,
    country_code
) VALUES ( 13,
           '5 Riverwalk Ave',
           'Brisbane',
           '4000',
           'AUS' );

INSERT INTO address (
    address_id,
    address_street,
    address_town,
    address_pcode,
    country_code
) VALUES ( 14,
           '41 Queen St',
           'Auckland',
           '1010',
           'NZL' );

INSERT INTO address (
    address_id,
    address_street,
    address_town,
    address_pcode,
    country_code
) VALUES ( 15,
           '9 Terrace Rd',
           'Wellington',
           '6011',
           'NZL' );

INSERT INTO address (
    address_id,
    address_street,
    address_town,
    address_pcode,
    country_code
) VALUES ( 16,
           '221 Fleet St',
           'London',
           'EC4Y',
           'GBR' );

INSERT INTO address (
    address_id,
    address_street,
    address_town,
    address_pcode,
    country_code
) VALUES ( 17,
           '4 Orchard Link',
           'Singapore',
           '2388',
           'SGP' );

INSERT INTO address (
    address_id,
    address_street,
    address_town,
    address_pcode,
    country_code
) VALUES ( 18,
           '77 St Georges Tce',
           'Perth',
           '6000',
           'AUS' );

INSERT INTO address (
    address_id,
    address_street,
    address_town,
    address_pcode,
    country_code
) VALUES ( 19,
           '3 North Tce',
           'Adelaide',
           '5000',
           'AUS' );

INSERT INTO address (
    address_id,
    address_street,
    address_town,
    address_pcode,
    country_code
) VALUES ( 20,
           '18 Colombo St',
           'Christchurch',
           '8011',
           'NZL' );

-- =======================================
-- PASSENGER — 20 rows, at least 5 under 18
-- Keys used: passenger_id = 21..40  (all < 100)
--   - Minors: NULL contact, guardian_id set to their adult’s passenger_id
--   - Adults: contacts include both with and without leading '+'
-- =======================================
-- Adults
INSERT INTO passenger (
    passenger_id,
    passenger_fname,
    passenger_lname,
    passenger_dob,
    passenger_gender,
    passenger_contact,
    passenger_specialneed,
    address_id,
    guardian_id
) VALUES ( 21,
           'Ethan',
           'Zhou',
           TO_DATE('14-Apr-1984','dd-Mon-yyyy'),
           'M',
           '+61490300001',
           'Y',
           11,
           NULL );

INSERT INTO passenger (
    passenger_id,
    passenger_fname,
    passenger_lname,
    passenger_dob,
    passenger_gender,
    passenger_contact,
    passenger_specialneed,
    address_id,
    guardian_id
) VALUES ( 22,
           'Mei',
           'Tan',
           TO_DATE('02-Feb-1992','dd-Mon-yyyy'),
           'F',
           '0290001111',
           'N',
           12,
           NULL );

INSERT INTO passenger (
    passenger_id,
    passenger_fname,
    passenger_lname,
    passenger_dob,
    passenger_gender,
    passenger_contact,
    passenger_specialneed,
    address_id,
    guardian_id
) VALUES ( 23,
           'Lucas',
           'Patel',
           TO_DATE('28-Aug-1988','dd-Mon-yyyy'),
           'M',
           '+61731234567',
           'N',
           13,
           NULL );

INSERT INTO passenger (
    passenger_id,
    passenger_fname,
    passenger_lname,
    passenger_dob,
    passenger_gender,
    passenger_contact,
    passenger_specialneed,
    address_id,
    guardian_id
) VALUES ( 24,
           'Grace',
           'Patel',
           TO_DATE('03-Mar-1991','dd-Mon-yyyy'),
           'F',
           '+61731234568',
           'N',
           13,
           NULL );

INSERT INTO passenger (
    passenger_id,
    passenger_fname,
    passenger_lname,
    passenger_dob,
    passenger_gender,
    passenger_contact,
    passenger_specialneed,
    address_id,
    guardian_id
) VALUES ( 25,
           'Oliver',
           'Bennett',
           TO_DATE('19-Sep-1980','dd-Mon-yyyy'),
           'M',
           '+442079001111',
           'N',
           16,
           NULL );

INSERT INTO passenger (
    passenger_id,
    passenger_fname,
    passenger_lname,
    passenger_dob,
    passenger_gender,
    passenger_contact,
    passenger_specialneed,
    address_id,
    guardian_id
) VALUES ( 27,
           'Jack',
           'Connor',
           TO_DATE('09-Jan-1982','dd-Mon-yyyy'),
           'M',
           '0880002222',
           'N',
           19,
           NULL );

INSERT INTO passenger (
    passenger_id,
    passenger_fname,
    passenger_lname,
    passenger_dob,
    passenger_gender,
    passenger_contact,
    passenger_specialneed,
    address_id,
    guardian_id
) VALUES ( 29,
           'Aria',
           'Wong',
           TO_DATE('11-Nov-1993','dd-Mon-yyyy'),
           'F',
           '+6495550101',
           'N',
           14,
           NULL );

INSERT INTO passenger (
    passenger_id,
    passenger_fname,
    passenger_lname,
    passenger_dob,
    passenger_gender,
    passenger_contact,
    passenger_specialneed,
    address_id,
    guardian_id
) VALUES ( 31,
           'Henry',
           'Brooks',
           TO_DATE('22-Jun-1985','dd-Mon-yyyy'),
           'M',
           '+6445550202',
           'N',
           15,
           NULL );

INSERT INTO passenger (
    passenger_id,
    passenger_fname,
    passenger_lname,
    passenger_dob,
    passenger_gender,
    passenger_contact,
    passenger_specialneed,
    address_id,
    guardian_id
) VALUES ( 32,
           'Sophia',
           'Brooks',
           TO_DATE('13-May-1987','dd-Mon-yyyy'),
           'F',
           '+6445550203',
           'N',
           15,
           NULL );

INSERT INTO passenger (
    passenger_id,
    passenger_fname,
    passenger_lname,
    passenger_dob,
    passenger_gender,
    passenger_contact,
    passenger_specialneed,
    address_id,
    guardian_id
) VALUES ( 33,
           'Ava',
           'Lim',
           TO_DATE('07-Jul-1995','dd-Mon-yyyy'),
           'F',
           '+6591234567',
           'N',
           17,
           NULL );

INSERT INTO passenger (
    passenger_id,
    passenger_fname,
    passenger_lname,
    passenger_dob,
    passenger_gender,
    passenger_contact,
    passenger_specialneed,
    address_id,
    guardian_id
) VALUES ( 35,
           'Chloe',
           'Martin',
           TO_DATE('30-Oct-1990','dd-Mon-yyyy'),
           'F',
           '+6187000333',
           'N',
           18,
           NULL );

INSERT INTO passenger (
    passenger_id,
    passenger_fname,
    passenger_lname,
    passenger_dob,
    passenger_gender,
    passenger_contact,
    passenger_specialneed,
    address_id,
    guardian_id
) VALUES ( 37,
           'Zara',
           'Hughes',
           TO_DATE('25-Dec-1986','dd-Mon-yyyy'),
           'F',
           '+442071234567',
           'N',
           16,
           NULL );

INSERT INTO passenger (
    passenger_id,
    passenger_fname,
    passenger_lname,
    passenger_dob,
    passenger_gender,
    passenger_contact,
    passenger_specialneed,
    address_id,
    guardian_id
) VALUES ( 39,
           'Maya',
           'Chen',
           TO_DATE('04-Apr-1998','dd-Mon-yyyy'),
           'F',
           '+61490300002',
           'N',
           11,
           NULL );

-- Minors (≥ 5): guardian set to an adult
INSERT INTO passenger (
    passenger_id,
    passenger_fname,
    passenger_lname,
    passenger_dob,
    passenger_gender,
    passenger_contact,
    passenger_specialneed,
    address_id,
    guardian_id
) VALUES ( 26,
           'Isla',
           'Bennett',
           TO_DATE('10-Oct-2012','dd-Mon-yyyy'),
           'F',
           NULL,
           'N',
           16,
           25 );

INSERT INTO passenger (
    passenger_id,
    passenger_fname,
    passenger_lname,
    passenger_dob,
    passenger_gender,
    passenger_contact,
    passenger_specialneed,
    address_id,
    guardian_id
) VALUES ( 28,
           'Lily',
           'Connor',
           TO_DATE('15-Jan-2011','dd-Mon-yyyy'),
           'F',
           NULL,
           'N',
           19,
           27 );

INSERT INTO passenger (
    passenger_id,
    passenger_fname,
    passenger_lname,
    passenger_dob,
    passenger_gender,
    passenger_contact,
    passenger_specialneed,
    address_id,
    guardian_id
) VALUES ( 30,
           'Mason',
           'Wong',
           TO_DATE('05-May-2014','dd-Mon-yyyy'),
           'M',
           NULL,
           'N',
           14,
           29 );

INSERT INTO passenger (
    passenger_id,
    passenger_fname,
    passenger_lname,
    passenger_dob,
    passenger_gender,
    passenger_contact,
    passenger_specialneed,
    address_id,
    guardian_id
) VALUES ( 34,
           'Noah',
           'Lim',
           TO_DATE('21-Sep-2015','dd-Mon-yyyy'),
           'M',
           NULL,
           'Y',
           17,
           33 );

INSERT INTO passenger (
    passenger_id,
    passenger_fname,
    passenger_lname,
    passenger_dob,
    passenger_gender,
    passenger_contact,
    passenger_specialneed,
    address_id,
    guardian_id
) VALUES ( 36,
           'Leo',
           'Martin',
           TO_DATE('03-Mar-2010','dd-Mon-yyyy'),
           'M',
           NULL,
           'N',
           18,
           35 );

INSERT INTO passenger (
    passenger_id,
    passenger_fname,
    passenger_lname,
    passenger_dob,
    passenger_gender,
    passenger_contact,
    passenger_specialneed,
    address_id,
    guardian_id
) VALUES ( 38,
           'Finn',
           'Hughes',
           TO_DATE('18-Aug-2013','dd-Mon-yyyy'),
           'M',
           NULL,
           'N',
           16,
           37 );

INSERT INTO passenger (
    passenger_id,
    passenger_fname,
    passenger_lname,
    passenger_dob,
    passenger_gender,
    passenger_contact,
    passenger_specialneed,
    address_id,
    guardian_id
) VALUES ( 40,
           'Ryan',
           'Chen',
           TO_DATE('12-Dec-2012','dd-Mon-yyyy'),
           'M',
           NULL,
           'N',
           11,
           39 );

-- =======================================
-- MANIFEST — 32 rows
-- Keys used: manifest_id = 61..92  (all < 100)
-- Requirements hit:
--     - ≥5 cruises across ≥3 ships  (using cruises 1,4,5,6,7,8,9,10 across ships 101,102,103,105)
--     - ≥2 passengers with >1 cruise  (e.g., #21 and #23, plus more below)
--     - ≥2 no-shows (NULL board time)  (e.g., #39 on cruise 8; #37 on cruise 10)
--     - ≥2 passengers book FUTURE cruises (strictly after 03-Nov-2025)  (cruises 8,9,10)
-- Boarding times are set BEFORE depart datetime for each cruise.
-- Cabin numbers exist on the specified ships (per oo-schema-insert.sql).
-- =======================================
-- Cruise reference (from supplied data):
--   1: Australian Circumnavigation (ship 101)  dep 02-Jun-2025 10:00
--   4: Queensland Islands (ship 101)           dep 07-Jul-2025 14:00
--   5: Brisbane to Hobart (ship 102)           dep 08-Jul-2025 10:30
--   6: Australian Circumnavigation (ship 101)  dep 18-Sep-2025 16:00
--   7: Melbourne to Auckland (ship 103)        dep 23-Oct-2025 15:00
--   8: Melbourne to Singapore (ship 105)       dep 30-Nov-2025 09:30   <-- FUTURE
--   9: Queensland Islands (ship 101)           dep 06-Dec-2025 14:00   <-- FUTURE
--  10: New Zealand Christmas Sail (ship 102)   dep 20-Dec-2025 09:00   <-- FUTURE 

-- Helper: example cabin sets known to exist
-- ship 101: 1001,1002,1003,1004,1011  | ship 102: 2001,2002,2003,2004
-- ship 103: 110                       | ship 105: 8031,8032

-- Cruise 1 (ship 101) — pair
INSERT INTO manifest (manifest_id, cruise_id, passenger_id, ship_code, cabin_no, manifest_board_datetime)
VALUES (61, 1, 21, 101, '1001', TO_DATE('01-Jun-2025 12:00','dd-Mon-yyyy hh24:mi'));

INSERT INTO manifest (manifest_id, cruise_id, passenger_id, ship_code, cabin_no, manifest_board_datetime)
VALUES (62, 1, 22, 101, '1001', TO_DATE('01-Jun-2025 12:05','dd-Mon-yyyy hh24:mi'));

-- Cruise 4 (ship 101) — pair
INSERT INTO manifest (manifest_id, cruise_id, passenger_id, ship_code, cabin_no, manifest_board_datetime)
VALUES (63, 4, 23, 101, '1002', TO_DATE('06-Jul-2025 17:00','dd-Mon-yyyy hh24:mi'));

INSERT INTO manifest (manifest_id, cruise_id, passenger_id, ship_code, cabin_no, manifest_board_datetime)
VALUES (64, 4, 24, 101, '1002', TO_DATE('06-Jul-2025 17:03','dd-Mon-yyyy hh24:mi'));

-- Cruise 5 (ship 102) — adult + minor (guardian=25)
INSERT INTO manifest (manifest_id, cruise_id, passenger_id, ship_code, cabin_no, manifest_board_datetime)
VALUES (65, 5, 25, 102, '2001', TO_DATE('07-Jul-2025 12:00','dd-Mon-yyyy hh24:mi'));

INSERT INTO manifest (manifest_id, cruise_id, passenger_id, ship_code, cabin_no, manifest_board_datetime)
VALUES (66, 5, 26, 102, '2001', TO_DATE('07-Jul-2025 12:02','dd-Mon-yyyy hh24:mi'));

-- Cruise 6 (ship 101) — adult + minor (guardian=27)
INSERT INTO manifest (manifest_id, cruise_id, passenger_id, ship_code, cabin_no, manifest_board_datetime)
VALUES (67, 6, 27, 101, '1011', TO_DATE('18-Sep-2025 09:00','dd-Mon-yyyy hh24:mi'));

INSERT INTO manifest (manifest_id, cruise_id, passenger_id, ship_code, cabin_no, manifest_board_datetime)
VALUES (68, 6, 28, 101, '1011', TO_DATE('18-Sep-2025 09:02','dd-Mon-yyyy hh24:mi'));

-- Cruise 7 (ship 103) — adult + minor (guardian=29)
INSERT INTO manifest (manifest_id, cruise_id, passenger_id, ship_code, cabin_no, manifest_board_datetime)
VALUES (69, 7, 29, 103, '110',  TO_DATE('22-Oct-2025 12:00','dd-Mon-yyyy hh24:mi'));

INSERT INTO manifest (manifest_id, cruise_id, passenger_id, ship_code, cabin_no, manifest_board_datetime)
VALUES (70, 7, 30, 103, '110',  TO_DATE('22-Oct-2025 12:05','dd-Mon-yyyy hh24:mi'));

-- Cruise 8 (ship 105, FUTURE) — multiple
INSERT INTO manifest (manifest_id, cruise_id, passenger_id, ship_code, cabin_no, manifest_board_datetime)
VALUES (71, 8, 21, 105, '8031', TO_DATE('29-Nov-2025 10:00','dd-Mon-yyyy hh24:mi'));  -- repeat passenger (>1 cruise)

INSERT INTO manifest (manifest_id, cruise_id, passenger_id, ship_code, cabin_no, manifest_board_datetime)
VALUES (72, 8, 31, 105, '8031', TO_DATE('29-Nov-2025 10:02','dd-Mon-yyyy hh24:mi'));

INSERT INTO manifest (manifest_id, cruise_id, passenger_id, ship_code, cabin_no, manifest_board_datetime)
VALUES (73, 8, 32, 105, '8032', TO_DATE('29-Nov-2025 10:05','dd-Mon-yyyy hh24:mi'));

INSERT INTO manifest (manifest_id, cruise_id, passenger_id, ship_code, cabin_no, manifest_board_datetime)
VALUES (74, 8, 39, 105, '8032', NULL);  -- no-show #1

-- Cruise 9 (ship 101, FUTURE) — adult + minor (guardian=33)
INSERT INTO manifest (manifest_id, cruise_id, passenger_id, ship_code, cabin_no, manifest_board_datetime)
VALUES (75, 9, 33, 101, '1003', TO_DATE('05-Dec-2025 18:00','dd-Mon-yyyy hh24:mi'));

INSERT INTO manifest (manifest_id, cruise_id, passenger_id, ship_code, cabin_no, manifest_board_datetime)
VALUES (76, 9, 34, 101, '1003', TO_DATE('05-Dec-2025 18:05','dd-Mon-yyyy hh24:mi'));

-- Cruise 10 (ship 102, FUTURE) — adult + minor (guardian=35) plus one no-show
INSERT INTO manifest (manifest_id, cruise_id, passenger_id, ship_code, cabin_no, manifest_board_datetime)
VALUES (77, 10, 35, 102, '2002', TO_DATE('19-Dec-2025 08:00','dd-Mon-yyyy hh24:mi'));

INSERT INTO manifest (manifest_id, cruise_id, passenger_id, ship_code, cabin_no, manifest_board_datetime)
VALUES (78, 10, 36, 102, '2002', TO_DATE('19-Dec-2025 08:02','dd-Mon-yyyy hh24:mi'));

INSERT INTO manifest (manifest_id, cruise_id, passenger_id, ship_code, cabin_no, manifest_board_datetime)
VALUES (79, 10, 37, 102, '2003', NULL);  -- no-show #2

INSERT INTO manifest (manifest_id, cruise_id, passenger_id, ship_code, cabin_no, manifest_board_datetime)
VALUES (80, 10, 38, 102, '2003', TO_DATE('19-Dec-2025 08:10','dd-Mon-yyyy hh24:mi'));

-- Extra bookings to reach 30 entries and create ≥2 repeat passengers
-- Repeat #2 (23 & 24 take another cruise): Cruise 1 again
INSERT INTO manifest (manifest_id, cruise_id, passenger_id, ship_code, cabin_no, manifest_board_datetime)
VALUES (81, 1, 23, 101, '1004', TO_DATE('01-Jun-2025 12:30','dd-Mon-yyyy hh24:mi'));

INSERT INTO manifest (manifest_id, cruise_id, passenger_id, ship_code, cabin_no, manifest_board_datetime)
VALUES (82, 1, 24, 101, '1004', TO_DATE('01-Jun-2025 12:32','dd-Mon-yyyy hh24:mi'));

-- Repeat #3 (31 & 32 also did Cruise 6 earlier in the season)
INSERT INTO manifest (manifest_id, cruise_id, passenger_id, ship_code, cabin_no, manifest_board_datetime)
VALUES (83, 6, 31, 101, '1002', TO_DATE('18-Sep-2025 09:05','dd-Mon-yyyy hh24:mi'));

INSERT INTO manifest (manifest_id, cruise_id, passenger_id, ship_code, cabin_no, manifest_board_datetime)
VALUES (84, 6, 32, 101, '1002', TO_DATE('18-Sep-2025 09:07','dd-Mon-yyyy hh24:mi'));

-- Repeat #4 (25 & 26 also doing Cruise 9, FUTURE)
INSERT INTO manifest (manifest_id, cruise_id, passenger_id, ship_code, cabin_no, manifest_board_datetime)
VALUES (85, 9, 25, 101, '1002', TO_DATE('05-Dec-2025 18:15','dd-Mon-yyyy hh24:mi'));

INSERT INTO manifest (manifest_id, cruise_id, passenger_id, ship_code, cabin_no, manifest_board_datetime)
VALUES (86, 9, 26, 101, '1002', TO_DATE('05-Dec-2025 18:17','dd-Mon-yyyy hh24:mi'));

-- Extra FUTURE diversity on Cruise 8
INSERT INTO manifest (manifest_id, cruise_id, passenger_id, ship_code, cabin_no, manifest_board_datetime)
VALUES (87, 8, 33, 105, '8032', TO_DATE('29-Nov-2025 10:20','dd-Mon-yyyy hh24:mi'));

INSERT INTO manifest (manifest_id, cruise_id, passenger_id, ship_code, cabin_no, manifest_board_datetime)
VALUES (88, 8, 34, 105, '8032', TO_DATE('29-Nov-2025 10:22','dd-Mon-yyyy hh24:mi'));

-- Give Chen family one completed past cruise on ship 102 for variety
INSERT INTO manifest (manifest_id, cruise_id, passenger_id, ship_code, cabin_no, manifest_board_datetime)
VALUES (89, 5, 39, 102, '2004', TO_DATE('07-Jul-2025 12:10','dd-Mon-yyyy hh24:mi'));

INSERT INTO manifest (manifest_id, cruise_id, passenger_id, ship_code, cabin_no, manifest_board_datetime)
VALUES (90, 5, 40, 102, '2004', TO_DATE('07-Jul-2025 12:12','dd-Mon-yyyy hh24:mi'));

--One more extra booking for passenger_id 21 and 31 to have >2 cruises
INSERT INTO manifest (manifest_id, cruise_id, passenger_id, ship_code, cabin_no, manifest_board_datetime)
VALUES (91, 6, 21, 101, '1003', TO_DATE('18-Sep-2025 09:10','dd-Mon-yyyy hh24:mi'));

INSERT INTO manifest (manifest_id, cruise_id, passenger_id, ship_code, cabin_no, manifest_board_datetime)
VALUES (92, 9, 31, 101, '1001', TO_DATE('05-Dec-2025 18:25','dd-Mon-yyyy hh24:mi'));

COMMIT;