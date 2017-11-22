-- *****************************************************************************
-- This script contains INSERT statements for populating tables with seed data
-- *****************************************************************************

BEGIN;
INSERT INTO whitelist (email, role) VALUES ('HEATHER.RUSNICA@GMAIL.COM','manager');
INSERT INTO app_user (email, password, salt, first_name, last_name) VALUES ('HEATHER.RUSNICA@GMAIL.COM', 'lApBpVSalBGV2Gz3UCRI5w==', 'm90wwhGqndzrDgOS8pLJx4VbuDW9LA/sOUVpQUSS5qTrva5+yRhjHRqpHLDkV63g2H6L8G6YjrXDn2Hk6tFH9uK7edqtmNDzVPDAgbr1lfj6ywLOggRalFLRQQQEQWDzvxcm3YgA93QFOXqVQENDlg09qTttc/ck3JG55o3AUoE=', 'Heather', 'Rusnica');
INSERT INTO manager (email) VALUES ('HEATHER.RUSNICA@GMAIL.COM');

INSERT INTO whitelist (email, role) VALUES ('NEW@AOL.COM','instructor');

INSERT INTO whitelist (email, role) VALUES ('THIS@IS.FAKE', 'instructor');
INSERT INTO whitelist (email, role) VALUES ('ALSO@FAKE.TOO', 'instructor');

INSERT INTO app_user (email, password, salt, first_name, last_name) VALUES ('THIS@IS.FAKE', 'srpLuPFkn6XxLUifEkKjlw==', 'Mknsxz+Y7z+mClGqZfFR+PQGf+iWnhITJwrpI0ln6qgXlmUkulMy7+vqbvpiaruAMnuJHSUf3Y5It9eNK/4DJOQrovgCxoWx0xrFJ7e/u8InRl/goQ3z7Xu8mao1A0iExB54H0pj5xpJPyDUpUBzCcLXfhDL9jMrhnFGUhqDuKM=', 'Sho', 'Nuff');
INSERT INTO app_user (email, password, salt, first_name, last_name) VALUES ('ALSO@FAKE.TOO', '2F1ty+uLl4R3YVfjMA6GFg==', 'lXl93/+0u9A9rXuy4/Sz1ae7FgbxGP1d1xUG3TUVSXQZ8a8VF3j/2mMS7aVPkuIW001PJ1gGqFF6K5j88gqovqXYCp/zUNaCh+PLNyVrBu3UIPpbWk9nTVK+riCulMmXKxqxDPH1HQ+yemgcfY+4FmJxgdNmW/bA0/vELEZ6Nz8=', 'Ben', 'Diver');

INSERT INTO instructor (email, manager_id) VALUES ('THIS@IS.FAKE', 1);
INSERT INTO instructor (email, manager_id) VALUES ('ALSO@FAKE.TOO', 1);

