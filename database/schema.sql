-- *************************************************************************************************
-- This script creates all of the database objects (tables, sequences, etc) for the database
-- *************************************************************************************************

BEGIN;

-- CREATE statements go here
DROP TABLE IF EXISTS app_user;
DROP TABLE IF EXISTS pothole;
DROP TABLE IF EXISTS user_potholes;



CREATE TABLE app_user (
  id            SERIAL PRIMARY KEY,
  user_name     varchar(32) NOT NULL    UNIQUE,
  password      varchar(32) NOT NULL,
  role          varchar(32),
  salt          varchar(255) NOT NULL
);

CREATE TABLE pothole(
        marker_id       SERIAL      PRIMARY KEY,
        lat             varchar(32),
        long            varchar(32),
        img             varchar(100),
        street_add      varchar(50),
        size            int
);

CREATE TABLE user_potholes(
        user_id         SERIAL,
        marker_id       varchar(32)
        );        
        
INSERT into pothole (lat, long, img, street_add, size) 
        values      (41.4156, -81.9235, null , 28206, 4);
INSERT into pothole (lat, long, img, street_add, size) 
        values      (41.3750, -81.9085, null , 44555, 3);

COMMIT;