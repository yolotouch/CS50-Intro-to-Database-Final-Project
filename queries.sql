-- Retrieve a list of all players, including their current team and national team
SELECT
    p.player_id,
    p.first_name,
    p.last_name,
    t.team_name AS current_team,
    nt.country AS national_team
FROM
    Players p
LEFT JOIN
    Teams t ON p.current_team_id = t.team_id
LEFT JOIN
    NationalTeams nt ON p.national_team_id = nt.national_team_id;

-- Retrieve detailed information about a specific player by player_id
SELECT
    p.player_id,
    p.first_name,
    p.last_name,
    p.date_of_birth,
    p.nationality,
    p.position,
    t.team_name AS current_team,
    nt.country AS national_team
FROM
    Players p
LEFT JOIN
    Teams t ON p.current_team_id = t.team_id
LEFT JOIN
    NationalTeams nt ON p.national_team_id = nt.national_team_id
WHERE
    p.player_id = 1; -- Replace 1 with the actual player_id

-- List all teams in a specific league
SELECT
    t.team_id,
    t.team_name,
    t.stadium,
    t.founded_year
FROM
    Teams t
LEFT JOIN
    Leagues l ON t.league_id = l.league_id
WHERE
    l.league_name = 'La Liga'; -- Replace 'Premier League' with the actual league name

-- List all teams in each league
SELECT
    l.league_name,
    t.team_id,
    t.team_name,
    t.stadium
FROM
    Leagues l
LEFT JOIN
    Teams t ON l.league_id = t.league_id;

-- Retrieve the total number of goals scored by each player in a specific season
SELECT
    p.player_id,
    p.first_name,
    p.last_name,
    SUM(ps.goals) AS total_goals
FROM
    PlayerStats ps
LEFT JOIN
    Players p ON ps.player_id = p.player_id
WHERE
    ps.season = '2023/2024' -- Replace '2023/2024' with the actual season
GROUP BY
    p.player_id,
    p.first_name,
    p.last_name
ORDER BY
    total_goals DESC;

-- Find the top 5 players with the most appearances in a specific season
SELECT
    p.player_id,
    p.first_name,
    p.last_name,
    ps.appearances
FROM
    PlayerStats ps
LEFT JOIN
    Players p ON ps.player_id = p.player_id
WHERE
    ps.season = '2023/2024' -- Replace '2023/2024' with the actual season
ORDER BY
    ps.appearances DESC
LIMIT 5;

-- Retrieve details of players with more than 5 yellow cards in a specific season
SELECT
    p.player_id,
    p.first_name,
    p.last_name,
    ps.season,
    ps.yellow_cards
FROM
    PlayerStats ps
LEFT JOIN
    Players p ON ps.player_id = p.player_id
WHERE
    ps.season = '2023/2024' -- Replace '2023/2024' with the actual season
AND
    ps.yellow_cards > 5;

-- List all players who belong to a specific national team
SELECT
    p.player_id,
    p.first_name,
    p.last_name,
    nt.country AS national_team
FROM
    Players p
LEFT JOIN
    NationalTeams nt ON p.national_team_id = nt.national_team_id
WHERE
    nt.country = 'Brazil'; -- Replace 'Brazil' with the actual country

-- Add a new player
INSERT INTO "Players" ("first_name", "last_name", "date_of_birth", "nationality", "position", "current_team_id", "national_team_id")
VALUES ('Vinícius', 'Júnior', '2000-07-12', 'Brazil', 'Attacker', '1', '1');

-- Add a new team
INSERT INTO "Teams" ("team_name", "league_id", "stadium", "founded_year")
VALUES ('Real Madrid', '1', 'Estadio Santiago Bernabéu', '1902');

-- Add a new national team
INSERT INTO "NationalTeams" ("country", "coach_name", "founded_year")
VALUES ('Brazil', 'Dorival Júnior', '1914');

-- Add a new league
INSERT INTO "Leagues" ("league_name", "country", "founded_year")
VALUES ('La Liga', 'Spain', '1929');

-- Add a new stats
INSERT INTO "PlayerStats" ("player_id", "season", "appearances", "goals", "assists", "yellow_cards", "red_cards")
VALUES ('1', '2023/2024', '26', '15', '5', '7', '0');
