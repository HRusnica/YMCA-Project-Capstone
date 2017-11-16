-- *****************************************************************************
-- This script contains INSERT statements for populating tables with seed data
-- *****************************************************************************

BEGIN;

INSERT INTO app_user (email, password) VALUES ('heather.rusnica@gmail.com', 'passwordPassword');
INSERT INTO manager (email, first_name, last_name) VALUES ('heather.rusnica@gmail.com', 'Heather', 'Rusnica');


COMMIT;