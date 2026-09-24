--****PLEASE ENTER YOUR DETAILS BELOW****
--T3-oo-dm.sql

--Student ID: 35664029
--Student Name: Xin Ling Chong

--(a)
-- Drop sequences if they exist
DROP SEQUENCE address_seq;
DROP SEQUENCE passenger_seq;
DROP SEQUENCE manifest_seq;

-- Create sequences
CREATE SEQUENCE address_seq START WITH 500 INCREMENT BY 5;
CREATE SEQUENCE passenger_seq START WITH 500 INCREMENT BY 5;
CREATE SEQUENCE manifest_seq START WITH 500 INCREMENT BY 5;

--(b)
-- Start of transaction for Kohl family booking
COMMIT; -- Commit any previous work

-- Insert new address for the family
INSERT INTO address (
    address_id,
    address_street,
    address_town,
    address_pcode,
    country_code
) VALUES ( address_seq.NEXTVAL,
           '23 Banksia Avenue',
           'Melbourne',
           '3000',
           (
               SELECT country_code
                 FROM country
                WHERE country_name = 'Australia'
           ) );

-- Insert Dominik Kohl (Father/Guardian)
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
) VALUES ( passenger_seq.NEXTVAL,
           'Dominik',
           'Kohl',
           TO_DATE('1985-04-10','YYYY-MM-DD'), -- Sensible DOB
           'M', -- Sensible Gender
           '+61493336312',
           'N', -- Sensible special need
           address_seq.CURRVAL,
           NULL );

-- Insert Stella Kohl (Daughter 1, minor)
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
) VALUES ( passenger_seq.NEXTVAL,
           'Stella',
           'Kohl',
           TO_DATE('2010-06-20','YYYY-MM-DD'), -- Sensible DOB (under 18)
           'F', -- Sensible Gender
           NULL,
           'N', -- Sensible special need
           address_seq.CURRVAL,
           passenger_seq.CURRVAL - 5 -- Dominik's ID
            );

-- Insert Poppy Kohl (Daughter 2, minor)
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
) VALUES ( passenger_seq.NEXTVAL,
           'Poppy',
           'Kohl',
           TO_DATE('2012-09-15','YYYY-MM-DD'), -- Sensible DOB (under 18)
           'F', -- Sensible Gender
           NULL,
           'N', -- Sensible special need
           address_seq.CURRVAL,
           passenger_seq.CURRVAL - 10 -- Dominik's ID
            );

-- Insert Manifest entry for Dominik
INSERT INTO manifest (
    manifest_id,
    passenger_id,
    cruise_id,
    manifest_board_datetime,
    ship_code,
    cabin_no
) VALUES ( manifest_seq.NEXTVAL,
           (
               SELECT passenger_id
                 FROM passenger
                WHERE upper(passenger_fname) = upper('Dominik')
                  AND upper(passenger_lname) = upper('Kohl')
           ),
           (
               SELECT cruise_id
                 FROM cruise
                WHERE upper(cruise_name) = upper('Melbourne to Singapore')
                  AND cruise_depart_dt = TO_DATE('30-Nov-2025 09:30','dd-Mon-yyyy hh24:mi'
                  )
           ),
           NULL,
           (
               SELECT ship_code
                 FROM cruise
                WHERE upper(cruise_name) = upper('Melbourne to Singapore')
                  AND cruise_depart_dt = TO_DATE('30-Nov-2025 09:30','dd-Mon-yyyy hh24:mi'
                  )
           ),
           '8035' );

-- Insert Manifest entry for Stella
INSERT INTO manifest (
    manifest_id,
    passenger_id,
    cruise_id,
    manifest_board_datetime,
    ship_code,
    cabin_no
) VALUES ( manifest_seq.NEXTVAL,
           (
               SELECT passenger_id
                 FROM passenger
                WHERE upper(passenger_fname) = upper('Stella')
                  AND upper(passenger_lname) = upper('Kohl')
           ),
           (
               SELECT cruise_id
                 FROM cruise
                WHERE upper(cruise_name) = upper('Melbourne to Singapore')
                  AND cruise_depart_dt = TO_DATE('30-Nov-2025 09:30','dd-Mon-yyyy hh24:mi'
                  )
           ),
           NULL,
           (
               SELECT ship_code
                 FROM cruise
                WHERE upper(cruise_name) = upper('Melbourne to Singapore')
                  AND cruise_depart_dt = TO_DATE('30-Nov-2025 09:30','dd-Mon-yyyy hh24:mi'
                  )
           ),
           '8035' );

