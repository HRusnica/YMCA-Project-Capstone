-- *****************************************************************************
-- This script contains INSERT statements for populating tables with seed data
-- *****************************************************************************

BEGIN;

INSERT INTO app_user (email, password, salt) VALUES ('HEATHER.RUSNICA@gmail.com', 'passwordPassword', 'super');
INSERT INTO manager (email, first_name, last_name) VALUES ('HEATHER.RUSNICA@gmail.com', 'Heather', 'Rusnica');
INSERT INTO whitelist (email) VALUES ('new@aol.com');

COMMIT;