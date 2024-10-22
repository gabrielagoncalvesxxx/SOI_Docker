#!/bin/bash
docker build -t imgjavaaula .

mkdir -p /usr/src/projjava

docker run -d --name javaaula -v /usr/src/projjava:/usr/src/projjava imgjavaaula

docker ps
