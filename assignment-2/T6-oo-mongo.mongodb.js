// *****PLEASE ENTER YOUR DETAILS BELOW*****
// T6-oo-mongo.mongodb.js

// Student ID: 35664029
// Student Name: Xin Ling Chong
// ====================================================================================
// DO NOT modify or relocate any of the comments below (items marked with //)
// You are required to add additional comments as described on page five of this brief.
// ====================================================================================

// Use (connect to) your database - you MUST update xyz001
// with your authcate username

use("xcho0034");

// (b)
// PLEASE PLACE REQUIRED MONGODB COMMAND TO CREATE THE COLLECTION HERE
// YOU MAY PICK ANY COLLECTION NAME
// ENSURE that your statement is formatted and has a semicolon
// (;) at the end of each MongoDB statement

// Drop collection
db.passengers.drop();  // drop if it exists

// Create collection and insert documents
// Create new collection by inserting one document into the collection
db.passengers.insertOne({ "_id": 21, "passenger_name": "Ethan Zhou", "passenger_dob": "14-Apr-1984", "passenger_contact": "+61490300001", "guardian_name": "-", "address": { "street": "12 Lygon St", "town": "Melbourne", "postcode": "3000", "country": "Australia" }, "no_of_cruises": 3, "cruises": [{ "cruise_id": 1, "cruise_name": "Australian Circumnavigation", "board_datetime": "01-Jun-2025 12:00", "cabin_no": "1001", "cabin_class": "Interior" }, { "cruise_id": 6, "cruise_name": "Australian Circumnavigation", "board_datetime": "18-Sep-2025 09:10", "cabin_no": "1003", "cabin_class": "Interior" }, { "cruise_id": 8, "cruise_name": "Melbourne to Singapore", "board_datetime": "29-Nov-2025 10:00", "cabin_no": "8031", "cabin_class": "Ocean View" }] });