INSERT INTO skill (skill_name, skill_description) VALUES ('Blow bubbles', 'on surface, assisted');
INSERT INTO skill (skill_name, skill_description) VALUES ('Front tow', 'chin in water, assisted');
INSERT INTO skill (skill_name, skill_description) VALUES ('Water exit', 'parent and child together');
INSERT INTO skill (skill_name, skill_description) VALUES ('Water entry', 'parent and child together');
INSERT INTO skill (skill_name, skill_description) VALUES ('Back float', 'assisted, head on shoulder');
INSERT INTO skill (skill_name, skill_description) VALUES ('Roll', 'assisted');
INSERT INTO skill (skill_name, skill_description) VALUES ('Front float', 'chin in water, assisted');
INSERT INTO skill (skill_name, skill_description) VALUES ('Back tow', 'assisted, head on shoulder');
INSERT INTO skill (skill_name, skill_description) VALUES ('Wall grab', 'assisted');
INSERT INTO skill (skill_name, skill_description) VALUES ('Blow bubbles', 'mouth & nose submerged, assisted');
INSERT INTO skill (skill_name, skill_description) VALUES ('Front tow', 'blow bubbles, assisted');
INSERT INTO skill (skill_name, skill_description) VALUES ('Water exit', 'assisted');
INSERT INTO skill (skill_name, skill_description) VALUES ('Water entry', 'assisted');
INSERT INTO skill (skill_name, skill_description) VALUES ('Back float', 'assisted, head on chest');
INSERT INTO skill (skill_name, skill_description) VALUES ('Front float', 'blow bubbles, assisted');
INSERT INTO skill (skill_name, skill_description) VALUES ('Back tow', 'assisted, head on chest');
INSERT INTO skill (skill_name, skill_description) VALUES ('Monkey crawl', 'assisted, on edge, 5ft');
INSERT INTO skill (skill_name, skill_description) VALUES ('Submerge', 'bob independently');
INSERT INTO skill (skill_name, skill_description) VALUES ('Front glide', 'assisted, to wall, 5ft');
INSERT INTO skill (skill_name, skill_description) VALUES ('Water exit', 'independently');
INSERT INTO skill (skill_name, skill_description) VALUES ('Jump, push, turn, grab', 'assisted');
INSERT INTO skill (skill_name, skill_description) VALUES ('Back float', 'assisted, 10 secs, recover independently');
INSERT INTO skill (skill_name, skill_description) VALUES ('Front float', 'assisted, 10 secs, recover independently');
INSERT INTO skill (skill_name, skill_description) VALUES ('Back glide', 'assistd at wall, 5ft');
INSERT INTO skill (skill_name, skill_description) VALUES ('Swim, float, swim', 'assisted, 10ft');
INSERT INTO skill (skill_name, skill_description) VALUES ('Submerge', 'look at object on bottom');
INSERT INTO skill (skill_name, skill_descriptoin) VALUES ('Front glide', '10ft');
INSERT INTO skill (skill_name, skill_descriptoin) VALUES ('Front glide', '5ft');
INSERT INTO skill (skill_name) VALUES ('Jump, push, turn, grab');
INSERT INTO skill (skill_name, skill_descriptoin) VALUES ('Back float', '20 secs');
INSERT INTO skill (skill_name, skill_descriptoin) VALUES ('Back float', '10 secs');
INSERT INTO skill (skill_name) VALUES ('Roll');
INSERT INTO skill (skill_name, skill_descriptoin) VALUES ('Front float', '20 secs');
INSERT INTO skill (skill_name, skill_descriptoin) VALUES ('Front float', '10 secs');
INSERT INTO skill (skill_name, skill_descriptoin) VALUES ('Back glide', '10ft');
INSERT INTO skill (skill_name, skill_descriptoin) VALUES ('Back glide', '5 ft');
INSERT INTO skill (skill_name, skill_descriptoin) VALUES ('Tread water', '10 secs, near wall & exit');
INSERT INTO skill (skill_name, skill_descriptoin) VALUES ('Swim, float, swim', '5yd');
INSERT INTO skill (skill_name, skill_descriptoin) VALUES ('Submerge', 'retrieve object in chest-deep water');
INSERT INTO skill (skill_name, skill_descriptoin) VALUES ('Swim on front', '15yd');
INSERT INTO skill (skill_name, skill_descriptoin) VALUES ('Swim on front', '10yd');
INSERT INTO skill (skill_name, skill_descriptoin) VALUES ('Water exit', 'independently');
INSERT INTO skill (skill_name, skill_descriptoin) VALUES ('Jump, swim, turn, swim, grab', '10yd');
INSERT INTO skill (skill_name, skill_descriptoin) VALUES ('Swim on back', '10yd');
INSERT INTO skill (skill_name, skill_descriptoin) VALUES ('Swim on back', '15yd');
INSERT INTO skill (skill_name, skill_descriptoin) VALUES ('Tread water', '1 min & exit');
INSERT INTO skill (skill_name, skill_descriptoin) VALUES ('Tread water', '30 secs & exit');
INSERT INTO skill (skill_name, skill_descriptoin) VALUES ('Swim, float, swim', '25yd');
INSERT INTO skill (skill_name, skill_descriptoin) VALUES ('Swim, float, swim', '15yd');
INSERT INTO skill (skill_name, skill_descriptoin) VALUES ('Endurance', 'any stroke or combination of strokes, 25yd');
INSERT INTO skill (skill_name, skill_descriptoin) VALUES ('Front crawl', 'rotary breathing, 15yd');
INSERT INTO skill (skill_name, skill_descriptoin) VALUES ('Back crawl', '15yd');
INSERT INTO skill (skill_name, skill_descriptoin) VALUES ('Dive', 'sitting');
INSERT INTO skill (skill_name, skill_descriptoin) VALUES ('Resting stroke', 'elementary backstroke, 15yd');
INSERT INTO skill (skill_name, skill_descriptoin) VALUES ('Tread water', 'scissor & whip kick, 1 min');
INSERT INTO skill (skill_name, skill_descriptoin) VALUES ('Breaststroke', 'kick, 15yd');
INSERT INTO skill (skill_name, skill_descriptoin) VALUES ('Butterfly', 'kick, 15yd');


