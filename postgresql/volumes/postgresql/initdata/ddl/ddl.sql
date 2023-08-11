
create table test_table (
  test_cd character varying(4) not null
  , test_name character varying(20) default '' not null
  , delete_flg boolean default false not null
  , regist_ymd timestamp without time zone not null
  , update_ymd timestamp without time zone not null
  , constraint test_table_PKC primary key (test_cd)
) ;

comment on table test_table is 'テストテーブル';
comment on column test_table.test_cd is 'テストCD';
comment on column test_table.test_name is 'テスト名';
comment on column test_table.delete_flg is '削除フラグ';
comment on column test_table.regist_ymd is '登録日時';
comment on column test_table.update_ymd is '更新日時';
