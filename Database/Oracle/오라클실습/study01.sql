/*
 * TEMP - 사원정보 테이블
 * 사번, 성명, 생일, 소속부서, 채용종류, 재직여부, 전화번호, 취미, 연봉, 직급 등 포함
 * (EMP_ID, EMP_NAME, BIRTH_DATE, DEPT_CODE, EMP_TYPE, USE_YN, TEL, HOBBY, SALARY, LEV)
 * PK : EMP_ID
 * 
 * TDEPT - 부서정보 테이블
 * 부서코드, 부서명, 상위부서, 사용여부, 근무지역, 부서장 사번
 * (DEPT_CODE, DEPT_NAME, PARENT_DEPT, USE_YN, AREA, BOSS_ID)
 * PK : DEPT_CODE
 */

SELECT * FROM temp;
/* select 산술연산 */
--Q
SELECT emp_name, (salary/18)+100000, (salary*2/18)+100000 FROM temp;

/* NULL */
/*
 * 비교할 때 일반값과 NULL은 다르게 사용
 * -문자형일 경우
 * where A = '1' or where A <> '1'
 * -NULL일 경우
 * where A is null or where A is not null 
 * where A <> null 이런 식으로 사용할 경우 데이터를 읽어오지 못 함 
 */
SELECT emp_name 
FROM temp 
WHERE hobby IS NOT NULL;

-- NVL 함수. 값이 null인 경우 지정값으로 치환하여 출력.
SELECT emp_name, nvl(hobby, '없음') FROM temp;

--Q TEMP 자료 중 hobby의 값이 null인 사원을 '등산'으로 치환했을 때 hobby가 '등산'인 사람의 성명을 가져오기
SELECT emp_name 
FROM temp
WHERE nvl(hobby, '등산') = '등산';

/* ALLAS */
select emp_id 사번, emp_name as 이름 from temp;
-- 다른 두 테이블에 같은 컬럼명을 가진 컬럼이 있을 경우
SELECT emp_id, A.dept_code, dept_name
FROM temp A , TDEPT B 
WHERE A.DEPT_CODE = B.DEPT_CODE ;
/*
 * 반드시 ALLAS를 사용하는 경우
 * 
 * 셀프조인에서 자기 자신의 테이블과 조인이 일어나는 경우 모든 컬럼이 중복되게 된다.
 * 이 때 컬럼 앞에 테이블명을 명시해줘야 하는데 이 때 테이블명에 ALLAS를 사용해야 된다.
 * 
 * ROWNUM을 사용하거나 TREE 구조 전개시 LEVEL값을 사용하는 경우 커럼 ALLAS를 사용한다. 
 */
--EX) 사원과 자신이 속한 부서의 부서장을 읽어내는 SQL
SELECT A.EMP_ID, A.EMP_NAME, B.BOSS_ID, C.EMP_NAME
  FROM TEMP A, TDEPT B, TEMP C 
 WHERE B.DEPT_CODE = A.DEPT_CODE 
   AND C.EMP_ID = B.BOSS_ID ;

--Q TEMP의 자료 중 EMP_ID와 EMP_NAME을 각각 '사번', '성명'으로 표시되어 출력
SELECT emp_id 사번, emp_name 성명 FROM TEMP ;

/* CONCATENATION */
/*
 * 두 개 이상의 문자열을 연결하여 하나의 문자열을 만들어낼 때 사용하는 함수
 * CONCAT 함수를 사용하거나 합성연산자 || 를 이용
 * 문자형으로 자동 형변환이 일어남
 */
SELECT emp_name ||'('||LEV||')' 성명 FROM temp;
SELECT emp_name ||'<'|| EMP_ID ||'>' 사번 FROM temp;
/*
 * 합성 연산자가 유용하게 쓰이는 경우
 * query의 결과를 출력하여 엑셀 파일을 만들고 싶은 경우
 * 탭을 컬럼 중간마다 합성연산자로 묶어주면 탭을 분리자로 가지는 파일 생성 가능
 */
SELECT emp_id||'	'||emp_name||'	'||lev FROM temp;

--Q 성명과 생년월일을 작은따옴표로 묶어서 하나의 문자열로 보여주는 쿼리 작성
SELECT * FROM temp;
SELECT ''''||emp_name||birth_date||'''' AS 결과 FROM TEMP ; 

/* ORDER BY */
SELECT emp_id, emp_name FROM temp ORDER BY EMP_ID ;
/*
 * ORDER BY 뒤에 기술한 컬럼의 ASCEDING(기본값, 오름차순) 순으로 정렬이 되어나온다.
 * DESCENDING(내림차순)으로 결과를 나오게 하고 싶다면 컬럼 뒤에 DESC를 붙인다.
 */
