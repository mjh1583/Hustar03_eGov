# 테이블 생성
CREATE TABLE t_student(
	st_id INT	AUTO_INCREMENT,
	st_name VARCHAR(20) NOT NULL DEFAULT ' ' COMMENT '이름',
	st_height VARCHAR(20),
	st_weight VARCHAR(20),
	st_school VARCHAR(20),
	st_major VARCHAR(20),
	st_birth VARCHAR(10),
	st_content TEXT,
	insert_date DATETIME,
	modify_date DATETIME,
	PRIMARY KEY(st_id)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

# 실행 단축키 F9

# 데이터 자료형
# 문자형, 숫자형, 날짜형
# 문자형
# char(5) : 크기가 고정
# varchar(10) : 크기가 가변적 ex) 글자의 크기가 10보다 작으면 10보다 작게 적용됨
# text : 긴 문자열 ex) 게시판의 내용
#
# int
# tinyint
# float
#
# date		'YYYY-MM-DD'
# datetime	'YYYY-MM-DD HH:mm:ss'
# time		'HH:mm:ss'

# 테이블 구조 확인
DESC t_student;

# 전체 테이블 조회
SHOW TABLES;

# 테이블 생성 쿼리 확인
SHOW CREATE TABLE t_student;

# 테이블 삭제
DROP TABLE t_student;

# 테이블 컬럼 추가
ALTER TABLE t_student ADD st_nick VARCHAR(10) AFTER st_name;

# 테이블 컬럼 수정
ALTER TABLE t_student MODIFY st_nick VARCHAR(50);

# 테이블 컬럼 삭제
ALTER TABLE t_student DROP st_nick;

# 테이블 명 변경
ALTER TABLE t_student RENAME TO t_student2;
ALTER TABLE t_student2 RENAME TO t_student;

# 데이터 등록
INSERT INTO t_student(st_name, st_height, st_weight, st_school, st_major, st_birth, insert_date) 
VALUES('홍길동', '180', '70', '휴스타학교', '컴퓨터공학과', '1990-01-01', NOW());

INSERT INTO t_student(st_height, st_weight, st_school, st_major, st_birth, insert_date) 
VALUES('180', '70', '휴스타학교', '컴퓨터공학과', '1990-01-01', NOW());

INSERT INTO t_student(st_name, st_height, st_weight, st_school, st_major, st_birth, insert_date) 
VALUES('조인성', '170', '81', '휴스타학교', '디자인과', '1984-01-09', NOW());

INSERT INTO t_student(st_name, st_height, st_weight, st_school, st_major, st_birth, insert_date) 
VALUES('김태희', '160', '50', 'IACT학교', '컴퓨터공학과', '1992-12-31', NOW());

INSERT INTO t_student(st_name, st_height, st_weight, st_school, st_major, st_birth, insert_date) 
VALUES('송혜교', '158', '45', 'IACT학교', '디자인과', '1990-12-01', NOW());

INSERT INTO t_student(st_name, st_height, st_weight, st_school, st_major, st_birth, insert_date) 
VALUES('송중기', '176', '65', '휴스타학교', '컴퓨터공학과', '1990-03-05', NOW());

INSERT INTO t_student(st_name, st_height, st_weight, st_school, st_major, st_birth, insert_date) 
VALUES('유재석', '179', '73', 'IACT학교', '컴퓨터공학과', '1990-04-01', NOW());

INSERT INTO t_student SET 
st_name = '김흥국',
st_height = '170',
st_weight = '80',
st_school = '휴스타학교',
st_major = '컴퓨터공학과',
st_birth = '1989-07-21',
insert_date = NOW();

# 데이터 조회
SELECT * FROM t_student;

# 데이터 수정
UPDATE t_student SET st_height='170' WHERE st_id='1';
UPDATE t_student SET st_height=st_height + 1 WHERE st_id='1';

# 데이터 삭제
DELETE FROM t_student WHERE st_id = '2';

# 데이터 선택 조회
SELECT st_name, st_school, st_birth FROM t_student;
SELECT st_name FROM t_student;
SELECT st_name AS '이름' FROM t_student;

# count
SELECT COUNT(*) FROM t_student;

# order by : 데이터 정렬 (ASC, DESC) - 오름차순, 내림차순
SELECT * FROM t_student WHERE (1) ORDER BY st_name ASC;
SELECT * FROM t_student WHERE (1) ORDER BY st_height DESC;

SELECT st_height, st_name FROM t_student WHERE (1) ORDER BY st_height DESC, st_name ASC;

SELECT * FROM t_student ORDER BY insert_date DESC, st_id DESC;

# where
SELECT * FROM t_student WHERE st_name = '조인성';
SELECT * FROM t_student WHERE st_height = '170';
SELECT * FROM t_student WHERE st_id = '7';

SELECT * FROM t_student WHERE st_height >= 170 AND st_weight <= 75;
SELECT * FROM t_student WHERE st_height >= 175 OR st_weight <= 70;

# like
SELECT * FROM t_student WHERE st_name  LIKE '김%';
SELECT * FROM t_student WHERE st_name  LIKE '송%';
SELECT * FROM t_student WHERE st_name  LIKE '%국%';

# max, min, avg, sum
SELECT MAX(st_height) FROM t_student;
SELECT MIN(st_height) FROM t_student;
SELECT AVG(st_height) FROM t_student;
SELECT SUM(st_height) FROM t_student WHERE st_name LIKE '김%';

# distinct : 중복 제거
SELECT DISTINCT st_school FROM t_student;

# group by : select 문에서 가장 많이 쓰이고 중요함
SELECT st_school, COUNT(*) AS cnt FROM t_student GROUP BY st_school;

SELECT st_school, COUNT(*) AS cnt,
		MAX(st_height) AS max_height,
		MIN(st_height) AS min_height,
		AVG(st_height) AS avg_height,
		SUM(st_height) AS sum_height
		FROM t_student 
		GROUP BY st_school;

SELECT st_school, GROUP_CONCAT(st_name) AS st_names FROM t_student GROUP BY st_school;
SELECT st_school, GROUP_CONCAT(st_name ORDER BY st_name ASC SEPARATOR ' | ') AS st_names FROM t_student GROUP BY st_school;

# limit : 페이징 기능에서 많이 사용됨
SELECT * FROM t_student WHERE st_school LIKE 'IACT%' ORDER BY st_name ASC LIMIT 0, 2;

# if
SELECT st_name, IF(st_name = '유재석', '개그맨', '기타') AS job FROM t_student;
SELECT st_height, IF(st_height > 175, '장신', '단신') AS height FROM t_student;
SELECT SUM(IF(st_height > 175, st_height , 0)) FROM t_student;
SELECT SUM(st_height) FROM t_student WHERE st_height > 175;

# ifnull
SELECT * FROM t_student;
SELECT *, modify_date, IFNULL(modify_date, '0000-00-00 00:00:00') AS modify_date2 FROM t_student;

# case when
SELECT st_name,
	CASE
		WHEN st_name = '유재석' THEN '개그맨'
		WHEN st_name = '김흥국' THEN '가수'
		ELSE '기타'
	END AS job
FROM t_student;

# 예제) 학생 중 키가 175이하인 학생 중 키가 제일 큰 학생의 이름, 키를 구하세요.
SELECT st_name '이름', MAX(st_height) AS '키' FROM t_student WHERE st_height < 175;
SELECT
	st_name AS '이름',
	MAX(IF(st_height > 175, 0 , st_height)) AS '키'
	FROM t_student;

SELECT st_name, st_height FROM t_student WHERE st_height <= 175 ORDER BY st_height DESC LIMIT 0, 1;		# best
	
# 기타 함수들
# abs : 절대값
SELECT (st_height * -1), ABS(st_height * -1) AS '절대값' FROM t_student;

# floor : 소수점 버림
SELECT st_weight, (st_weight / 10), FLOOR(st_weight / 10) FROM t_student;

# ceiling : 소수점 올림
SELECT st_weight, (st_weight / 10), CEILING(st_weight / 10) FROM t_student;

# round : 반올림
SELECT st_weight, (st_weight / 7), ROUND(st_weight / 7, 0), ROUND(st_weight / 7, 1), ROUND(st_weight / 7, 2) FROM t_student;
SELECT st_weight, (st_weight / 7), ROUND(st_weight / 7, -1) FROM t_student;

# concat : 문자열 붙이기
SELECT CONCAT('1', '2', '3', '4');
SELECT *, CONCAT(st_school, '_', st_major, '_', st_name) FROM t_student;

# replace : 문자열 치환
SELECT st_name, REPLACE(st_name, '홍', '고') FROM t_student; 

# left, right, substring(mid) : 문자열 자르기
SELECT st_name, LEFT(st_name, 1) FROM t_student;
SELECT st_birth, LEFT(st_birth, 4) FROM t_student;

SELECT st_birth, RIGHT(st_birth, 2) FROM t_student;
SELECT insert_date, RIGHT(insert_date, 8) FROM t_student;
SELECT insert_date, LEFT(insert_date, 10), RIGHT(insert_date, 8) FROM t_student;

SELECT st_birth, SUBSTRING(st_birth, 6, 2), MID(st_birth, 9, 2) FROM t_student;

# ltrim, rtrim, trim : 공백 제거
UPDATE t_student SET st_name = '  홍길동' WHERE st_id = '1';
SELECT * FROM t_student;

SELECT st_name, LTRIM(st_name) FROM t_student;
SELECT * FROM t_student WHERE  LTRIM(st_name) = '홍길동';

# date_add, date_sub : 날짜 연산
SELECT insert_date, DATE_ADD(insert_date, INTERVAL + 1 YEAR) FROM t_student;
SELECT insert_date, DATE_ADD(insert_date, INTERVAL + 2 MONTH) FROM t_student;
SELECT insert_date, DATE_ADD(insert_date, INTERVAL + 3 DAY) FROM t_student;
SELECT insert_date, DATE_ADD(insert_date, INTERVAL + 4 HOUR) FROM t_student;
SELECT insert_date, DATE_ADD(insert_date, INTERVAL + 5 MINUTE) FROM t_student;
SELECT insert_date, DATE_ADD(insert_date, INTERVAL + 6 SECOND) FROM t_student;

SELECT insert_date, DATE_ADD(insert_date, INTERVAL - 1 YEAR) FROM t_student;

# date_format : 날짜 형식 지정
SELECT insert_date, DATE_FORMAT(insert_date, '%Y.%m.%d %h:%i:%s') FROM t_student;

UPDATE t_student SET st_name = '홍길동' WHERE st_id = '1';