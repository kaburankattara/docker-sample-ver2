# データベースの文字コードを確認
確認したいデータベースをuseで使用するようにし、文字コードと照合順序のシステム変数を確認する

```sql
USE test;
SELECT @@character_set_database, @@collation_database;
```

# データベース一覧
```sql
show databases;
```

# 現在使用しているデータベースを確認
```sql
SELECT database();
```

# ユーザー一覧
```sql
select * from mysql.user 
```




