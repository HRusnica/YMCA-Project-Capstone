-- *****************************************************************************
-- This script contains INSERT statements for populating tables with seed data
-- *****************************************************************************

BEGIN;
INSERT INTO whitelist (email, role) VALUES ('HEATHER.RUSNICA@gmail.com','manager');
INSERT INTO app_user (email, password, salt, first_name, last_name) VALUES ('HEATHER.RUSNICA@gmail.com', 'passwordPassword', 'hey', 'Heather', 'Rusnica');
INSERT INTO manager (email) VALUES ('HEATHER.RUSNICA@gmail.com');

INSERT INTO whitelist (email, role) VALUES ('NEW@aol.com','instructor');

INSERT INTO whitelist (email, role) VALUES ('THIS@is.fake', 'instructor');
INSERT INTO whitelist (email, role) VALUES ('ALSO@fake.too', 'instructor');

INSERT INTO app_user (email, password, salt, first_name, last_name) VALUES ('THIS@is.fake', 'passwordPassword', 'hey', 'Sho', 'Nuff');
INSERT INTO app_user (email, password, salt, first_name, last_name) VALUES ('ALSO@fake.too', 'passwordPassword', 'hey', 'Ben', 'Diver');

INSERT INTO instructor (email, manager_id) VALUES ('THIS@is.fake', 1);
INSERT INTO instructor (email, manager_id) VALUES ('ALSO@fake.too', 1);

INSERT INTO skill (skill_name, skill_description) VALUES ('Blow bubbles', 'on surface, assisted');
INSERT INTO skill (skill_name, skill_description) VALUES ('Front tow', 'chin in water, assisted');
INSERT INTO skill (skill_name, skill_description) VALUES ('Water exit', 'parent and child together');
INSERT INTO skill (skill_name, skill_description) VALUES ('Water entry', 'parent and child together');
INSERT INTO skill (skill_name, skill_description) VALUES ('Back float', 'assisted, head on shoulder');
INSERT INTO skill (skill_name, skill_description) VALUES ('Roll', 'assisted');
INSERT INTO skill (skill_name, skill_description) VALUES ('Front float', 'chin in water, assisted');
INSERT INTO skill (skill_name, skill_description) VALUES ('Back tow', 'assisted, head on shoulder');
INSERT INTO skill (skill_name, skill_description) VALUES ('Wall grab', 'assisted');
INSERT INTO skill (skill_name, skill_description) VALUES ('Submerge', 'bob independently');
INSERT INTO skill (skill_name, skill_description) VALUES ('Front glide', 'assisted, to wall, 5ft');
INSERT INTO skill (skill_name, skill_description) VALUES ('Water exit', 'independently');
INSERT INTO skill (skill_name, skill_description) VALUES ('Jump, push, turn, grab', 'assisted');
INSERT INTO skill (skill_name, skill_description) VALUES ('Back float', 'assisted, 10 secs, recover independently');
INSERT INTO skill (skill_name, skill_description) VALUES ('Front float', 'assisted, 10 secs, recover independently');
INSERT INTO skill (skill_name, skill_description) VALUES ('Back glide', 'assistd at wall, 5ft');
INSERT INTO skill (skill_name, skill_description) VALUES ('Swim, float, swim', 'bob independently');
INSERT INTO skill (skill_name, skill_description) VALUES ('Submerge', 'assisted, 10ft');

INSERT INTO level (level_name, age_group) VALUES ('Water Discovery', 'Parent & Child');
INSERT INTO level (level_name, age_group) VALUES ('Water Acclimation', 'Preschool');
INSERT INTO level (level_name, age_group) VALUES ('Water Acclimation', 'School Age');

INSERT INTO skill_level(skill_id, level_id) VALUES (1, 1);
INSERT INTO skill_level(skill_id, level_id) VALUES (2, 1);
INSERT INTO skill_level(skill_id, level_id) VALUES (3, 1);
INSERT INTO skill_level(skill_id, level_id) VALUES (4, 1);
INSERT INTO skill_level(skill_id, level_id) VALUES (5, 1);
INSERT INTO skill_level(skill_id, level_id) VALUES (6, 1);
INSERT INTO skill_level(skill_id, level_id) VALUES (7, 1);
INSERT INTO skill_level(skill_id, level_id) VALUES (11, 2);
INSERT INTO skill_level(skill_id, level_id) VALUES (12, 2);
INSERT INTO skill_level(skill_id, level_id) VALUES (13, 2);
INSERT INTO skill_level(skill_id, level_id) VALUES (14, 2);
INSERT INTO skill_level(skill_id, level_id) VALUES (15, 2);
INSERT INTO skill_level(skill_id, level_id) VALUES (16, 2);
INSERT INTO skill_level(skill_id, level_id) VALUES (17, 2);

INSERT INTO class_time(hour, day_of_week, start_date, end_date) VALUES ('6:00', 'Monday', '11-11-17', '12-11-17');

INSERT INTO class(level_id, instructor_id, class_time_id) VALUES (1, 2, 1);

COMMIT;