/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T6-oo-json.sql

--Student ID: 35664029
--Student Name: Xin Ling Chong



-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SET PAGESIZE 100

SELECT
    JSON_OBJECT(
    --BASIC PASSENGER DETAILS
        '_id' VALUE p.passenger_id,  -- passenger unique identifier
                'passenger_name' VALUE p.passenger_fname
                                       || ' '
                                       || p.passenger_lname,   -- combine first + last name
                'passenger_dob' VALUE to_char(
            p.passenger_dob,
            'DD-Mon-YYYY'
        ),         -- convert date to readable text
                'passenger_contact' VALUE nvl(
            p.passenger_contact,
            '-'
        ),   -- if contact number is NULL (e.g. minors), show a '-' instead

    -- guardian’s full name (for minors); if none, show '-'
                'guardian_name' VALUE
            CASE
                WHEN g.passenger_fname IS NULL
                   AND g.passenger_lname IS NULL THEN
                    '-'  -- no guardian recorded
                ELSE
                    g.passenger_fname
                    || ' '
                    || g.passenger_lname         -- combine guardian first and last names
            END,

    -- Address sub-document
                'address' VALUE
            JSON_OBJECT(
                'street' VALUE a.address_street,
                        'town' VALUE a.address_town,
                        'postcode' VALUE a.address_pcode,
                        'country' VALUE addr_ctry.country_name         -- join to COUNTRY table for readable country name
            ),

    -- Count of cruises
                'no_of_cruises' VALUE COUNT(m.manifest_id),

    -- Cruise list (JSON array)
    -- if no cruises, output empty []; else list each booked cruise as an object
                'cruises' VALUE
            CASE
                WHEN COUNT(m.manifest_id) = 0 THEN
                    JSON_ARRAY()    -- passenger never booked a cruise
                ELSE
                    JSON_ARRAYAGG(
                        JSON_OBJECT(
                            'cruise_id' VALUE c.cruise_id,
                                    'cruise_name' VALUE c.cruise_name,

                 -- boarding time may be NULL if passenger did not show up
                                    'board_datetime' VALUE nvl(
                                to_char(
                                    m.manifest_board_datetime,
                                    'DD-Mon-YYYY HH24:MI'
                                ),
                                '-'
                            ),

                 -- cabin number and class for each booking
                                    'cabin_no' VALUE nvl(
                                m.cabin_no,
                                '-'
                            ),
                                    'cabin_class' VALUE
                                CASE cb.cabin_class
                                    WHEN 'I' THEN
                                        'Interior'
                                    WHEN 'O' THEN
                                        'Ocean View'
                                    WHEN 'B' THEN
                                        'Balcony'
                                    WHEN 'S' THEN
                                        'Suite'
                                    ELSE
                                        '-'
                                END
                        )
                     ORDER BY c.cruise_id  -- keep array output in cruise order
                     )
            END
    FORMAT JSON)
    || ','
  FROM
  --TABLE LINKS
   passenger p    -- start from passenger so everyone appears even if no booking
  LEFT OUTER JOIN passenger g
ON g.passenger_id = p.guardian_id       -- Guardian info
  JOIN address a
ON a.address_id = p.address_id                  -- Address
  LEFT OUTER JOIN country addr_ctry
ON addr_ctry.country_code = a.country_code  -- Country of address
  LEFT OUTER JOIN manifest m
ON m.passenger_id = p.passenger_id        -- Bookings
  LEFT OUTER JOIN cruise c
ON c.cruise_id = m.cruise_id                -- Cruise info
  LEFT OUTER JOIN cabin cb
ON cb.ship_code = m.ship_code
   AND cb.cabin_no = m.cabin_no  -- join CABIN to read cabin_class (must match both ship_code + cabin_no)

 GROUP BY p.passenger_id,
          p.passenger_fname,
          p.passenger_lname,
          p.passenger_dob,
          p.passenger_contact,
          g.passenger_fname,
          g.passenger_lname,
          a.address_street,
          a.address_town,
          a.address_pcode,
          addr_ctry.country_name
 ORDER BY p.passenger_id;  -- keep passengers in ID order