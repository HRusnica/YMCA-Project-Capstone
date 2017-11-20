-- *****************************************************************************
-- This script contains INSERT statements for populating tables with seed data
-- *****************************************************************************

BEGIN;
INSERT INTO whitelist (email, role) VALUES ('HEATHER.RUSNICA@GMAIL.COM','manager');
INSERT INTO app_user (email, password, salt, first_name, last_name) VALUES ('HEATHER.RUSNICA@GMAIL.COM', 'lApBpVSalBGV2Gz3UCRI5w==', 'm90wwhGqndzrDgOS8pLJx4VbuDW9LA/sOUVpQUSS5qTrva5+yRhjHRqpHLDkV63g2H6L8G6YjrXDn2Hk6tFH9uK7edqtmNDzVPDAgbr1lfj6ywLOggRalFLRQQQEQWDzvxcm3YgA93QFOXqVQENDlg09qTttc/ck3JG55o3AUoE=', 'Heather', 'Rusnica');
--INSERT INTO manager (email) VALUES ('HEATHER.RUSNICA@GMAIL.COM');

INSERT INTO whitelist (email, role) VALUES ('NEW@AOL.COM','instructor');

INSERT INTO whitelist (email, role) VALUES ('THIS@IS.FAKE', 'instructor');
INSERT INTO whitelist (email, role) VALUES ('ALSO@FAKE.TOO', 'instructor');

INSERT INTO app_user (email, password, salt, first_name, last_name) VALUES ('THIS@IS.FAKE', 'srpLuPFkn6XxLUifEkKjlw==', 'Mknsxz+Y7z+mClGqZfFR+PQGf+iWnhITJwrpI0ln6qgXlmUkulMy7+vqbvpiaruAMnuJHSUf3Y5It9eNK/4DJOQrovgCxoWx0xrFJ7e/u8InRl/goQ3z7Xu8mao1A0iExB54H0pj5xpJPyDUpUBzCcLXfhDL9jMrhnFGUhqDuKM=', 'Sho', 'Nuff');
INSERT INTO app_user (email, password, salt, first_name, last_name) VALUES ('ALSO@FAKE.TOO', '2F1ty+uLl4R3YVfjMA6GFg==', 'lXl93/+0u9A9rXuy4/Sz1ae7FgbxGP1d1xUG3TUVSXQZ8a8VF3j/2mMS7aVPkuIW001PJ1gGqFF6K5j88gqovqXYCp/zUNaCh+PLNyVrBu3UIPpbWk9nTVK+riCulMmXKxqxDPH1HQ+yemgcfY+4FmJxgdNmW/bA0/vELEZ6Nz8=', 'Ben', 'Diver');

--INSERT INTO instructor (email, manager_id) VALUES ('THIS@IS.FAKE', 1);
--INSERT INTO instructor (email, manager_id) VALUES ('ALSO@FAKE.TOO', 1);

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
--
--INSERT INTO class(level_id, instructor_id, class_time_id) VALUES (1, 2, 1);

COMMIT;