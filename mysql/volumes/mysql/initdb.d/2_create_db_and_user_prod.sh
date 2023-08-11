#!/bin/bash
set -e

mysql=( mysql --protocol=socket -uroot -p"${MYSQL_ROOT_PASSWORD}" )

"${mysql[@]}" <<-EOSQL

  -- データベースを作成
  CREATE DATABASE ${PROD_DATABASE_NAME};
  ALTER DATABASE ${PROD_DATABASE_NAME} CHARACTER SET utf8 COLLATE utf8_general_ci;

  -- データベース専用のユーザーを作成
  CREATE USER '${PROD_USER_NAME}'@'%' IDENTIFIED BY '${PROD_USER_PASSWORD}';
  GRANT ALL PRIVILEGES ON ${PROD_DATABASE_NAME}.* TO '${PROD_USER_NAME}'@'%';
  -- 変更を反映するために、FLUSH PRIVILEGESコマンドを実行
  FLUSH PRIVILEGES;

EOSQL
