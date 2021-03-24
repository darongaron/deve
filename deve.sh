#!/bin/sh
APP_DIR=`pwd` docker-compose -f /opt/deve/docker-compose.yml up -d
##docker-compose -f /opt/deve/docker-compose.yml exec sh ash
docker exec -it --detach-keys "ctrl-e,ctrl-e" $(docker-compose -f /opt/deve/docker-compose.yml ps -q sh) bash
docker-compose -f /opt/deve/docker-compose.yml down
