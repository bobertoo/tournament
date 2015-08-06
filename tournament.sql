-- this creates the tournament database
CREATE DATABASE tournament;
-- this puts us into the new database
\c tournament;
-- this creates a table for players with a name and unique id number
CREATE TABLE players( id SERIAL, name TEXT);
-- this creates a table for matches. it has 2 players and shows winner and loser
CREATE TABLE matches( winner INTEGER, loser INTEGER);
-- created a view to show player id with associated wins
CREATE VIEW wins AS SELECT players.id, count(matches.winner) AS wins FROM players LEFT JOIN matches ON players.id = matches.winner GROUP BY players.id;
-- created a view to show player id with number of matches played
CREATE VIEW matches_played AS SELECT players.id, count(matches.winner + matches.loser) AS nummatches FROM players LEFT JOIN matches ON players.id = matches.winner OR players.id = matches.loser GROUP BY players.id;
-- created a view that shows player id, name, number of wins and matches played
CREATE VIEW standings AS SELECT players.id, players.name, wins.wins, matches_played.nummatches FROM players, wins, matches_played WHERE players.id = wins.id AND players.id = matches_played.id GROUP BY players.id, players.name, wins.wins, matches_played.nummatches ORDER BY wins.wins DESC;
-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.


