#!/bin/bash

URI=$1
FLAG=$2

if [ -z "$URI" ]; then
  printf "Connection URI string argument is required"
  exit
fi

# (sorry, I know, my bash jiu jitsu sucks)

USER=$(printf "$URI" | cut -d':' -f2 | cut -c 3-)
PASS=$(printf "$URI" | cut -d':' -f3 | cut -d'@' -f1)
HOST=$(printf "$URI" | cut -d':' -f3 | cut -d'@' -f2)
PORT=$(printf "$URI" | cut -d':' -f4 | cut -d'/' -f1)
DB=$(printf "$URI" | cut -d':' -f4 | cut -d'/' -f2)

if [ "$FLAG" == "--preview" ]; then
  printf "PGPASSWORD=$PASS psql -U $USER -h $HOST -p $PORT $DB"
  exit
fi

if [ "$FLAG" == "--preview-pgdump" ]; then
  printf "PGPASSWORD=$PASS pg_dump -U $USER -h $HOST -p $PORT $DB"
  exit
fi

PGPASSWORD=$PASS psql -U $USER -h $HOST -p $PORT $DB ${@:2}