#부서 테이블
DROP TABLE t_depart;
CREATE TABLE t_depart (
    de_id INT AUTO_INCREMENT,
    de_name VARCHAR(20) COMMENT '부서명',
    PRIMARY KEY(de_id) 
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;;

#직급 테이블
DROP TABLE t_class;
CREATE TABLE t_class ( 
    cl_id INT AUTO_INCREMENT,
    cl_name VARCHAR(20) COMMENT '직급명',
    cl_min_money INT COMMENT '직급의 연봉최저금액',
    cl_max_money INT COMMENT '직급의 연봉최대금액',
    PRIMARY KEY(cl_id)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;;

#직원 테이블
DROP TABLE t_employee;
CREATE TABLE t_employee (
    em_id INT AUTO_INCREMENT,
    em_name VARCHAR(20) COMMENT '직원명',
    em_birth VARCHAR(10) COMMENT '생년월일',
    em_gender CHAR(1) COMMENT '성별 (M : 남, F : 여)',
    em_start_date VARCHAR(10) COMMENT '입사일',
    em_end_date VARCHAR(10) COMMENT '퇴사일',
    em_money INT COMMENT '연봉(만원)',
    de_id INT COMMENT '부서 외래키',
    cl_id INT COMMENT '직급 외래키',
    PRIMARY KEY(em_id)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;;

#부서 데이터 insert
INSERT INTO t_depart SET de_name='개발';
INSERT INTO t_depart SET de_name='디자인';
INSERT INTO t_depart SET de_name='인사';
INSERT INTO t_depart SET de_name='회계';

#직급 테이블 insert
INSERT INTO t_class SET cl_name='사원', cl_min_money='2000', cl_max_money='3000';
INSERT INTO t_class SET cl_name='대리', cl_min_money='2500', cl_max_money='3500';
INSERT INTO t_class SET cl_name='과장', cl_min_money='3000', cl_max_money='4000';
INSERT INTO t_class SET cl_name='팀장', cl_min_money='3500', cl_max_money='6000';

#직원 테이블 insert
INSERT INTO t_employee SET em_name='홍길동', em_birth='2000-03-15', em_gender='M', em_start_date='2021-02-01', em_end_date='', em_money='2300', de_id='1', cl_id='1';
INSERT INTO t_employee SET em_name='김태희', em_birth='2001-06-30', em_gender='F', em_start_date='2021-02-01', em_end_date='', em_money='2500', de_id='1', cl_id='1';
INSERT INTO t_employee SET em_name='송혜교', em_birth='1997-02-17', em_gender='F', em_start_date='2021-02-01', em_end_date='', em_money='3100', de_id='2', cl_id='1';
INSERT INTO t_employee SET em_name='송중기', em_birth='1997-10-05', em_gender='M', em_start_date='2021-02-01', em_end_date='', em_money='1800', de_id='3', cl_id='1';
INSERT INTO t_employee SET em_name='김흥국', em_birth='1959-11-01', em_gender='M', em_start_date='2019-05-15', em_end_date='', em_money='2400', de_id='1', cl_id='2';
INSERT INTO t_employee SET em_name='한가인', em_birth='1982-05-01', em_gender='F', em_start_date='2018-11-10', em_end_date='', em_money='2600', de_id='2', cl_id='2';
INSERT INTO t_employee SET em_name='박명수', em_birth='1974-10-12', em_gender='M', em_start_date='2017-05-07', em_end_date='2020-12-31', em_money='3300', de_id='3', cl_id='2';
INSERT INTO t_employee SET em_name='정준하', em_birth='1975-07-04', em_gender='M', em_start_date='2015-05-07', em_end_date='', em_money='3800', de_id='4', cl_id='3';
INSERT INTO t_employee SET em_name='정형돈', em_birth='1977-06-08', em_gender='M', em_start_date='2015-05-07', em_end_date='2020-12-18', em_money='4200', de_id='1', cl_id='3';
INSERT INTO t_employee SET em_name='노홍철', em_birth='1978-11-05', em_gender='M', em_start_date='2010-05-07', em_end_date='', em_money='7000', de_id='2', cl_id='4';

#em_end_date 가 ''이면 재직중, 값이 있으면 퇴사일
 
USE test;

DESC t_depart;

SELECT * FROM t_depart;
SELECT * FROM t_class;
SELECT * FROM t_employee;

#문제1. 재직중인 직원 중 연봉이 높은 순서대로 이름,연봉을 출력하세요.
SELECT em_name "이름", em_money "연봉" FROM t_employee ORDER BY em_money DESC;

#문제2. 재직중인 직원 중 남자이면서 입사일이 가장빠른사람의 이름을 출력하세요.
SELECT em_name "이름" FROM t_employee WHERE em_gender="M" ORDER BY em_start_date LIMIT 0,1;

#문제3. 재직중인 직원 중 부서가 개발팀인 직원을 생년월일이 빠른 순서로 이름,생년월일을 출력하세요.
SELECT em_name "이름", em_birth "생년월일" 
	FROM t_employee AS T1 
		JOIN t_depart AS T2 ON T1.de_id = T2.de_id 
	WHERE de_name = "개발" 
	ORDER BY em_birth;

#문제4. 직급별 평균연봉을 평균연봉(내림차순) 으로 출력하세요. 
SELECT cl_name "직급", AVG(em_money) AS "평균연봉" 
	FROM t_employee AS T1 
		JOIN t_class AS T2 ON T1.cl_id = T2.cl_id 
	GROUP BY cl_name 
	ORDER BY cl_min_money DESC;

#문제6. 재직중인 직원들의 이름,부서,직급을 직급(내림차순),이름(오름차순) 순서대로 출력하세요.
SELECT em_name "이름", de_name "부서", cl_name "직급" 
	FROM t_employee AS T1 
		JOIN t_class AS T2 ON T1.cl_id = T2.cl_id 
		JOIN t_depart AS T3 ON T1.de_id = T3.de_id 
	ORDER BY cl_name DESC, em_name ASC;

#문제7. 재직중인 직원 중 연봉이 직급의 최저연봉, 최고연봉 사이가 아닌 직원의 이름, 직급, 부서를 출력하세요.
SELECT em_name "이름", cl_name "직급",  de_name "부서"
	FROM  t_employee AS T1 
		JOIN t_class AS T2 ON T1.cl_id = T2.cl_id 
		JOIN t_depart AS T3 ON T1.de_id = T3.de_id
	WHERE em_money < cl_min_money OR em_money > cl_max_money;
	
#문제8. 재직중인 직원 중 남성/여성 비율을 각각 나타내세요.
SELECT (cnt / (SELECT COUNT(*) FROM t_employee WHERE em_end_date = "")) * 100 AS "비율", em_gender AS "성별"
	FROM 
		(SELECT COUNT(em_gender) AS cnt, em_gender 
			FROM t_employee 
			WHERE em_end_date = "" 
			GROUP BY em_gender) T1;