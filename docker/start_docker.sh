#!/usr/bin/env bash
set -e
docker-compose --no-ansi up --build -d $*

echo Waiting for MySQL...
while ! bash -c "docker-compose logs db | grep -q 'port: 3306  MySQL Community Server'"; do sleep 1; done
MY_SQL_PORT=$(docker-compose port db 3306 | awk -F : '{print $2}')
echo MySQL is ready on port ${MY_SQL_PORT}
