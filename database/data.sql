-- *****************************************************************************
-- This script contains INSERT statements for populating tables with seed data
-- *****************************************************************************

BEGIN;
INSERT INTO whitelist (email, role) VALUES ('HEATHER.RUSNICA@gmail.com','manager');

--INSERT INTO manager (email) VALUES ('HEATHER.RUSNICA@gmail.com');

INSERT INTO whitelist (email, role) VALUES ('new@aol.com','instructor');

COMMIT;