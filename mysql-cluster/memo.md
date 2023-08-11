
# クラスター構成を確認する
管理サーバのターミナルでndb_mgmコマンドを実行
ndb_mgm内でshowコマンドを実行する

```shell
sh-4.4# ndb_mgm
-- NDB Cluster -- Management Client --
ndb_mgm> show
Connected to Management Server at: 192.168.0.2:1186
Cluster Configuration
---------------------
[ndbd(NDB)]     2 node(s)
id=2    @192.168.0.3  (mysql-8.0.31 ndb-8.0.31, Nodegroup: 0, *)
id=3    @192.168.0.4  (mysql-8.0.31 ndb-8.0.31, Nodegroup: 0)

[ndb_mgmd(MGM)] 1 node(s)
id=1    @192.168.0.2  (mysql-8.0.31 ndb-8.0.31)

[mysqld(API)]   1 node(s)
id=4    @192.168.0.10  (mysql-8.0.31 ndb-8.0.31)

ndb_mgm> 
```

# 参考文献
## docker hub mysql-cluster
https://hub.docker.com/r/mysql/mysql-cluster

## MySQL Cluster 7.6をdockerコンテナで動かすには？
https://style.potepan.com/articles/17620.html

## MySQL Doc MySQL NDB Cluster 8.0
https://dev.mysql.com/doc/refman/8.0/ja/mysql-cluster.html

## MySQL Doc MySQL Cluster CGE
https://www.mysql.com/products/cluster/

## docker composeサンプル
https://github.com/mlucasdasilva/cluster-mysql/blob/master/docker-compose.yml

## NRIのMySQL Cluster記事
https://openstandia.jp/oss_info/mysql-cluster/

## Docker Compose コンテナのIPアドレスを固定する方法
https://zaki-hmkc.hatenablog.com/entry/2021/02/26/234357