// insert remaining documents into the collection
db.passengers.insertMany([
    { "_id": 22, "passenger_name": "Mei Tan", "passenger_dob": "02-Feb-1992", "passenger_contact": "0290001111", "guardian_name": "-", "address": { "street": "88 George St", "town": "Sydney", "postcode": "2000", "country": "Australia" }, "no_of_cruises": 1, "cruises": [{ "cruise_id": 1, "cruise_name": "Australian Circumnavigation", "board_datetime": "01-Jun-2025 12:05", "cabin_no": "1001", "cabin_class": "Interior" }] },
    { "_id": 23, "passenger_name": "Lucas Patel", "passenger_dob": "28-Aug-1988", "passenger_contact": "+61731234567", "guardian_name": "-", "address": { "street": "5 Riverwalk Ave", "town": "Brisbane", "postcode": "4000", "country": "Australia" }, "no_of_cruises": 2, "cruises": [{ "cruise_id": 1, "cruise_name": "Australian Circumnavigation", "board_datetime": "01-Jun-2025 12:30", "cabin_no": "1004", "cabin_class": "Ocean View" }, { "cruise_id": 4, "cruise_name": "Queensland Islands", "board_datetime": "06-Jul-2025 17:00", "cabin_no": "1002", "cabin_class": "Ocean View" }] },
    { "_id": 24, "passenger_name": "Grace Patel", "passenger_dob": "03-Mar-1991", "passenger_contact": "+61731234568", "guardian_name": "-", "address": { "street": "5 Riverwalk Ave", "town": "Brisbane", "postcode": "4000", "country": "Australia" }, "no_of_cruises": 2, "cruises": [{ "cruise_id": 1, "cruise_name": "Australian Circumnavigation", "board_datetime": "01-Jun-2025 12:32", "cabin_no": "1004", "cabin_class": "Ocean View" }, { "cruise_id": 4, "cruise_name": "Queensland Islands", "board_datetime": "06-Jul-2025 17:03", "cabin_no": "1002", "cabin_class": "Ocean View" }] },
    { "_id": 25, "passenger_name": "Oliver Bennett", "passenger_dob": "19-Sep-1980", "passenger_contact": "+442079001111", "guardian_name": "-", "address": { "street": "221 Fleet St", "town": "London", "postcode": "EC4Y", "country": "United Kingdom of Great Britain and Northern Ireland" }, "no_of_cruises": 2, "cruises": [{ "cruise_id": 5, "cruise_name": "Brisbane to Hobart", "board_datetime": "07-Jul-2025 12:00", "cabin_no": "2001", "cabin_class": "Ocean View" }, { "cruise_id": 9, "cruise_name": "Queensland Islands", "board_datetime": "05-Dec-2025 18:15", "cabin_no": "1002", "cabin_class": "Ocean View" }] },
    { "_id": 26, "passenger_name": "Isla Bennett", "passenger_dob": "10-Oct-2012", "passenger_contact": "-", "guardian_name": "Oliver Bennett", "address": { "street": "221 Fleet St", "town": "London", "postcode": "EC4Y", "country": "United Kingdom of Great Britain and Northern Ireland" }, "no_of_cruises": 2, "cruises": [{ "cruise_id": 5, "cruise_name": "Brisbane to Hobart", "board_datetime": "07-Jul-2025 12:02", "cabin_no": "2001", "cabin_class": "Ocean View" }, { "cruise_id": 9, "cruise_name": "Queensland Islands", "board_datetime": "05-Dec-2025 18:17", "cabin_no": "1002", "cabin_class": "Ocean View" }] },
    { "_id": 27, "passenger_name": "Jack Connor", "passenger_dob": "09-Jan-1982", "passenger_contact": "0880002222", "guardian_name": "-", "address": { "street": "3 North Tce", "town": "Adelaide", "postcode": "5000", "country": "Australia" }, "no_of_cruises": 1, "cruises": [{ "cruise_id": 6, "cruise_name": "Australian Circumnavigation", "board_datetime": "18-Sep-2025 09:00", "cabin_no": "1011", "cabin_class": "Interior" }] },
    { "_id": 28, "passenger_name": "Lily Connor", "passenger_dob": "15-Jan-2011", "passenger_contact": "-", "guardian_name": "Jack Connor", "address": { "street": "3 North Tce", "town": "Adelaide", "postcode": "5000", "country": "Australia" }, "no_of_cruises": 1, "cruises": [{ "cruise_id": 6, "cruise_name": "Australian Circumnavigation", "board_datetime": "18-Sep-2025 09:02", "cabin_no": "1011", "cabin_class": "Interior" }] },
    { "_id": 29, "passenger_name": "Aria Wong", "passenger_dob": "11-Nov-1993", "passenger_contact": "+6495550101", "guardian_name": "-", "address": { "street": "41 Queen St", "town": "Auckland", "postcode": "1010", "country": "New Zealand" }, "no_of_cruises": 1, "cruises": [{ "cruise_id": 7, "cruise_name": "Melbourne to Auckland", "board_datetime": "22-Oct-2025 12:00", "cabin_no": "110", "cabin_class": "Ocean View" }] },
    { "_id": 30, "passenger_name": "Mason Wong", "passenger_dob": "05-May-2014", "passenger_contact": "-", "guardian_name": "Aria Wong", "address": { "street": "41 Queen St", "town": "Auckland", "postcode": "1010", "country": "New Zealand" }, "no_of_cruises": 1, "cruises": [{ "cruise_id": 7, "cruise_name": "Melbourne to Auckland", "board_datetime": "22-Oct-2025 12:05", "cabin_no": "110", "cabin_class": "Ocean View" }] },
    { "_id": 31, "passenger_name": "Henry Brooks", "passenger_dob": "22-Jun-1985", "passenger_contact": "+6445550202", "guardian_name": "-", "address": { "street": "9 Terrace Rd", "town": "Wellington", "postcode": "6011", "country": "New Zealand" }, "no_of_cruises": 3, "cruises": [{ "cruise_id": 6, "cruise_name": "Australian Circumnavigation", "board_datetime": "18-Sep-2025 09:05", "cabin_no": "1002", "cabin_class": "Ocean View" }, { "cruise_id": 8, "cruise_name": "Melbourne to Singapore", "board_datetime": "29-Nov-2025 10:02", "cabin_no": "8031", "cabin_class": "Ocean View" }, { "cruise_id": 9, "cruise_name": "Queensland Islands", "board_datetime": "05-Dec-2025 18:25", "cabin_no": "1001", "cabin_class": "Interior" }] },
    { "_id": 32, "passenger_name": "Sophia Brooks", "passenger_dob": "13-May-1987", "passenger_contact": "+6445550203", "guardian_name": "-", "address": { "street": "9 Terrace Rd", "town": "Wellington", "postcode": "6011", "country": "New Zealand" }, "no_of_cruises": 2, "cruises": [{ "cruise_id": 6, "cruise_name": "Australian Circumnavigation", "board_datetime": "18-Sep-2025 09:07", "cabin_no": "1002", "cabin_class": "Ocean View" }, { "cruise_id": 8, "cruise_name": "Melbourne to Singapore", "board_datetime": "29-Nov-2025 10:05", "cabin_no": "8032", "cabin_class": "Ocean View" }] },
    { "_id": 33, "passenger_name": "Ava Lim", "passenger_dob": "07-Jul-1995", "passenger_contact": "+6591234567", "guardian_name": "-", "address": { "street": "4 Orchard Link", "town": "Singapore", "postcode": "2388", "country": "Singapore" }, "no_of_cruises": 2, "cruises": [{ "cruise_id": 8, "cruise_name": "Melbourne to Singapore", "board_datetime": "29-Nov-2025 10:20", "cabin_no": "8032", "cabin_class": "Ocean View" }, { "cruise_id": 9, "cruise_name": "Queensland Islands", "board_datetime": "05-Dec-2025 18:00", "cabin_no": "1003", "cabin_class": "Interior" }] },
    { "_id": 34, "passenger_name": "Noah Lim", "passenger_dob": "21-Sep-2015", "passenger_contact": "-", "guardian_name": "Ava Lim", "address": { "street": "4 Orchard Link", "town": "Singapore", "postcode": "2388", "country": "Singapore" }, "no_of_cruises": 2, "cruises": [{ "cruise_id": 8, "cruise_name": "Melbourne to Singapore", "board_datetime": "29-Nov-2025 10:22", "cabin_no": "8032", "cabin_class": "Ocean View" }, { "cruise_id": 9, "cruise_name": "Queensland Islands", "board_datetime": "05-Dec-2025 18:05", "cabin_no": "1003", "cabin_class": "Interior" }] },
    { "_id": 35, "passenger_name": "Chloe Martin", "passenger_dob": "30-Oct-1990", "passenger_contact": "+6187000333", "guardian_name": "-", "address": { "street": "77 St Georges Tce", "town": "Perth", "postcode": "6000", "country": "Australia" }, "no_of_cruises": 1, "cruises": [{ "cruise_id": 10, "cruise_name": "New Zealand Christmas Sail", "board_datetime": "19-Dec-2025 08:00", "cabin_no": "2002", "cabin_class": "Ocean View" }] },
    { "_id": 36, "passenger_name": "Leo Martin", "passenger_dob": "03-Mar-2010", "passenger_contact": "-", "guardian_name": "Chloe Martin", "address": { "street": "77 St Georges Tce", "town": "Perth", "postcode": "6000", "country": "Australia" }, "no_of_cruises": 1, "cruises": [{ "cruise_id": 10, "cruise_name": "New Zealand Christmas Sail", "board_datetime": "19-Dec-2025 08:02", "cabin_no": "2002", "cabin_class": "Ocean View" }] },
    { "_id": 37, "passenger_name": "Zara Hughes", "passenger_dob": "25-Dec-1986", "passenger_contact": "+442071234567", "guardian_name": "-", "address": { "street": "221 Fleet St", "town": "London", "postcode": "EC4Y", "country": "United Kingdom of Great Britain and Northern Ireland" }, "no_of_cruises": 1, "cruises": [{ "cruise_id": 10, "cruise_name": "New Zealand Christmas Sail", "board_datetime": "-", "cabin_no": "2003", "cabin_class": "Ocean View" }] },
    { "_id": 38, "passenger_name": "Finn Hughes", "passenger_dob": "18-Aug-2013", "passenger_contact": "-", "guardian_name": "Zara Hughes", "address": { "street": "221 Fleet St", "town": "London", "postcode": "EC4Y", "country": "United Kingdom of Great Britain and Northern Ireland" }, "no_of_cruises": 1, "cruises": [{ "cruise_id": 10, "cruise_name": "New Zealand Christmas Sail", "board_datetime": "19-Dec-2025 08:10", "cabin_no": "2003", "cabin_class": "Ocean View" }] },
    { "_id": 39, "passenger_name": "Maya Chen", "passenger_dob": "04-Apr-1998", "passenger_contact": "+61490300002", "guardian_name": "-", "address": { "street": "12 Lygon St", "town": "Melbourne", "postcode": "3000", "country": "Australia" }, "no_of_cruises": 2, "cruises": [{ "cruise_id": 5, "cruise_name": "Brisbane to Hobart", "board_datetime": "07-Jul-2025 12:10", "cabin_no": "2004", "cabin_class": "Ocean View" }, { "cruise_id": 8, "cruise_name": "Melbourne to Singapore", "board_datetime": "-", "cabin_no": "8032", "cabin_class": "Ocean View" }] },
    { "_id": 40, "passenger_name": "Ryan Chen", "passenger_dob": "12-Dec-2012", "passenger_contact": "-", "guardian_name": "Maya Chen", "address": { "street": "12 Lygon St", "town": "Melbourne", "postcode": "3000", "country": "Australia" }, "no_of_cruises": 1, "cruises": [{ "cruise_id": 5, "cruise_name": "Brisbane to Hobart", "board_datetime": "07-Jul-2025 12:12", "cabin_no": "2004", "cabin_class": "Ocean View" }] },
    { "_id": 500, "passenger_name": "Dominik Kohl", "passenger_dob": "10-Apr-1985", "passenger_contact": "+61493336312", "guardian_name": "-", "address": { "street": "23 Banksia Avenue", "town": "Melbourne", "postcode": "3000", "country": "Australia" }, "no_of_cruises": 0, "cruises": [] },
    { "_id": 505, "passenger_name": "Stella Kohl", "passenger_dob": "20-Jun-2010", "passenger_contact": "-", "guardian_name": "Dominik Kohl", "address": { "street": "23 Banksia Avenue", "town": "Melbourne", "postcode": "3000", "country": "Australia" }, "no_of_cruises": 0, "cruises": [] },
    { "_id": 510, "passenger_name": "Poppy Kohl", "passenger_dob": "15-Sep-2012", "passenger_contact": "-", "guardian_name": "Dominik Kohl", "address": { "street": "23 Banksia Avenue", "town": "Melbourne", "postcode": "3000", "country": "Australia" }, "no_of_cruises": 0, "cruises": [] }
]);

