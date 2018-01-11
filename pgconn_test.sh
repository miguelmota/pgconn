#!/bin/bash

source ./assert.sh

URI='postgres://awsuser:MySeCrEt@fake-db.bmauoc9z0fpi.us-east-1.rds.amazonaws.com:5432/ebdb'

# (sorry, I know, my bash jiu jitsu sucks)

USER=$(printf "$URI" | cut -d':' -f2 | cut -c 3-)
PASS=$(printf "$URI" | cut -d':' -f3 | cut -d'@' -f1)
HOST=$(printf "$URI" | cut -d':' -f3 | cut -d'@' -f2)
PORT=$(printf "$URI" | cut -d':' -f4 | cut -d'/' -f1)
DB=$(printf "$URI" | cut -d':' -f4 | cut -d'/' -f2)

assert_eq $USER "awsuser" "Invalid user"
assert_eq $PASS "MySeCrEt" "Invalid pass"
assert_eq $HOST "fake-db.bmauoc9z0fpi.us-east-1.rds.amazonaws.com" "Invalid host"
assert_eq $PORT "5432" "Invalid port"
assert_eq $DB "ebdb" "Invalid db"

printf "done"
