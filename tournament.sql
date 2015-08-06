CREATE DATABASE tournament;
\c tournament;
CREATE TABLE players( id SERIAL, name TEXT);
CREATE TABLE matches( winner INTEGER, loser INTEGER);
CREATE VIEW wins as select players.id, count(matches.winner) as wins from players left join matches on players.id = matches.winner group by players.id;
CREATE VIEW matches_played as select players.id, count(matches.winner + matches.loser) as nummatches from players left join matches on players.id = matches.winner or players.id = matches.loser group by players.id;
CREATE VIEW standings as select players.id, players.name, wins.wins, matches_played.nummatches from players, wins, matches_played where players.id = wins.id and players.id = matches_played.id group by players.id, players.name, wins.wins, matches_played.nummatches order by wins.wins desc;
-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.


