#!/bin/sh
cd ~/workspace/docker-sample/kafka/docker/

echo dockerを起動
docker-compose -f docker-compose.yml -p kafka up