SELECT emp_id, emp_name FROM temp ORDER BY EMP_ID DESC ;

-- 직급명에 ascending하면서 결과 내에서 다시 사번 순으로 descending하는 문장
SELECT lev, emp_id, emp_name
FROM TEMP
ORDER BY 1, 2 DESC  ; --컬럼명 대신 컬럼 순서를 기술해도 됨.

--Q TDEPT 테이블을 이용해서 AREA 순서대로 부서 정보를 읽어오는 SQL
SELECT * FROM TDEPT ORDER BY AREA  ;

/* 연산자 */
/*
 * = < > <= >= != <> 등등
 * LIKE : 값의 일부를 주어주고 검색할 때 사용. 
 * BETWEEN : 상한값과 하한값을 주어 자료의 검색을 하고자 할 때 사용.
 * IN : OR 조건으로 연결될 조건을 한 번에 기술해 줄 수 있는 기능을 제공.
 */
-- 부서코드가 A로 시작하는 ROW 검색
SELECT emp_id, emp_name, dept_code
FROM temp
WHERE DEPT_CODE LIKE 'A%';
-- 부서코드 중에 A가 들어가는 ROW 검색
SELECT emp_id, emp_name, dept_code
FROM temp
WHERE DEPT_CODE LIKE '%A%';
-- 총 6자리 부서코드 중 2번째 자리에 A가 들어가는 ROW 검색
SELECT emp_id, emp_name, dept_code
FROM temp
WHERE DEPT_CODE LIKE '_A____';
-- 사번이 1997로 시작하는 사원의 사번과 성명을 검색
SELECT emp_id, emp_name
FROM TEMP
WHERE EMP_ID BETWEEN 19970001 AND 19979999;

--Q BETWEEN 연산자를 이용하여 성명이 'ㄱ'으로 시작되는 사람의 사번과 이름 조회
SELECT emp_id, emp_name
FROM TEMP t 
WHERE EMP_NAME BETWEEN '가' AND '나';

-- IN
SELECT emp_id, emp_name FROM TEMP t 
WHERE emp_name IN ('홍길동', '김길동');
/*
 * 위의 IN 연산자로 기술된 문장은 OPTIMIZER에 의해 실행계획 작성 전에 아래와 같은 문장으로 변경된다.
 * OPTIMIZER : SQL을 처리하는 최저비용의 경로를 생성해주는 DBMS 내부 핵심엔진
 * 옵티마이저가 생성한 처리 경로를 실행계획(Execution Plan)이라고 함.
 */
SELECT emp_id, emp_name FROM TEMP t 
WHERE emp_name = '홍길동' OR emp_name = '김길동';

/* GROUP BY */
/*
 * GROUP BY는 특정 컬럼이나 값을 기준으로 ROW를 묶어서 자료를 다룰 때 사용
 * 그룹함수(MAX, MIN, AVG, SUM, COUNT 등)를 적용할 때 해당된다.
 */
SELECT lev,MAX(SALARY) AS SALARY FROM temp GROUP BY lev ;

SELECT MAX(salary) FROM temp;

SELECT DISTINCT lev FROM temp; -- LEV에서 UNIQUE한 값을 보겠다는 의미
SELECT lev FROM temp GROUP BY lev; -- 위 아래 두 문장 결과가 동일함

-- TDEPT 자료를 이용하여 부서장 중 사번이 가장 빠른 사람이 근무하는 부서
SELECT MIN(boss_id||dept_code)  FROM tdept; -- => boss_id와 dept_code를 결합 후 min값을 준다.
SELECT SUBSTR(MIN(boss_id||dept_code), 9,6)  FROM tdept; -- SUBSTR함수를 사용하여 위 결과값에서 부서번호만 자른다.

--Q TDEPT 테이블의 자료를 이용해서 AREA 별로 최소 BOSS_ID를 골라내고 이 결과를 BOSS_ID별로 정렬
SELECT AREA, min(BOSS_ID )
FROM tdept
GROUP BY AREA 
ORDER BY min(BOSS_ID);

/* HAVING */
-- GROUP BY된 결과를 제한할 때 사용
-- 직급별로 연봉 평균을 구한 상태에서 평균 연보이 5천만원 이상인 경우의 직급과 평균 연봉 
SELECT lev, AVG(salary) 
FROM TEMP t 
GROUP BY LEV 
HAVING AVG(SALARY) > 50000000; 

--Q TEMP의 자료를 이용해서 직급별로 사번이 제일 늦은 사람을 구하고 그 결과 내에서 사번이 1997로 시작하는 결과 출력
SELECT LEV, MAX(EMP_ID)
FROM TEMP t 
GROUP BY LEV 
HAVING MAX(EMP_ID) LIKE '1997%';
