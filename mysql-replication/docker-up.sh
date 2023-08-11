#!/bin/sh

echo mysqlのデータディレクトリを削除
rm -rf volumes/source/db
rm -rf volumes/source/log
rm -rf volumes/replica/db
rm -rf volumes/replica/log

echo dockerを起動
docker-compose -f docker-compose.yml -p mysql-replication up
