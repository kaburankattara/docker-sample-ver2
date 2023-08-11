echo mysqlのデータディレクトリを削除
rm -rf volumes/mysql/datadir

echo dockerを起動
docker-compose -f docker-compose.yml -p mysql up --build -d
