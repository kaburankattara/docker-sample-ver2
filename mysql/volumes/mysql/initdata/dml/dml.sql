-- set character_set_database=utf8
load data infile '/initdata/dml/csv/sample.csv' into table `sample` fields terminated by ',' enclosed by '"';
load data infile '/initdata/dml/csv/sample_element.csv' into table sample_element fields terminated by ',' enclosed by '"';
-- SELECT * FROM tbl_name INTO OUTFILE 'tbl_name.csv' CHARACTER SET 'utf8' FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"';
