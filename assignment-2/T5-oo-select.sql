/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T5-oo-select.sql

--Student ID: 35664029
--Student Name: Xin Ling Chong


/* (a) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT country_code,       -- Country code
       country_name,      -- Full country name
       country_stats.no_passengers,     -- Total passengers from this country

    -- Calculate percentage of total passengers (rounded to 1 decimal place) and right align the percentage
       lpad(
           to_char(round(
               (country_stats.no_passengers * 100) /(
                   SELECT COUNT(*)
                     FROM passenger
               ),
               1
           ))
           || '%',
           18,
           ' '
       ) AS percent_passengers
  FROM (
    --Subquery: Count how many passengers belong to each country
    SELECT country_code,                 -- Each country's code from address
           COUNT(*) AS no_passengers     -- Count of passengers in that country
      FROM passenger
    NATURAL JOIN address
    -- NATURAL JOIN matches both tables automatically by country_code (through address)

     GROUP BY country_code
) country_stats

--NATURAL JOIN connects the above result to COUNTRY table
--because both share the column 'country_code'

NATURAL JOIN country 

--Keep only country/countries that have the maximum passenger count
 WHERE country_stats.no_passengers = (
    SELECT MAX(COUNT(*))                 -- Find the largest passenger count
      FROM passenger
    NATURAL JOIN address
     GROUP BY country_code
)

--Sort the final result by country code
 ORDER BY country_code;

/* (b) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT cruise_id,
       cruise_name,
       departure_date_time,
       ship_details,
       category,
       passenger_count
  FROM (
--Count passengers by gender for each cruise
    SELECT cruise_id,          -- Unique cruise identifier
           cruise_name,        -- Name of cruise
           to_char(
               cruise_depart_dt,
               'Dy DD '
           )
           || rtrim(to_char(
               cruise_depart_dt,
               'Month'
           ))
           || ' '
           || to_char(
               cruise_depart_dt,
               'YYYY HH:MI AM'
           ) AS departure_date_time,  -- formatted date/time
           ( ship_code
             || ' ' || ship_name ) AS ship_details,       -- Combined ship code + name
           CASE upper(passenger_gender)                     -- Convert gender codes to readable text
               WHEN 'M' THEN
                   'Male'
               WHEN 'F' THEN
                   'Female'
               ELSE
                   'Other'
           END AS category,
           COUNT(*) AS passenger_count     -- Number of passengers in that group

      FROM manifest
    NATURAL JOIN passenger                -- link each passenger’s gender
    NATURAL JOIN cruise                   -- link cruise info
    NATURAL JOIN ship                     -- link ship details

     GROUP BY cruise_id,
              cruise_name,
              cruise_depart_dt,
              ship_code,
              ship_name,
              CASE upper(passenger_gender)
                  WHEN 'M' THEN
                      'Male'
                  WHEN 'F' THEN
                      'Female'
                  ELSE
                      'Other'
              END
    UNION ALL

--Add total passenger count for each cruise
    SELECT cruise_id,
           cruise_name,
           to_char(
               cruise_depart_dt,
               'Dy DD '
           )
           || rtrim(to_char(
               cruise_depart_dt,
               'Month'
           ))
           || ' '
           || to_char(
               cruise_depart_dt,
               'YYYY HH:MI AM'
           ) AS departure_date_time,
           ( ship_code
             || ' ' || ship_name ) AS ship_details,
           'Total Count' AS category,           -- Label for total row
           COUNT(*) AS passenger_count
      FROM manifest
    NATURAL JOIN passenger
    NATURAL JOIN cruise
    NATURAL JOIN ship
     GROUP BY cruise_id,
              cruise_name,
              cruise_depart_dt,
              ship_code,
              ship_name
)

--Final ordering
 ORDER BY cruise_id,
          CASE category
              WHEN 'Female'      THEN
                  1
              WHEN 'Male'        THEN
                  2
              WHEN 'Other'       THEN
                  3
              WHEN 'Total Count' THEN
                  4
              ELSE
                  5
          END;

-- EXPLANATION: WHY USE UNION ALL?
-- Here, I use UNION ALL (instead of JOIN or UNION) to combine two sets of results:
--    Passenger counts grouped by gender, and
--    Overall totals per cruise.
--
-- UNION ALL keeps all rows from both queries together — including the “Total Count” row
-- for every cruise — without merging or removing duplicates.

/* (c) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT cruise_id
       || ' : '
       || cruise_name AS cruise,  --Combine cruise_id and name
       trunc(cruise_arrive_dt - cruise_depart_dt)
       || ' days '
       || trunc(MOD(
           (cruise_arrive_dt - cruise_depart_dt) * 24,
           24
       ))
       || ' hours' AS cruise_duration,  --Calculate cruise duration in days and hours
       COUNT(passenger_id) AS total_passengers,   --Total passengers on each cruise
       SUM(
           CASE
               WHEN guardian_id IS NOT NULL THEN
                   1
               ELSE
                   0
           END
       ) AS minors,     --Count of minors (children travelling with a guardian)
       round(
           avg(months_between(
               cruise_depart_dt,
               passenger_dob
           ) / 12),
           1
       ) AS avg_age,   --Average passenger age (in years) at departure, rounded to 1 decimal place
       COUNT(DISTINCT address.country_code) AS countries,  --Number of distinct home countries passengers come from
       to_char(
           cruise_cost_pp,
           '$99,999.00'
       ) AS cruisecost,   --Cost per person for the cruise, formatted with currency symbol
       ship_name,       --ship name
       oper_comp_name,  --ship operator company
       ship_country.country_name AS ship_country  --Ship registration country
  FROM
  --manifest: link passengers to specific cruises
   manifest  

  --NATURAL JOINs automatically match shared column names like passenger_id, cruise_id, etc.
NATURAL JOIN cruise
NATURAL JOIN passenger
NATURAL JOIN address
  
  --prevents accidental joining on country_code (which both ship and address have); ensures linking via ship_code only
  JOIN ship
USING ( ship_code )

  --Join operator table to get company name operating the ship
  JOIN operator
USING ( oper_id )
  
  --Join country again (aliased as ship_country) to get the ship’s registration country
  --only want to join the ship’s country_code, not the passenger’s address country
  JOIN country ship_country
ON ship_country.country_code = ship.country_code
 GROUP BY cruise_id,
          cruise_name,
          cruise_depart_dt,
          cruise_arrive_dt,
          cruise_cost_pp,
          ship_name,
          oper_comp_name,
          ship_country.country_name
HAVING
  --Include only cruises with more booked passengers than the overall average
 COUNT(passenger_id) > (
    SELECT AVG(passengers_per_cruise)
      FROM (
      --Calculate number of passengers per cruise
        SELECT COUNT(*) AS passengers_per_cruise
          FROM manifest
         GROUP BY cruise_id
    )
)
 ORDER BY total_passengers DESC,
          cruise_id;