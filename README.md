# tournament
Udacity Full Stack Nanodegree - 2nd project

tournament.sql is a postgresql db that has records for a tournament including that includes players and how many wins they have and matches played.

tournament.py is a python file with functions that will insert and delete data from the database or pull information use as player stats from it

tournament_test.py is the test script

to run:

load tournament.sql into postgresql by running psql and the while in the same direct as the tournament files, use the command: \i tournament.sql

(i used postgresql in a linux virtual machine using vagrant and virtualbox and the vm from https://github.com/udacity/fullstack-nanodegree-vm as presented on the project details) 

then run the tournament_test.py script by using the command: python tournament_test.py

then you should see the results!