// List all documents you added
db.passengers.find();

// (c)
// PLEASE PLACE REQUIRED MONGODB COMMAND/S FOR THIS PART HERE
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer

// Passengers who live in Australia or New Zealand AND booked > 2 cruises
// Show: id, name, contact, full address
db.passengers.find(
    {
        "address.country": { "$in": ["Australia", "New Zealand"] },
        "no_of_cruises": { "$gt": 2 }
    },
    { "_id": 1, "passenger_name": 1, "passenger_contact": 1, "address": 1 }
);

// (d)
// PLEASE PLACE REQUIRED MONGODB COMMAND/S FOR THIS PART HERE
// ENSURE that your statement is formatted and has a semicolon
// (;) at the end of each MongoDB statement


// (i) Add new passenger and first booking
db.passengers.insertOne({
    "_id": 1000,
    "passenger_name": "Kiera Meier",
    "passenger_dob": "01-Jan-1999",
    "passenger_contact": "+61755558600",
    "guardian_name": "-",
    "address": {
        "street": "10 High St",
        "town": "Brisbane",
        "postcode": "4000",
        "country": "Australia"
    },
    "no_of_cruises": 1,
    "cruises": [
        {
            "cruise_id": 9,
            "cruise_name": "Queensland Islands",
            "board_datetime": "05-Dec-2025 18:30",
            "cabin_no": "2022",
            "cabin_class": "Balcony"
        }
    ]
});

