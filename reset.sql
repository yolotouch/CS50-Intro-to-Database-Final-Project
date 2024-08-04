-- Drop views first since they may depend on tables
DROP VIEW IF EXISTS PlayerDetails;
DROP VIEW IF EXISTS TeamDetails;
DROP VIEW IF EXISTS PlayerStatsBySeason;
DROP VIEW IF EXISTS LeagueTeams;

-- Drop tables
DROP TABLE IF EXISTS PlayerStats;
DROP TABLE IF EXISTS Players;
DROP TABLE IF EXISTS Teams;
DROP TABLE IF EXISTS NationalTeams;
DROP TABLE IF EXISTS Leagues;

-- Optional: You can also drop sequences if you have any
-- DROP SEQUENCE IF EXISTS some_sequence;

-- Now your schema should be empty
