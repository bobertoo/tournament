#!/usr/bin/env python
# 
# tournament.py -- implementation of a Swiss-system tournament
# it will add and remove players, show wins, 
#  number of matches played, standings and will match with another player

#imported the python psql plugin
import psycopg2

#connecting to db
def connect():
    return psycopg2.connect("dbname=tournament")

#removing all matches
def deleteMatches():
    DB = connect()
    c = DB.cursor()
    c.execute("DELETE FROM matches;")
    DB.commit()
    DB.close()

#removing all players
def deletePlayers():
    DB = connect()
    c = DB.cursor()
    c.execute("DELETE FROM players;")
    DB.commit()
    DB.close()

#adding player count up
def countPlayers():
    DB = connect()
    c = DB.cursor()
    c.execute("SELECT count(*) FROM players")
    p = c.fetchone()
    DB.close()
    return p[0]

#adding players
def registerPlayer(name):
    DB = connect()
    c = DB.cursor()
    c.execute("INSERT INTO players (name) VALUES (%s);", (name,))
    DB.commit()
    DB.close()

#viewing the player standings
def playerStandings():
    DB = connect()
    c = DB.cursor()
    c.execute("select * from standings;")
    p = c.fetchall()
    DB.close()
    return p

#adding winners and losers of matches
def reportMatch(winner, loser):
    DB = connect()
    c = DB.cursor()
    c.execute("INSERT INTO matches(winner, loser) VALUES (%s, %s);", (winner, loser,))
    DB.commit()
    DB.close()
 
#used the testPairings function to fill the swissPairing matching requirements 
#this pairs players my determining who one previous game
def swissPairings():
    i = 0
    j = []
    standings = playerStandings()
    #added the if statment to check if game had even or odd number
    if len(standings) % 2 != 0:
        print 'we want an even number of players plz' 
    else:
        while i < len(standings):
            a = standings[i][0:2]
            i += 1
            b = standings[i][0:2]
            i += 1
	    j += [(a + b)]
        print j
        return j

