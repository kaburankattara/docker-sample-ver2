#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$PROD_DB_NAME" <<-EOSQL
  -- スキーマを作成
  CREATE SCHEMA "$PROD_SCHEMA_NAME" AUTHORIZATION "$SUPERUSER_ROLE_NAME";
  CREATE SCHEMA "$PROD_SCHEMA2_NAME" AUTHORIZATION "$SUPERUSER_ROLE_NAME";

  -- 本番DBの本番スキーマ用のロールを作成
  CREATE ROLE "$PROD_SCHEMA_ROLE_NAME" WITH LOGIN PASSWORD '$PROD_SCHEMA_ROLE_PASSWORD';
  ALTER USER "$PROD_SCHEMA_ROLE_NAME" SET search_path TO "$PROD_SCHEMA_NAME";
  GRANT USAGE ON SCHEMA "$PROD_SCHEMA_NAME" TO "$PROD_SCHEMA_ROLE_NAME";
  REVOKE CREATE, TEMPORARY, TEMP ON DATABASE "$PROD_DB_NAME" FROM "$PROD_SCHEMA_ROLE_NAME";
  REVOKE CREATE ON SCHEMA "$PROD_SCHEMA_NAME" FROM "$PROD_SCHEMA_ROLE_NAME";

  -- 本番DBの予備スキーマ用のロールを作成
  CREATE ROLE "$PROD_SCHEMA2_ROLE_NAME" WITH LOGIN PASSWORD '$PROD_SCHEMA2_ROLE_PASSWORD';
  ALTER USER "$PROD_SCHEMA2_ROLE_NAME" SET search_path TO "$PROD_SCHEMA2_NAME";
  GRANT USAGE ON SCHEMA "$PROD_SCHEMA2_NAME" TO "$PROD_SCHEMA2_ROLE_NAME";
  REVOKE CREATE, TEMPORARY, TEMP ON DATABASE "$PROD_DB_NAME" FROM "$PROD_SCHEMA2_ROLE_NAME";
  REVOKE CREATE ON SCHEMA "$PROD_SCHEMA2_NAME" FROM "$PROD_SCHEMA2_ROLE_NAME";

  -- 本番DBの本番スキーマ用の読み取り専用のロールを作成
  CREATE ROLE "$PROD_SCHEMA_READ_ONLY_ROLE_NAME" WITH LOGIN PASSWORD '$PROD_SCHEMA_READ_ONLY_ROLE_PASSWORD';
  ALTER USER "$PROD_SCHEMA_READ_ONLY_ROLE_NAME" SET search_path TO "$PROD_SCHEMA_NAME";
  GRANT USAGE ON SCHEMA "$PROD_SCHEMA_NAME" TO "$PROD_SCHEMA_READ_ONLY_ROLE_NAME";
  REVOKE CREATE, TEMPORARY, TEMP ON DATABASE "$PROD_DB_NAME" FROM "$PROD_SCHEMA_READ_ONLY_ROLE_NAME";

EOSQL

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$STAGING_DB_NAME" <<-EOSQL
  -- スキーマを作成
  CREATE SCHEMA "$STAGING_SCHEMA_NAME" AUTHORIZATION "$SUPERUSER_ROLE_NAME";
  CREATE SCHEMA "$DEVELOP_SCHEMA_NAME" AUTHORIZATION "$SUPERUSER_ROLE_NAME";

  -- 検証DBの開発スキーマ用のロールを作成
  CREATE ROLE "$DEVELOP_SCHEMA_ROLE_NAME" WITH LOGIN PASSWORD '$DEVELOP_SCHEMA_ROLE_PASSWORD';
  ALTER USER "$DEVELOP_SCHEMA_ROLE_NAME" SET search_path TO "$DEVELOP_SCHEMA_NAME";
  GRANT USAGE ON SCHEMA "$DEVELOP_SCHEMA_NAME" TO "$DEVELOP_SCHEMA_ROLE_NAME";
  REVOKE CREATE, TEMPORARY, TEMP ON DATABASE "$STAGING_DB_NAME" FROM "$DEVELOP_SCHEMA_ROLE_NAME";
  REVOKE CREATE ON SCHEMA "$DEVELOP_SCHEMA_NAME" FROM "$DEVELOP_SCHEMA_ROLE_NAME";

  -- 検証DBの検証スキーマ用のロールを作成
  CREATE ROLE "$STAGING_SCHEMA_ROLE_NAME" WITH LOGIN PASSWORD '$STAGING_SCHEMA_ROLE_PASSWORD';
  ALTER USER "$STAGING_SCHEMA_ROLE_NAME" SET search_path TO "$STAGING_SCHEMA_NAME";
  GRANT USAGE ON SCHEMA "$STAGING_SCHEMA_NAME" TO "$STAGING_SCHEMA_ROLE_NAME";
  REVOKE CREATE, TEMPORARY, TEMP ON DATABASE "$STAGING_DB_NAME" FROM "$STAGING_SCHEMA_ROLE_NAME";
  REVOKE CREATE ON SCHEMA "$STAGING_SCHEMA_NAME" FROM "$STAGING_SCHEMA_ROLE_NAME";

EOSQL
