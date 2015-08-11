DROP DATABASE IF EXISTS tournament;

CREATE DATABASE tournament;

\c tournament;

CREATE TABLE players(
  id SERIAL PRIMARY KEY,
 name TEXT
);

CREATE TABLE matches(
  id SERIAL PRIMARY KEY,
 winner INTEGER REFERENCES players(id),
 loser INTEGER REFERENCES players(id)
);

CREATE VIEW wins
  AS SELECT players.id, count(matches.winner)
 AS wins FROM players
 LEFT JOIN matches
 ON players.id = matches.winner
 GROUP BY players.id
;

CREATE VIEW matches_played
  AS SELECT players.id, count(matches.winner + matches.loser)
 AS nummatches FROM players
 LEFT JOIN matches
 ON players.id = matches.winner
 OR players.id = matches.loser
 GROUP BY players.id
;

CREATE VIEW standings
  AS SELECT players.id, players.name, wins.wins, matches_played.nummatches
 FROM players, wins, matches_played
 WHERE players.id = wins.id
 AND players.id = matches_played.id
 GROUP BY players.id, players.name, wins.wins, matches_played.nummatches
 ORDER BY wins.wins DESC
;