// Illustrate/confirm changes made
// Show only Kiera Meier
db.passengers.find({ "_id": 1000 });

// (ii) Add second booking
db.passengers.updateOne(
    { "_id": 1000 },
    {
        "$push": {
            "cruises": {
                "cruise_id": 10,
                "cruise_name": "New Zealand Christmas Sail",
                "board_datetime": "19-Dec-2025 08:15",
                "cabin_no": "4004",
                "cabin_class": "Suite"
            }
        },
        "$inc": { "no_of_cruises": 1 }   // increase number of cruises by 1
    }
);

// Illustrate/confirm changes made
// Show only Kiera Meier (after update)
db.passengers.find({ "_id": 1000 });

/* (iii) Write a reflection of the difference
between inserting the passenger and booking data
into the Oracle versus MongoDB.

<<write your reflection here>>
In Oracle, data insertion follows a strict, schema-based structure. Each table must be predefined with columns,
data types, and constraints such as primary and foreign keys. When inserting passenger and booking data, relationships 
between tables (like PASSENGER, MANIFEST, and CRUISE) must be maintained carefully using INSERT INTO statements in a 
specific order. For instance, a passenger record must exist before inserting their related bookings, otherwise foreign key 
constraints will cause errors. This relational model enforces consistency and accuracy, but it can also make the insertion 
process more rigid and time-consuming when dealing with many interconnected tables.

In MongoDB, insertion is more flexible and document-oriented. Each passenger and their associated bookings can be stored 
together in a single JSON document, using embedded arrays like cruises. Adding new data is as simple as using insertOne() 
or updateOne() with operators such as $push and $inc, without worrying about predefined schemas or join relationships. There 
are no foreign keys to maintain, and documents can have slightly different structures. This flexibility speeds up insertion 
and makes it easier to handle nested or optional fields, but it shifts the responsibility for maintaining consistency and 
avoiding duplication to the application logic.

Overall, Oracle offers strong data integrity and reliability through its structured, rule-based design, while MongoDB provides 
agility and simplicity, especially for hierarchical or evolving datasets. Choosing between them depends on whether the priority 
is strict relational control or flexible, schema-less data handling.

*/