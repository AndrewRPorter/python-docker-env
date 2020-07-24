#!/bin/bash

docker-compose -f conf/docker-dev.yml pull
docker-compose -f conf/docker-dev.yml up