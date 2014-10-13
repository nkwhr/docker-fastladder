#!/bin/sh

set -e

MYSQL_PASSWORD="p@ssw0rd"
MYSQL_DATADIR="$(pwd)/data"

echo -n "=> Starting fastladder_db: "

docker run \
       --detach \
       --volume $MYSQL_DATADIR:/var/lib/mysql \
       --env MYSQL_ROOT_PASSWORD=$MYSQL_PASSWORD \
       --name fastladder_db \
       mysql:5.6

sleep 10

echo -n "=> Starting fastladder_web: "

docker run \
       --detach \
       --link fastladder_db:mysql \
       --env MYSQL_HOST=mysql \
       --env MYSQL_PASSWORD=$MYSQL_PASSWORD \
       --publish 5000:5000 \
       --name fastladder_web \
       nkwhr/fastladder
