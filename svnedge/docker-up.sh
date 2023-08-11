#echo svnedgeのデータディレクトリを削除
# rm -rf volumes/svnedge/csvn/data

echo dockerを起動
docker-compose -f docker-compose.yml -p svn-server up
