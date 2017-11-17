-- *****************************************************************************
-- This script contains INSERT statements for populating tables with seed data
-- *****************************************************************************

BEGIN;

--INSERT INTO app_user (email, password, salt, first_name, last_name) VALUES ('HEATHER.RUSNICA@gmail.com', 'passwordPassword', 'super', 'Heather', 'Rusnica');
INSERT INTO whitelist (email) VALUES ('HEATHER.RUSNICA@gmail.com');
--INSERT INTO manager (email) VALUES ('HEATHER.RUSNICA@gmail.com');

INSERT INTO whitelist (email) VALUES ('new@aol.com');

COMMIT;