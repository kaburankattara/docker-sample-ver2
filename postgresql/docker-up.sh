echo postgresqlのデータディレクトリを削除
rm -rf volumes/postgresql/datadir

echo dockerを起動
docker-compose -f docker-compose.yml -p project_name up
