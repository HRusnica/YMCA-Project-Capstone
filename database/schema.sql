-- *************************************************************************************************
-- This script creates all of the database objects (tables, sequences, etc) for the database
-- *************************************************************************************************

BEGIN;

CREATE TABLE app_user (
  email varchar(32) UNIQUE NOT NULL,
  password varchar(32) NOT NULL,
  salt varchar(255) NOT NULL,
  CONSTRAINT pk_app_user_email PRIMARY KEY (email)
);

CREATE TABLE manager (
  email varchar(255) UNIQUE NOT NULL,
  manager_id serial,
  first_name varchar(32) NOT NULL,
  last_name varchar(32) NOT NULL,
  CONSTRAINT pk_manager_id PRIMARY KEY (manager_id),
  CONSTRAINT fk_app_user_manager FOREIGN KEY (email) REFERENCES app_user (email)
);

CREATE TABLE instructor (
    instructor_id serial,
	email varchar(255) UNIQUE NOT NULL,
	manager_id int,
	first_name varchar(255) NOT NULL,
	last_name varchar(255) NOT NULL,
	bio TEXT,
	 CONSTRAINT pk_instructor_id PRIMARY KEY (instructor_id),
     CONSTRAINT fk_app_user_instructor FOREIGN KEY (email) REFERENCES app_user (email),
     CONSTRAINT fk_manager_instructor FOREIGN KEY (manager_id) REFERENCES manager (manager_id)
);

CREATE TABLE whitelist (
	email varchar(255)
);

COMMIT;