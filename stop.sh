#!/bin/sh

for container in fastladder_web fastladder_db ; do
  echo -n "=> Stopping: "
  docker stop $container
  echo -n "=> Removing: "
  docker rm $container
done
