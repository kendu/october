#!/bin/bash

SUPERU="postgres"
DBHOST="db"
DBNAME="october"
DBUSERPASS="g7453ng4fj23djgfnHIOB8jG87gUJ"

if [[ -z $(psql -h db -U ${SUPERU} -p 5432 --list | grep ${DBNAME}) ]]; then
    echo ">>> Database (${DBNAME}) not found - creating"
    psql -h db -p 5432 -U ${SUPERU} ${PGDATABASE} < $( echo "CREATE USER irams
    LOGIN
    PASSWORD \'${DBUSERPASS}\'
    NOSUPERUSER
    NOCREATEDB
    NOCREATEROLE;
    " )
    createdb -h ${DBHOST} -p 5432 -U ${SUPERU} -o ${DBNAME} ${DBNAME}
    rm .dbPatch.log
fi
