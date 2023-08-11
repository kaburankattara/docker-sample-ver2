-- クライアントエンコーディンの文字列をUTF-8に変更しておく
set client_encoding to 'utf8';

-- インポート
 \COPY test_table FROM '/initdata/dml/csv/test_table.csv' WITH CSV DELIMITER ',' encoding 'UTF8';
