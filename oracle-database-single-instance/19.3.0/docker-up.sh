#!/bin/sh

# echo データディレクトリ内を削除
#rm -rf volumes/opt/oracle/oradata/

echo データディレクトリの権限を変更
chmod 777 volumes/opt/oracle/oradata
chmod 777 volumes/opt/oracle/scripts

echo dockerを起動
docker-compose -f docker-compose.yml -p oracle-database-19c up
