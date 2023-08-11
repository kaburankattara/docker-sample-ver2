#!/bin/bash
set -e

# DDLの実行
psql -v ON_ERROR_STOP=1 --username "$SUPERUSER_ROLE_NAME" --dbname "$PROD_DB_NAME" -c "set search_path to $PROD_SCHEMA2_NAME;" -f /initdata/ddl/ddl.sql

# DMLの実行
psql -v ON_ERROR_STOP=1 --username "$SUPERUSER_ROLE_NAME" --dbname "$PROD_DB_NAME" -c "set search_path to $PROD_SCHEMA2_NAME;" -f /initdata/dml/import.sql

# functionを生成
psql -v ON_ERROR_STOP=1 --username "$SUPERUSER_ROLE_NAME" --dbname "$PROD_DB_NAME" -c "set search_path to $PROD_SCHEMA2_NAME;" -f /initdata/function/sf_translate_case.sql

# ロールにテーブルへの権限を設定
psql -v ON_ERROR_STOP=1 --username "$SUPERUSER_ROLE_NAME" --dbname "$PROD_DB_NAME" <<-EOSQL
  set search_path to "$PROD_SCHEMA2_NAME";

  -- prod2スキーマ用のユーザーを作成
  GRANT ALL ON ALL TABLES IN SCHEMA "$PROD_SCHEMA2_NAME" TO "$PROD_SCHEMA2_ROLE_NAME";
  REVOKE RULE, REFERENCES, TRIGGER ON ALL TABLES IN SCHEMA "$PROD_SCHEMA2_NAME" FROM "$PROD_SCHEMA2_ROLE_NAME";
  -- シーケンスがある場合
  -- GRANT USAGE, SELECT ON SEQUENCE seq_name TO "$PROD_SCHEMA2_ROLE_NAME";

EOSQL
