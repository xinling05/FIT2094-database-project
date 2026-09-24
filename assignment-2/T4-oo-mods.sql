--****PLEASE ENTER YOUR DETAILS BELOW****
--T4-oo-mods.sql

--Student ID: 35664029
--Student Name: Xin Ling Chong


--(a)
-- Drop table if exist
DROP TABLE ship_maintenance CASCADE CONSTRAINTS PURGE;

-- Create a new SHIP_MAINTENANCE table
CREATE TABLE ship_maintenance (
    maint_id        NUMBER(8) NOT NULL,
    ship_code       NUMBER(4) NOT NULL,
    maint_type      CHAR(1) NOT NULL,
    sched_start_dt  DATE NOT NULL,
    sched_end_dt    DATE NOT NULL,
    actual_start_dt DATE,                  -- NULL until the maintenance is started
    actual_end_dt   DATE                   -- NULL until the maintenance is completed
);

-- Add comments for all new columns
COMMENT ON COLUMN ship_maintenance.maint_id IS
    'Unique identifier for a maintenance record';

COMMENT ON COLUMN ship_maintenance.ship_code IS
    'Ship code';

COMMENT ON COLUMN ship_maintenance.maint_type IS
    'Maintenance type (P: Preventive Maintenance,B: Breakdown Maintenance,C: Condition-Based Maintenance)'
    ;

COMMENT ON COLUMN ship_maintenance.sched_start_dt IS
    'Scheduled maintenance start date';

COMMENT ON COLUMN ship_maintenance.sched_end_dt IS
    'Scheduled maintenance end date';

COMMENT ON COLUMN ship_maintenance.actual_start_dt IS
    'Actual start date/time';

COMMENT ON COLUMN ship_maintenance.actual_end_dt IS
    'Actual end date/time';

-- Add primary key constraint
ALTER TABLE ship_maintenance ADD CONSTRAINT ship_maintenance_pk PRIMARY KEY ( maint_id
);

-- Add foreign key constraint to link to the SHIP table
ALTER TABLE ship_maintenance
    ADD CONSTRAINT ship_ship_maintenance_fk FOREIGN KEY ( ship_code )
        REFERENCES ship ( ship_code );

-- Add check constraints
ALTER TABLE ship_maintenance
    ADD CONSTRAINT ship_maint_type_chk
        CHECK ( maint_type IN ( 'P',
                                'B',
                                'C' ) );

ALTER TABLE ship_maintenance ADD CONSTRAINT ship_maint_sched_dt_chk CHECK ( sched_end_dt >= sched_start_dt
);

-- Evidence: show structure
DESC ship_maintenance;

--(b)
-- Drop table if exist
DROP TABLE need_category CASCADE CONSTRAINTS PURGE;
DROP TABLE passenger_need CASCADE CONSTRAINTS PURGE;

-- Create a new NEED_CATEGORY table
CREATE TABLE need_category (
    need_code CHAR(2) NOT NULL,
    need_name VARCHAR2(20) NOT NULL
);

-- Add comments for all new columns
COMMENT ON COLUMN need_category.need_code IS
    'Code for each need category';

COMMENT ON COLUMN need_category.need_name IS
    'Name of each need category';

-- Add primary key constraint
ALTER TABLE need_category ADD CONSTRAINT need_category_pk PRIMARY KEY ( need_code );

-- Add unique constraint
ALTER TABLE need_category ADD CONSTRAINT need_category_name_uq UNIQUE ( need_name );

INSERT INTO need_category (
    need_code,
    need_name
) VALUES ( 'GE',
           'General' );

INSERT INTO need_category (
    need_code,
    need_name
) VALUES ( 'MO',
           'Mobility' );

INSERT INTO need_category (
    need_code,
    need_name
) VALUES ( 'HE',
           'Hearing' );

INSERT INTO need_category (
    need_code,
    need_name
) VALUES ( 'VI',
           'Visual' );

INSERT INTO need_category (
    need_code,
    need_name
) VALUES ( 'OT',
           'Others' );

-- Create a new PASSENGER_NEED table
CREATE TABLE passenger_need (
    passenger_id NUMBER(6) NOT NULL,
    need_code    CHAR(2) NOT NULL,
    need_details VARCHAR2(200)
);

-- Add comments for all new columns
COMMENT ON COLUMN passenger_need.passenger_id IS
    'Passenger unique identifier';

COMMENT ON COLUMN passenger_need.need_code IS
    'Code for each need category';

COMMENT ON COLUMN passenger_need.need_details IS
    'Details for each need category';

-- Add primary key constraint
ALTER TABLE passenger_need ADD CONSTRAINT passenger_need_pk PRIMARY KEY ( passenger_id
,
                                                                          need_code )
                                                                          ;

--Add foreign key constraints
ALTER TABLE passenger_need
    ADD CONSTRAINT passenger_passenger_need_fk FOREIGN KEY ( passenger_id )
        REFERENCES passenger ( passenger_id );

ALTER TABLE passenger_need
    ADD CONSTRAINT need_category_passenger_need_fk FOREIGN KEY ( need_code )
        REFERENCES need_category ( need_code );

-- Evidence: show structures and category data
DESC need_category;

DESC passenger_need;

SELECT *
  FROM need_category
 ORDER BY need_code;

-- Seed: give 'GE' (General) to all existing passengers with specialneed='Y'
INSERT INTO passenger_need (
    passenger_id,
    need_code,
    need_details
)
    SELECT p.passenger_id,
           'GE',
           NULL
      FROM passenger p
      LEFT OUTER JOIN passenger_need pn
    ON p.passenger_id = pn.passenger_id
       AND pn.need_code = 'GE'
     WHERE p.passenger_specialneed = 'Y'
       AND pn.passenger_id IS NULL;

-- Evidence: show data changes (who has which categories now)
SELECT p.passenger_id,
       p.passenger_fname
       || ' '
       || p.passenger_lname AS passenger_full_name,
       p.passenger_specialneed,
       pn.need_code,
       pn.need_details
  FROM passenger p
  LEFT OUTER JOIN passenger_need pn
ON p.passenger_id = pn.passenger_id
 ORDER BY p.passenger_id,
          pn.need_code;

COMMIT;