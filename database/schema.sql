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
       
        street_add      varchar(100),
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
        


INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.52062865077371	,-81.52718776116615,'4254 Mayfield Rd, South Euclid, OH 44121, USA	        ',40	,12	,2	,'2018-12-20',	1	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.51095049329637	,-81.58002178041045,'1792 Coventry Rd, Cleveland Heights, OH 44118, USA	    ',12	,5	,1	,'2018-12-20',	4	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.48551381355208	,-81.72452615049463,'5417 Detroit Ave, Cleveland, OH 44102, USA	            ',40	,12	,2	,'2018-12-20',	1	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.49881146422403	,-81.67541366086374,'2020b Carnegie Ave, Cleveland, OH 44115, USA	        ',40	,12	,2	,'2018-12-20',	6	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.47694189158276	,-81.72288270170634,'Lorain Av & w 53rd St, Cleveland, OH 44102, USA	    ',24	,5	,1	,'2018-12-20',	1	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.47334605784054	,-81.70772585205077,'3503 Wade Ave, Cleveland, OH 44113, USA	            ',12	,5	,1	,'2018-12-20',	2	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.48721107016828	,-81.66692438218524,'Broadway & E 34th St, Cleveland, OH 44115, USA	        ',40	,24	,3	,'2018-12-20',	1	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.48413876896496	,-81.72971700082729,'6415 Detroit Ave, Cleveland, OH 44102, USA	            ',24	,5	,1	,'2018-12-20',	3	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.50128553496933	,-81.65444175371522,'4600 Carnegie Ave, Cleveland, OH 44103, USA	        ',24	,24	,2	,'2018-12-20',	1	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.51599895868129	,-81.68118323857271,'2610 N Marginal Rd, Cleveland, OH 44114, USA	        ',12	,12	,1	,'2018-12-20',	2	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.48351116909074	,-81.74890200112793,'9423 Clifton Blvd, Cleveland, OH 44102, USA	        ',24	,24	,2	,'2018-12-20',	1	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.523075966674924   ,-81.64996790315547	,'6002 St Clair Ave, Cleveland, OH 44103, USA	        ',12	,2	,1	,'2018-12-20',	1	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.47641023605422	,-81.65141160715058,'E 55th St & Bellford Av, Cleveland, OH 44127, USA	    ',40	,24	,3	,'2018-12-20',	7	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.4806016389429	    ,-81.78109130821247,'13235 Franklin Blvd, Lakewood, OH 44107, USA	        ',24	,5	,1	,'2018-12-20',	1	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.470066960945566   ,-81.7554996424044	,'3035 West Blvd, Cleveland, OH 44111, USA	            ',24	,12	,2	,'2018-12-20',	1	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.4989371846153	    ,-81.67481086658341,'Cedar Av & E 22nd St, Cleveland, OH 44115, USA	        ',12	,2	,1	,'2018-12-20',	10	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.47385807324429	,-81.72287785492477,'2116 W 53rd St, Cleveland, OH 44102, USA	            ',12	,2	,1	,'2018-12-20',	1	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.46795005314277	,-81.79765845092209,'Warren Rd & Roxboro Av, Cleveland, OH 44111, USA	    ',12	,12	,1	,'2018-12-20',	1	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.49781827949243	,-81.70207468792842,'1330 Old River Rd, Cleveland, OH 44113, USA	        ',40	,24	,3	,'2018-12-20',	1	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.50703565199955	,-81.6169598989868,'1870 E 101st St, Cleveland, OH 44106, USA	            ',12	,2	,1	,'2018-12-20',	1	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.462554993537815   ,-81.73882165351313	,'7303 Denison Ave, Cleveland, OH 44102, USA	        ',12	,2	,1	,'2018-12-20',	1	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.46993721678411	,-81.69184166269656,'3100 W 14th St, Cleveland, OH 44109, USA	            ',24	,12	,2	,'2018-12-20',	16	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.49150109686608	,-81.62729895045402,'2465 E 86th St, Cleveland, OH 44104, USA	            ',12	,2	,1	,'2018-12-20',	1	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.452906042530515   ,-81.71646743803353	,'4441 Denison Ave, Cleveland, OH 44109, USA	        ',12	,5	,1	,'2018-12-20',	1	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.48681833702456	,-81.65017788377543,'5701 Griswold Ave, Cleveland, OH 44104, USA	        ',40	,24	,3	,'2018-12-20',	8	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.44741366584698	,-81.76644462779586,'11602 Bellaire Rd, Cleveland, OH 44111, USA	        ',12	,2	,1	,'2018-12-20',	1	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.44511502644515	,-81.60272412204449,'Miles Av & E 116th St, Cleveland, OH 44105, USA	    ',12	,2	,1	,'2018-12-20',	3	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.47769536385534	,-81.7435514816039,'8610 Madison Ave, Cleveland, OH 44102, USA	            ',24	,5	,1	,'2018-12-20',	1	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.52957791539496	,-81.59255107562257,'1302 Lakefront Ave, Cleveland, OH 44108, USA	        ',12	,12	,1	,'2018-12-20',	1	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.52939503521913	,-81.59183744531356,'1400 Lakefront Ave, Cleveland, OH 44108, USA	        ',24	,24	,2	,'2018-12-20',	13	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.51719345873174	,-81.61206488692841,'1484 E 108th St, Cleveland, OH 44106, USA	            ',12	,12	,1	,'2018-12-20',	1	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.53215562540741	,-81.59673008507173,'934 Eddy Rd, Cleveland, OH 44108, USA	                ',24	,5	,1	,'2018-12-20',	1	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.518442327829376   ,-81.6094066426902	,'1437 E 110th St, Cleveland, OH 44106, USA	            ',12	,2	,1	,'2018-12-20',	2	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.53307821680261	,-81.60707970375142,'884 Lakeview Rd, Cleveland, OH 44108, USA	            ',40	,24	,3	,'2018-12-20',	1	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.47809094963797	,-81.57668160367649,'14900 S Woodland Rd, Shaker Heights, OH 44120, USA	    ',12	,2	,1	,'2018-12-20',	1	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.529340869954346   ,-81.60179606314466	,'1019 E 123rd St, Cleveland, OH 44108, USA	            ',12	,2	,1	,'2018-12-20',	12	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.54977546889784	,-81.60200336387561,'308 Eddy Rd, Cleveland, OH 44108, USA	                ',12	,5	,1	,'2018-12-20',	1	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.528433422313874   ,-81.56362875482779	,'1060 Brandon Rd, Cleveland Heights, OH 44112, USA	    ',12	,12	,1	,'2018-12-20',	1	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.46074010459334	,-81.69399294189452,'3400 Steelyard Dr, Cleveland, OH 44109, USA	        ',12	,12	,1	,'2018-12-20',	5	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.462143335117126   ,-81.66451833850499	,'3461 Independence Rd, Cleveland, OH 44105, USA	    ',12	,2	,1	,'2018-12-20',	1	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.5326742333602	    ,-81.58705942407988,'1680 Hayden Ave, East Cleveland, OH 44112, USA	        ',40	,12	,2	,'2018-12-20',	4	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.474586201439166   ,-81.62822203721277	,'8282 OH-8, Cleveland, OH 44104, USA	                ',40	,24	,3	,'2018-12-20',	1	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.475689652923236   ,-81.6301356248286	,'8127 Kinsman Rd, Cleveland, OH 44104, USA	            ',24	,5	,1	,'2018-12-20',	2	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.4537935451805	    ,-81.7012612904964,'3723 OH-3, Cleveland, OH 44109, USA             	    ',12	,12	,1	,'2018-12-20',	1	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.524877579598744   ,-81.51968999535552	,'1280 S Green Rd, South Euclid, OH 44121, USA  	    ',24	,5	,1	,'2018-12-20',	3	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.52891231070708	,-81.52236751215753,'4387 Angela Dr, South Euclid, OH 44121, USA	        ',12	,5	,1	,'2018-12-20',	1	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.519210951491395   ,-81.55278524769085	,'60 Severance Cir, Cleveland Heights, OH 44118, USA	',24	,12	,2	,'2018-12-20',	4	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.506131455379844   ,-81.61301046641643	,'1919 E 107th St, Cleveland, OH 44106, USA	            ',12	,5	,1	,'2018-12-20',	1	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.53993555374504	,-81.56269374213775,'1990 Noble Rd, East Cleveland, OH 44112, USA	        ',12	,2	,1	,'2018-12-20',	8	,0);
INSERT INTO pothole (lat, long, street_add, size, depth, severity, report_date, report_count, priority) VALUES(41.51774691661576	,-81.54560217153005,'1551 Crest Rd, Cleveland Heights, OH 44121, USA	    ',12	,12	,1	,'2018-12-20',	9	,0);


INSERT into app_user (user_name,      password,                  role,          salt)
        values       ('Glen',      'y8i5ywLfHE8mlK3N5V8lkA==',     'admin',     'CwDYMBc84B4A7LO4qrWbDQQ7elwa+/J+YkSxaC3e1vkcRmgWoxWE7Ea5pGZcK52su3r8mA/8K3nAS9xXaCNGTSNxamlgRbf2Rrai6KBUvORwLTlrEjso/D1PD/vCwHi/SuGWa2RMl8d01tbHKZe3TAYOb+8eiit4peQD6pSAvgk=');  
        
INSERT into app_user (user_name,      password,                   role,         salt)
        values       ('testadmin',  'y8i5ywLfHE8mlK3N5V8lkA==',     'admin',      'CwDYMBc84B4A7LO4qrWbDQQ7elwa+/J+YkSxaC3e1vkcRmgWoxWE7Ea5pGZcK52su3r8mA/8K3nAS9xXaCNGTSNxamlgRbf2Rrai6KBUvORwLTlrEjso/D1PD/vCwHi/SuGWa2RMl8d01tbHKZe3TAYOb+8eiit4peQD6pSAvgk='); 
         
COMMIT;