INSERT INTO level (level_name, age_group) VALUES ('Water Discovery', 'Parent & Child');
INSERT INTO level (level_name, age_group) VALUES ('Water Acclimation', 'Preschool');
INSERT INTO level (level_name, age_group) VALUES ('Water Acclimation', 'School Age');
INSERT INTO level (level_name, age_group) VALUES ('Water Exploration', 'Parent & Child');
INSERT INTO level (level_name, age_group) VALUES ('Water Movement', 'Preschool');
INSERT INTO level (level_name, age_group) VALUES ('Water Movement', 'School Age');
INSERT INTO level (level_name, age_group) VALUES ('Water Stamina', 'Preschool');
INSERT INTO level (level_name, age_group) VALUES ('Water Stamina', 'School Age');
INSERT INTO level (level_name, age_group) VALUES ('Stroke Introduction', 'Preschool');
INSERT INTO level (level_name, age_group) VALUES ('Stroke Introduction', 'School Age');
INSERT INTO level (level_name, age_group) VALUES ('Stroke Development', 'School Age');
INSERT INTO level (level_name, age_group) VALUES ('Stroke Mechanics', 'School Age');


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

INSERT INTO class_time(hour, day_of_week, start_date, end_date) VALUES ('18:00', 'Monday', '11-11-17', '12-11-17');
INSERT INTO class_time(hour, day_of_week, start_date, end_date) VALUES ('17:00', 'Tuesday', '11-21-17', '12-15-17');
INSERT INTO class_time(hour, day_of_week, start_date, end_date) VALUES ('9:00', 'Wednesday', '11-22-17', '12-16-17');
INSERT INTO class_time(hour, day_of_week, start_date, end_date) VALUES ('9:30', 'Wednesday', '11-22-17', '12-16-17');
INSERT INTO class_time(hour, day_of_week, start_date, end_date) VALUES ('10:00', 'Wednesday', '11-22-17', '12-16-17');
INSERT INTO class_time(hour, day_of_week, start_date, end_date) VALUES ('9:00', 'Thursday', '11-23-17', '12-17-17');

INSERT INTO class(level_id, instructor_id, class_time_id) VALUES (1, 2, 1);
INSERT INTO class(level_id, instructor_id, class_time_id) VALUES (2, 2, 2);
INSERT INTO class(level_id, instructor_id, class_time_id) VALUES (3, 1, 3);
INSERT INTO class(level_id, instructor_id, class_time_id) VALUES (4, 1, 4);
INSERT INTO class(level_id, instructor_id, class_time_id) VALUES (5, 1, 5);
INSERT INTO class(level_id, instructor_id, class_time_id) VALUES (6, 2, 6);

INSERT INTO student(birthDay, first_name, last_name, gender) VALUES ('1-1-11', 'Joey', 'Smith', 'male');
INSERT INTO student(birthDay, first_name, last_name, gender) VALUES ('2-2-12', 'John', 'Jones', 'male');
INSERT INTO student(birthDay, first_name, last_name, gender) VALUES ('3-3-13', 'Bob', 'Brown', 'male');
INSERT INTO student(birthDay, first_name, last_name, gender) VALUES ('4-4-14', 'Candy', 'Cooper', 'female');
INSERT INTO student(birthDay, first_name, last_name, gender) VALUES ('5-5-15', 'Jen', 'Jefferson', 'female');
INSERT INTO student(birthDay, first_name, last_name, gender) VALUES ('6-6-16', 'Roy', 'Rogers', 'male');
INSERT INTO student(birthDay, first_name, last_name, gender) VALUES ('7-7-07', 'Phil', 'Peters', 'male');
INSERT INTO student(birthDay, first_name, last_name, gender) VALUES ('8-8-08', 'Lisa', 'Luther', 'female');
INSERT INTO student(birthDay, first_name, last_name, gender) VALUES ('9-9-09', 'Cindy', 'Croft', 'female');
INSERT INTO student(birthDay, first_name, last_name, gender) VALUES ('6-6-06', 'Frank', 'Furter', 'male');
INSERT INTO student(birthDay, first_name, last_name, gender) VALUES ('5-5-05', 'Sarah', 'Connor', 'female');
INSERT INTO student(birthDay, first_name, last_name, gender) VALUES ('4-4-04', 'Suzy', 'Smith', 'female');

INSERT INTO class_student(student_id, class_id) VALUES (6, 1);
INSERT INTO class_student(student_id, class_id) VALUES (5, 1);
INSERT INTO class_student(student_id, class_id) VALUES (4, 1);
INSERT INTO class_student(student_id, class_id) VALUES (6, 2);
INSERT INTO class_student(student_id, class_id) VALUES (2, 3);
INSERT INTO class_student(student_id, class_id) VALUES (3, 3);
INSERT INTO class_student(student_id, class_id) VALUES (7, 4);
INSERT INTO class_student(student_id, class_id) VALUES (8, 4);
INSERT INTO class_student(student_id, class_id) VALUES (9, 5);

COMMIT;