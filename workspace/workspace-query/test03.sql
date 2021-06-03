# 2중 select select (보여주기 위한 친구) from where(테이블을 추려주기 위한 친구) : 다음과 같이 작성할 경우 에러 
SELECT st_id, AVG(sc_score) AS avg_score FROM t_student_score GROUP BY st_id;
SELECT st_id, AVG(sc_score) AS avg_score FROM t_student_score WHERE avg_score >= 80 GROUP BY st_id;

# from에 avg_score를 테이블을 미리 만들어두고 거기서 where을 통해 검색함
SELECT st_id, avg_score
	FROM 
		(SELECT st_id, AVG(sc_score) AS avg_score FROM t_student_score GROUP BY st_id) AS T1 
	WHERE avg_score >= 80;

# 평균점수가 가장 높은 2명 학생ID를 구하세요.
# SELECT st_id, AVG(sc_score) AS avg_score FROM t_student_score GROUP BY st_id ORDER BY avg_score DESC LIMIT 0,2;
SELECT st_id AS st_id, avg_score
	FROM
		(SELECT st_id, AVG(sc_score) AS avg_score FROM t_student_score GROUP BY st_id) T1
	ORDER BY avg_score DESC
	LIMIT 0, 2;

#?
	#SELECT st_id, AVG(sc_score) AS avg_score FROM t_student_score GROUP BY st_id ORDER BY avg_score DESC limit 0, 2

SELECT *FROM t_student;

UPDATE t_student SET st_name = '홍길동' WHERE st_id = '8';

#예제1) 학생 테이블에서 학생 중 동명이인이 존재하는 학생의 이름, 몇명인지를 출려하세요.
SELECT st_name, cnt
	FROM
		(SELECT st_name, COUNT(*) AS cnt FROM t_student GROUP BY st_name) T1
	WHERE cnt > 1
	ORDER BY cnt DESC, st_name ASC;

#예제2) 학생점수 테이블에서 학생별 수강한 학점의 합순으로 정렬하세요.
# 등급이 F면 학점인정 안됨 그 위로는 몇 학점을 들었는지
SELECT * FROM t_student_score;

SELECT st_id, SUM(sc_point) 'sc_point'  
	FROM 
		(SELECT st_id, sc_score, sc_point FROM t_student_score WHERE sc_score>=60) T1
	GROUP BY 
		st_id
	ORDER BY sc_point DESC;

SELECT st_id, SUM(sc_point) AS sc_point
	FROM
		(SELECT
			st_id,
			sc_score,
			sc_point, CASE
					WHEN sc_score >= 95 THEN 'A+'
					WHEN sc_score >= 90 THEN 'A'
					WHEN sc_score >= 85 THEN 'B+'
					WHEN sc_score >= 80 THEN 'B'
					WHEN sc_score >= 75 THEN 'C+'
					WHEN sc_score >= 70 THEN 'C'
					WHEN sc_score >= 65 THEN 'D+'
					WHEN sc_score >= 60 THEN 'D'
					ELSE 'F'
				END AS grade
		FROM t_student_score	
		) AS T1
	WHERE grade <> 'F'
	GROUP BY st_id
	ORDER BY sc_point DESC;	

#t_student 테이블에 st_pass varchar(10) 컬럼을 추가하고, 평균점수가 70점 이상인 학생들의  st_pass값을 '합격'으로 변경
ALTER TABLE t_student ADD st_pass VARCHAR(10);

SELECT *FROM t_student;

UPDATE t_student SET st_pass = '합격' WHERE st_id ='1' OR st_id = '2';

UPDATE t_student SET st_pass = '합격'
	WHERE st_id IN(
		SELECT st_id
			FROM
				(SELECT st_id, AVG(sc_score) AS avg_score FROM t_student_score GROUP BY st_id) AS T1
			WHERE avg_score >= 70
			
	); 

#join
#inner join
SELECT *FROM t_student AS T1 INNER JOIN t_student_score T2 ON T1.st_id = T2.st_id;

#outer join
#left outer join, right outer join
SELECT *FROM t_student AS T1 LEFT OUTER JOIN t_student_score T2 ON T1.st_id = T2.st_id;

SELECT *FROM t_student AS T1 RIGHT OUTER JOIN t_student_score T2 ON T1.st_id = T2.st_id;

SELECT *FROM t_student_score;

SELECT COUNT(*) FROM t_student AS T1 JOIN t_student_score T2;

SELECT st_id, AVG(sc_score) avg_score FROM t_student_score GROUP BY st_id;
#왼쪽 것을 기준으로 왼쪽은 모두 출력하고 오른쪽 것을 붙임  없는 것은 NULL로 표시함
#기본 join으로 할 경우 왼쪽 오른쪽 모두 있는 경우 출력 
SELECT T1.st_name, T2.avg_score, T2.max_score
	FROM t_student AS T1 
		LEFT OUTER JOIN
		(
			SELECT
				st_id,AVG(sc_score) avg_score, MAX(sc_score) max_score
				FROM t_student_score
				GROUP BY st_id
		) T2
		ON T1.st_id = T2.st_id;
#left outer join
#(
#	select
#		st_id, max(sc_score) max_score
#	from t_student_score
#	group by st_id
#) T3
#on T1.st_id = T3.ST_ID
#where T2.avg_score IS NOT NULL
ORDER BY T1.st_name ASC;

