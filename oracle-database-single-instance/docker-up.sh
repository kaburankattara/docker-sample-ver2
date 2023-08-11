#!/bin/sh

echo データディレクトリを削除
rm -rf volumes/opt/oracle/oradata

echo dockerを起動
docker-compose -f docker-compose.yml -p oracle-database up
