CREATE TABLE Players (
    player_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    nationality VARCHAR(50),
    position VARCHAR(30),
    current_team_id INT,
    national_team_id INT,
    FOREIGN KEY (current_team_id) REFERENCES Teams(team_id),
    FOREIGN KEY (national_team_id) REFERENCES NationalTeams(national_team_id)
);

CREATE TABLE Teams (
    team_id INTEGER PRIMARY KEY AUTOINCREMENT,
    team_name VARCHAR(100),
    league_id INT,
    stadium VARCHAR(100),
    founded_year INT,
    FOREIGN KEY (league_id) REFERENCES Leagues(league_id)
);

CREATE TABLE NationalTeams (
    national_team_id INTEGER PRIMARY KEY AUTOINCREMENT,
    country VARCHAR(50),
    coach_name VARCHAR(100),
    founded_year INT
);

CREATE TABLE Leagues (
    league_id INTEGER PRIMARY KEY AUTOINCREMENT,
    league_name VARCHAR(100),
    country VARCHAR(50),
    founded_year INT
);

CREATE TABLE PlayerStats (
    player_stat_id INTEGER PRIMARY KEY AUTOINCREMENT,
    player_id INT,
    season VARCHAR(20),
    appearances INT,
    goals INT,
    assists INT,
    yellow_cards INT,
    red_cards INT,
    FOREIGN KEY (player_id) REFERENCES Players(player_id)
);

CREATE VIEW PlayerDetails AS
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
    NationalTeams nt ON p.national_team_id = nt.national_team_id;


CREATE INDEX idx_players_last_name ON Players (last_name);
CREATE INDEX idx_players_current_team_id ON Players (current_team_id);
CREATE INDEX idx_players_national_team_id ON Players (national_team_id);

CREATE INDEX idx_teams_league_id ON Teams (league_id);
CREATE INDEX idx_teams_team_name ON Teams (team_name);

CREATE INDEX idx_nationalteams_country ON NationalTeams (country);

CREATE INDEX idx_leagues_league_name ON Leagues (league_name);

CREATE INDEX idx_playerstats_player_id ON PlayerStats (player_id);
CREATE INDEX idx_playerstats_season ON PlayerStats (season);
