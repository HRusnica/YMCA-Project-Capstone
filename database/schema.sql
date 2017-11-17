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

CREATE TABLE student(
	student_id serial,
	age int NOT NULL,
	first_name varchar(32) NOT NULL,
	last_name varchar(32) NOT NULL,
	gender varchar(32) NOT NULL,
	CONSTRAINT pk_student_id PRIMARY KEY (student_id)
);

CREATE TABLE skill (
	skill_id serial,
	skill_name varchar(32) NOT NULL,
	skill_description text,
	CONSTRAINT pk_skill_id PRIMARY KEY (skill_id)
	
);

CREATE TABLE skill_student (
	skill_id int NOT NULL,
	student_id int NOT NULL,
	introduced boolean,
	accomplished boolean,
	comments text,
	CONSTRAINT fk_student_id FOREIGN KEY (skill_id) REFERENCES student (student_id),
	CONSTRAINT fk_skill_id FOREIGN KEY (skill_id) REFERENCES skill (skill_id)
);



CREATE TABLE level (
	level_id serial,
	level_name varchar(32) NOT NULL,
	age_group varchar(32) NOT NULL,
	CONSTRAINT pk_level_id PRIMARY KEY (level_id)
--	CONSTRAINT fk_level_id FOREIGN KEY (level_id) REFERENCES skill_level (level_id)
);

CREATE TABLE skill_level (
	skill_id int NOT NULL,
	level_id int NOT NULL,
	CONSTRAINT fk_level_id FOREIGN KEY (level_id) REFERENCES level (level_id),
	CONSTRAINT fk_skill_id FOREIGN KEY (skill_id) REFERENCES skill (skill_id)
);

CREATE TABLE student_attendance (
	student_id int UNIQUE NOT NULL,
	class_time_id int UNIQUE NOT NULL,
	week_1 boolean,
	week_2 boolean,
	week_3 boolean,
	week_4 boolean,
	week_5 boolean,
	week_6 boolean,
	CONSTRAINT pk_student_attendance PRIMARY KEY (student_id)
);

CREATE TABLE class_time (
	class_time_id serial,
	hour varchar(32) NOT NULL,
	day_of_week varchar(32) NOT NULL,
	start_date varchar(32) NOT NULL,
	end_date varchar(32) NOT NULL,
	class_cancelled_date varchar(32),
	CONSTRAINT pk_class_time PRIMARY KEY (class_time_id),
	CONSTRAINT fk_class_time_id FOREIGN KEY (class_time_id) REFERENCES student_attendance (class_time_id)	
);

CREATE TABLE class (
	class_id serial,
	level_id varchar(32) NOT NULL,
	instructor_id int NOT NULL,
	class_time_id int NOT NULL,
	CONSTRAINT pk_class_id PRIMARY KEY (class_id),
	CONSTRAINT fk_instructor_id FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id),
	CONSTRAINT fk_class_time_id FOREIGN KEY (class_time_id) REFERENCES class_time (class_time_id)
--	CONSTRAINT fk_level_id FOREIGN KEY (level_id) REFERENCES level (level_id)
);


CREATE TABLE class_student(
	student_id int,
	class_id int,
	CONSTRAINT fk_student_id FOREIGN KEY (student_id) REFERENCES student (student_id),
	CONSTRAINT fk_class_id FOREIGN KEY (class_id) REFERENCES class (class_id)
);




COMMIT;