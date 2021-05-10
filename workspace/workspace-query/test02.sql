# 테이블 생성 및 데이터 등록
CREATE TABLE t_student_score(
	sc_id INT AUTO_INCREMENT,
	st_id INT,
	sc_score INT,
	sc_course VARCHAR(20),
	sc_point INT,
	PRIMARY KEY(sc_id)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

INSERT INTO t_student_score SET st_id='1', sc_score='97', sc_course = 'JAVASCRIPT', sc_point = '3';
INSERT INTO t_student_score SET st_id='1', sc_score='56', sc_course = 'DB', sc_point = '5';
INSERT INTO t_student_score SET st_id='1', sc_score='67', sc_course = 'HTML', sc_point = '2';
INSERT INTO t_student_score SET st_id='3', sc_score='54', sc_course = 'JAVASCRIPT', sc_point = '3';
INSERT INTO t_student_score SET st_id='3', sc_score='75', sc_course = 'DB', sc_point = '5';
INSERT INTO t_student_score SET st_id='4', sc_score='81', sc_course = 'HTML', sc_point = '2';
INSERT INTO t_student_score SET st_id='5', sc_score='67', sc_course = 'JAVASCRIPT', sc_point = '3';
INSERT INTO t_student_score SET st_id='5', sc_score='91', sc_course = 'DB', sc_point = '5';
INSERT INTO t_student_score SET st_id='5', sc_score='75', sc_course = 'HTML', sc_point = '2';
INSERT INTO t_student_score SET st_id='5', sc_score='70', sc_course = 'CSS', sc_point = '2';

SELECT * FROM t_student_score;

# 예제1) 학생 점수 테이블에서 최고, 최저 점수를 구하세요.
SELECT MAX(sc_score) '최고점', MIN(sc_score) '최저점' FROM t_student_score;

# 예제2) 학생 ID별 평균점수를 구하세요.
SELECT st_id '학생 ID', AVG(sc_score) '평균점수', COUNT(*) '수강한 과목 수' FROM t_student_score GROUP BY st_id;

# 예제3) 학생별로 점수등록이 3개이상일 경우, 최고점 최저점을 제외한 평균을, 3개 이하일 경우 모든 점수의 평균을 구하세요.
SELECT COUNT(sc_score) '점수 등록 개수', IF(COUNT(sc_score) >= 3, ((SUM(sc_score) - MAX(sc_score) - MIN(sc_score)) / (COUNT(sc_score) - 2)), AVG(sc_score)) '평균 점수' FROM t_student_score GROUP BY st_id;
SELECT IF(COUNT(*) >= 3, ((SUM(sc_score) - MAX(sc_score) - MIN(sc_score)) / (COUNT(sc_score) - 2)), AVG(sc_score)) '평균 점수' FROM t_student_score GROUP BY st_id;

# 예제4) 전체의 점수, 점수등급을 출력하세요. (95이상 A+, 90이상 A, 85이상 B+, 80이상 B, 75이상 C+, 70이상 C, 65이상 D+, 60이상 D, 60미만 F)
SELECT sc_score '점수', 
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
	END AS '등급' 
FROM t_student_score;

# 예제5) t_student table에서 각 핵생별 나이를 구하세요.
SELECT st_name '이름', st_birth '생년월일', SUBSTRING(DATE_ADD(NOW(), INTERVAL - st_birth YEAR), 3, 2) + 1 '나이' FROM t_student;
SELECT st_name '이름', st_birth '생년월일', DATE_FORMAT(NOW(), '%Y') - LEFT(st_birth, 4) + 1 '나이' FROM t_student;
SELECT st_name '이름', st_birth '생년월일', LEFT(NOW(), 4) - LEFT(st_birth, 4) + 1 '나이' FROM t_student;