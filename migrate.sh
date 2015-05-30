#!/bin/bash

sleep ${SLEEP}
exec shmig -t postgresql -d ${DB_NAME} -l ${DB_USER} -H ${DB_HOST} -p ${DB_PASSWORD} -m /migrations "$1" "$2"
