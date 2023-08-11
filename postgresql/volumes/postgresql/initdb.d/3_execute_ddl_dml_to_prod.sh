#!/bin/bash
set -e

# DDLの実行
psql -v ON_ERROR_STOP=1 --username "$SUPERUSER_ROLE_NAME" --dbname "$PROD_DB_NAME" -c "set search_path to $PROD_SCHEMA_NAME;" -f /initdata/ddl/ddl.sql

# DMLの実行
psql -v ON_ERROR_STOP=1 --username "$SUPERUSER_ROLE_NAME" --dbname "$PROD_DB_NAME" -c "set search_path to $PROD_SCHEMA_NAME;" -f /initdata/dml/import.sql

# functionを生成
# psql -v ON_ERROR_STOP=1 --username "$SUPERUSER_ROLE_NAME" --dbname "$PROD_DB_NAME" -c "set search_path to $PROD_SCHEMA_NAME;" -f /initdata/function/sf_translate_case.sql

# ロールにテーブルへの権限を設定
psql -v ON_ERROR_STOP=1 --username "$SUPERUSER_ROLE_NAME" --dbname "$PROD_DB_NAME" <<-EOSQL
  set search_path to "$PROD_SCHEMA_NAME";

  -- prodスキーマ用のユーザーを作成
  GRANT ALL ON ALL TABLES IN SCHEMA "$PROD_SCHEMA_NAME" TO "$PROD_SCHEMA_ROLE_NAME";
  REVOKE RULE, REFERENCES, TRIGGER ON ALL TABLES IN SCHEMA "$PROD_SCHEMA_NAME" FROM "$PROD_SCHEMA_ROLE_NAME";
  -- シーケンスがある場合
  -- GRANT USAGE, SELECT ON SEQUENCE seq_name TO "$DEVELOP_SCHEMA_ROLE_NAME";

  -- prodスキーマ用の読み取り専用ユーザーを作成
  GRANT ALL ON ALL TABLES IN SCHEMA "$PROD_SCHEMA_NAME" TO "$PROD_SCHEMA_READ_ONLY_ROLE_NAME";
  REVOKE INSERT, UPDATE, DELETE, RULE, REFERENCES, TRIGGER ON ALL TABLES IN SCHEMA "$PROD_SCHEMA_NAME" FROM "$PROD_SCHEMA_READ_ONLY_ROLE_NAME";

EOSQL
