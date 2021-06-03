`t_test`CREATE TABLE t_test(
	te_id INT AUTO_INCREMENT,
	te_name VARCHAR(200),
	te_content TEXT,
	insert_date DATETIME,
	modify_date DATETIME,
	PRIMARY KEY(te_id)
);

INSERT INTO t_test SET te_name = 'test1111', te_content = '테스트입니다.', insert_date=NOW();
INSERT INTO t_test SET te_name = 'test2222', te_content = '테스트입니다.', insert_date=NOW();
INSERT INTO t_test SET te_name = 'test3333', te_content = '테스트입니다.', insert_date=NOW();
INSERT INTO t_test SET te_name = 'test4444', te_content = '테스트입니다.', insert_date=NOW();
INSERT INTO t_test SET te_name = 'test5555', te_content = '테스트입니다.', insert_date=NOW();

SELECT * FROM t_test;