#예제) 학교가 휴스타학교인 학생 중 키가 170이상이고, 점수 데이터가 입력된 사람중  총점이 가장 낮은 1명의 이름, 총점을 구하세요.
SELECT *FROM t_student;
SELECT *FROM t_student_score;

SELECT st_name, SUM(sc_score) AS 'score' 
	FROM
		(SELECT st_id, st_name FROM t_student WHERE st_school = '휴스타학교' AND 'ST_height' > '170') T1
	LEFT OUTER JOIN 
		t_student_score T2 ON T1.st_id = T2.st_id
	WHERE sc_score IS NOT NULL
	GROUP BY st_name
	ORDER BY score ASC
	LIMIT 0,1;

SELECT T1.st_name, T2.sum_score
	FROM t_student T1
	LEFT OUTER JOIN(
		SELECT st_id, SUM(sc_score) AS sum_score FROM t_student_score GROUP BY st_id
		) T2
	ON T1.st_id = T2.st_id
	WHERE st_school = '휴스타학교' AND st_height >= 170 AND sum_score > 0
	ORDER BY sum_score ASC
	LIMIT 0,1;


SELECT  T1.st_name, T2.sum_score
	FROM t_student T1
	JOIN(
		SELECT st_id, SUM(sc_score) AS sum_score FROM t_student_score GROUP BY st_id
		) T2
	ON T1.st_id = T2.st_id
	WHERE st_school = '휴스타학교' AND st_height >= 170
	ORDER BY sum_score
	LIMIT 0,1;

SELECT *FROM t_student;

DROP TABLE t_school;

CREATE TABLE t_school(
	sl_id INT AUTO_INCREMENT,
	sl_name VARCHAR(20),
	PRIMARY KEY(sl_id)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;;

SHOW TABLES;

DESC t_school;

ALTER TABLE t_student ADD sl_id INT;

DESC t_student;

INSERT INTO t_school SET sl_name ='휴스타학교';
INSERT INTO t_school SET sl_name = 'IACT학교';

SELECT * FROM t_school;

SELECT st_school, sl_id FROM t_student;

UPDATE t_student SET sl_id ='1' WHERE st_school = '휴스타학교';
UPDATE t_student SET sl_id ='2' WHERE st_school = 'IACT학교';

UPDATE t_student SET sl_id=(
		CASE
			WHEN st_school='휴스타학교' THEN '1'
			WHEN st_school='IACT학교' THEN '2'
			ELSE '0'
		END	
	);

SELECT * FROM t_school;

DELETE FROM t_school WHERE sl_id IN('3','4');

ALTER TABLE t_student DROP st_school; 

SELECT T1.*,T2.* FROM t_student T1 LEFT OUTER JOIN t_school T2 ON T1.sl_id = T2.sl_id;

#예제1) t_student table에서 st_major에 대한 부분을 따로 테이블을 생성하고 데이터 insert,
# t_student에 ma_id추가, 해당학과에 맞는 키값 등록, join 쿼리 실행

DROP TABLE t_major;

CREATE TABLE t_major(
	mr_id INT AUTO_INCREMENT,
	mr_name VARCHAR(20),
	PRIMARY KEY(mr_id)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

INSERT INTO t_major SET mr_name = '컴퓨터공학과';
INSERT INTO t_major SET mr_name = '디자인과';

SELECT * FROM t_student;

ALTER TABLE t_student ADD mr_id INT;

DESC t_student;

UPDATE t_student SET mr_id=(
		CASE
			WHEN st_major='컴퓨터공학과' THEN '1'
			WHEN st_major='디자인과' THEN '2'
			ELSE '0'
		END	
	);

ALTER TABLE t_student DROP st_major;

DESC t_student;

SELECT * FROM t_major;

SELECT T1.st_id,T1.st_name, T2.mr_name FROM t_student T1 LEFT OUTER JOIN t_major T2 ON T1.mr_id = T2.mr_id;

SELECT T1.*, T2.*, T3.*
	FROM t_student T1
	LEFT OUTER JOIN	t_school T2 ON T1.sl_id = T2.sl_id
	LEFT OUTER JOIN t_major T3 ON T1.mr_id = T3.mr_id;

#index
#view : 자주 사용하는 것들을 테이블로 만들어서 사용하는 것 
CREATE VIEW v_student AS
	SELECT *FROM t_student WHERE st_height >= 170;

SELECT * FROM t_student;
SELECT * FROM v_student;

CREATE VIEW v_student_score_sum AS
	SELECT st_id, SUM(sc_score) AS sum_score FROM t_student_score GROUP BY st_id;

SELECT *FROM v_student_score_sum;

CREATE VIEW v_student_score_grade AS
	SELECT
		*, 
		CASE
			WHEN sc_score >= 95 THEN 'A+'
			WHEN sc_score >= 90 THEN 'A'
			WHEN sc_score >= 85 THEN 'B+'
			WHEN sc_score >= 80 THEN 'B'
			WHEN sc_score >= 75 THEN 'C+'
			WHEN sc_score >= 70 THEN 'C'
			WHEN sc_score >= 65 THEN 'D+'
			WHEN sc_score >= 60 THEN 'D'
			ELSE 'F'
		END AS grade
	FROM t_student_score; 

SELECT * FROM v_student_score_grade;

#과목명 검색 실습 등 여러가지 실습을 한다.
