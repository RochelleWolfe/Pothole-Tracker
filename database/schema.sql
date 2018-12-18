-- *************************************************************************************************
-- This script creates all of the database objects (tables, sequences, etc) for the database
-- *************************************************************************************************

BEGIN;

-- CREATE statements go here
DROP TABLE IF EXISTS app_user;
DROP TABLE IF EXISTS pothole;
DROP TABLE IF EXISTS user_potholes;



CREATE TABLE app_user (
  id            SERIAL          PRIMARY KEY,
  user_name     varchar(32)     NOT NULL    UNIQUE,
  password      varchar(32)     NOT NULL,
  role          varchar(32),
  salt          varchar(255)    NOT NULL
);

CREATE TABLE pothole(
        marker_id       SERIAL      PRIMARY KEY,
        lat             varchar(32),
        long            varchar(32),
       
        street_add      varchar(50),
        size            int,
        depth           int,
        severity        int,
        report_date     Date,
        report_count    int,
        priority        int,
        is_repairing    boolean,
        sent_for_repair Date,
        admin_aware     boolean,      
        user_reported   varchar(50)
);

CREATE TABLE user_potholes(
        user_id         int,
        marker_id       varchar(32)
        );        
        

INSERT into pothole (lat,       long,  street_add, size, depth, severity, report_date, report_count, priority) 
        values      (41.4156, -81.9235, 28206,     12,      6,    1 ,      '2018-11-02',  1,            1  );
INSERT into pothole (lat,       long,  street_add, size, depth, severity, report_date,  report_count, priority)
        values      (41.3750, -81.9085,  44555,    24,      1,    2,      '2018-11-02',   2,              1);
INSERT into pothole (lat,       long, street_add, size, depth, severity, report_date,  report_count, priority)
        values      (41.502675, -81.639509,  4567, 40,       24,  3,       '2018-11-02',  1,              1);
INSERT into pothole (lat,       long,  street_add, size, depth, severity, report_date,  report_count, priority) 
        values      (41.503679,  -81.640754, 4567, 12,       12,    1,    '2018-11-02',  1,              1);
INSERT into pothole (lat,       long, street_add, size, depth, severity, report_date,  report_count, priority)
        values      (41.504681,  -81.639509, 4567, 24,      18,    2,     '2018-11-02' , 1,              1);



INSERT into app_user (user_name,      password,              role,   salt)
        values       ('testadmin',  'PasswordPassword',     'admin', 'salt');  
        
INSERT into app_user (user_name,      password,                 role,      salt)
        values       ('testtest',  'PasswordPassword',          null,      'salt'); 
         
COMMIT;