-- Insert Manifest entry for Poppy
INSERT INTO manifest (
    manifest_id,
    passenger_id,
    cruise_id,
    manifest_board_datetime,
    ship_code,
    cabin_no
) VALUES ( manifest_seq.NEXTVAL,
           (
               SELECT passenger_id
                 FROM passenger
                WHERE upper(passenger_fname) = upper('Poppy')
                  AND upper(passenger_lname) = upper('Kohl')
           ),
           (
               SELECT cruise_id
                 FROM cruise
                WHERE upper(cruise_name) = upper('Melbourne to Singapore')
                  AND cruise_depart_dt = TO_DATE('30-Nov-2025 09:30','dd-Mon-yyyy hh24:mi'
                  )
           ),
           NULL,
           (
               SELECT ship_code
                 FROM cruise
                WHERE upper(cruise_name) = upper('Melbourne to Singapore')
                  AND cruise_depart_dt = TO_DATE('30-Nov-2025 09:30','dd-Mon-yyyy hh24:mi'
                  )
           ),
           '8035' );

COMMIT; -- End of transaction for Kohl family booking

--(c)
COMMIT; -- Commit any previous work

-- Cancel Stella's booking from the manifest
DELETE FROM manifest
WHERE
    passenger_id = (
        SELECT
            passenger_id
        FROM
            passenger
        WHERE
            upper(passenger_fname) = upper('Stella')
            AND upper(passenger_lname) = upper('Kohl')
    )
    AND cruise_id = (
        SELECT
            cruise_id
        FROM
            cruise
        WHERE
            upper(cruise_name) = upper('Melbourne to Singapore')
            AND cruise_depart_dt = TO_DATE('30-Nov-2025 09:30', 'dd-Mon-yyyy hh24:mi')
    );

-- Update Dominik's cabin and Poppy's cabin to 9015
UPDATE manifest
SET
    cabin_no = '9015'
WHERE
    passenger_id IN (
        (
            SELECT
                passenger_id
            FROM
                passenger
            WHERE
                upper(passenger_fname) = upper('Dominik')
                AND upper(passenger_lname) = upper('Kohl')
        ),
        (
            SELECT
                passenger_id
            FROM
                passenger
            WHERE
                upper(passenger_fname) = upper('Poppy')
                AND upper(passenger_lname) = upper('Kohl')
        )
    )
    AND cruise_id = (
        SELECT
            cruise_id
        FROM
            cruise
        WHERE
            upper(cruise_name) = upper('Melbourne to Singapore')
            AND cruise_depart_dt = TO_DATE('30-Nov-2025 09:30', 'dd-Mon-yyyy hh24:mi')
    );

COMMIT; -- End of transaction for booking change

--(d)
COMMIT; -- Commit any previous work

-- Cancel Dominik's and Poppy's bookings
DELETE FROM manifest
WHERE
    passenger_id IN (
        (
            SELECT
                passenger_id
            FROM
                passenger
            WHERE
                upper(passenger_fname) = upper('Dominik')
                AND upper(passenger_lname) = upper('Kohl')
        ),
        (
            SELECT
                passenger_id
            FROM
                passenger
            WHERE
                upper(passenger_fname) = upper('Poppy')
                AND upper(passenger_lname) = upper('Kohl')
        )
    )
    AND cruise_id = (
        SELECT
            cruise_id
        FROM
            cruise
        WHERE
            upper(cruise_name) = upper('Melbourne to Singapore')
            AND cruise_depart_dt = TO_DATE('30-Nov-2025 09:30', 'dd-Mon-yyyy hh24:mi')
    );

COMMIT; -- End of transaction for booking cancellation