/*
 * 함수
 * - 단일행 함수
 * 하나의 행 값이 함수에 적용되어 값으로 하나의 행이 리턴된다. ex) substr
 * - 그룹 함수
 * 하나 이상의 행 값이 적용되어 하나의 값이 리턴된다. ex) group by
 */

/*
 * 집합 연산자
 * - UNION : 합집합을 구해줌(중복 자료 배제)
 * - UNION ALL : 합집합을 구해줌(중복 자료 포함) - sort가 일어나지 않음
 * 두 dataset의 합집합을 보여주면서 중복된 row 중 하나만 보여주거나 모두 보여주는 것의 차이
 * - MINUS : 차집합을 구해줌
 * - INTERSECT : 교집합을 구해줌
 */

/*
 * TCOM
 * WORK_YEAR : 년도, EMP_ID : 사번, BONUS_RATE : 성과급지급율, COMM : 수당지급금액
 * 
 * EMP_LEVEL
 * LEV : 직급, FROM_SAL : 연봉하한, TO_SAL : 연봉상한, FROM_AGE : 나이하한, TO_AGE : 나이상한
 */

-- UNION, UNION ALL 
SELECT emp_id FROM TEMP
UNION
SELECT emp_id FROM tcom;

--Q union을 이용해서 temp와 tcom의 자료 중 emp_id,salary,comm을 보여주는 sql 작성. salary와 comm이 모두 존재하는 사번은 두 줄
SELECT * FROM TEMP;
SELECT * FROM tcom;
SELECT emp_id, salary, 0 comm FROM TEMP
UNION
SELECT emp_id, 0 SALARY , comm FROM tcom;
-- 위의 예제를 UNION ALL(정렬되지 않음) 하고 order by
SELECT emp_id FROM TEMP
UNION ALL 
SELECT EMP_ID FROM tcom
ORDER BY 1; --1번째 컬럼(emp_id) 순서로 정렬

--Q UNION ALL을 이용해서 TEMP와 TCOM의 자료 중 EMP_ID, SALARY, COMM을 보여주는 SQL
SELECT emp_id, salary, 0 comm FROM temp
UNION ALL
SELECT emp_id, 0 salary, comm FROM tcom ; 

-- INTERSECT 두 dataset의 교집합을 구하고 정렬
-- TEMP와 TCOM테이블의 EMP_ID 교집합
SELECT EMP_ID FROM TEMP
INTERSECT
SELECT EMP_ID FROM TCOM;

-- MINUS 두 dataset간의 차집합
-- TEMP의 사번에서 TCOM에 존재하는 사번 제외하기
SELECT EMP_ID FROM TEMP
MINUS
SELECT EMP_ID FROM TCOM;

--Q TEMP와 TCOM에 존재하는 사번의 교집합을 구한 후,
--  TEMP에서 TCOM에 존재하는 사번을 제외시킨 차집합을 구하고, 두 개의 결과의 합집합 구하기
(SELECT EMP_ID FROM TEMP
INTERSECT
SELECT EMP_ID FROM TCOM)
UNION
(SELECT EMP_ID FROM TEMP 
MINUS
SELECT EMP_ID FROM TCOM);

/*
 * JOIN
 * 두 개 이상의 테이블이나 DATASEST을 서로 연결하여 데이터를 검색할 때 사용하는 방법
 * FROM절에 조인할 테이블들을 기술하고, 조건절에서 테이블간의 연결이 이루어질 조건들을 기술한다.
 */
-- CARTESIAN PRODUCT 조건절에 조인을 위한 조건이 기술되지 않은 경우. 테이블 단위로 나오는 RECORD수의 곱으로 결과가 생성된다.
SELECT COUNT(*) FROM TEMP, TCOM;
--Q TEMP에 있는 자료 중 직급이 과장인 직원을 읽어오는데 결과가 실제 데이터베이스에 있는 내용이 두 번 중복되어 나오게 하기.
--  한 번은 1, 나머지 한 번은 2라는 속성을 달고 나올 수 있도록 하며 사번 성명 SALARY를 보여준다.
SELECT NO, A.EMP_ID, A.EMP_NAME, A.SALARY
  FROM TEMP A, MOD_TEST B 
 WHERE B.NO <= 2
   AND A.LEV = '과장';

-- EQUI JOIN 가장 많이 사용하는 조인. 조건절에 기술된 조인 조건을 EQUAL 연산자로 연결하는 경우
-- TEMP에서 사번, 성명, 부서코드를 읽어오는데 부서명칭을 함께 보고싶은 경우
SELECT A.EMP_ID ,A.EMP_NAME, A.DEPT_CODE, B.DEPT_NAME 
FROM TEMP A, TDEPT B 
WHERE B.DEPT_CODE = A.DEPT_CODE ;
--Q TCOM의 WORK_YEAR='2001'인 자료와 TEMP를 사번으로 연결해서 JOIN한 후 COMM을 받는 직원의 성명, SALARY+COMM 조회
SELECT * FROM TEMP;
SELECT * FROM TCOM;
SELECT A.EMP_NAME 성명, (A.SALARY + B.COMM) 연봉
FROM TEMP A, TCOM B
WHERE B.WORK_YEAR = '2001' 
AND A.EMP_ID = B.EMP_ID;

-- NON EQUI JOIN 조건절에서 조인이 '='이 아닌 다른 연산기호로 주어지는 경우
-- EMP_LEVEL 테이블에 직급별로 나이의 상하한 값을 이용해 
-- TEMP에 존재하는 직원들 중 과장 직급을 가질만한 나이에 포함하는 사람을 현재 직급에 관계없이 읽어오기
-- ADD_MONTHS() 날짜에 월을 빼거나 더하는 함수. ADD_MONTHS(날짜, 숫자) 날짜 타입으로 결과 출력
SELECT B.LEV 직급
     , A.EMP_ID 사번
     , A.EMP_NAME 이름
     , A.BIRTH_DATE 나이
     , A.LEV 현재직급
FROM TEMP A, EMP_LEVEL B
WHERE A.BIRTH_DATE BETWEEN ADD_MONTHS('20010101', -1*TO_AGE*12) 
                       AND ADD_MONTHS('20010101', -1*FROM_AGE*12)
  AND B.LEV = '과장' ; 

--Q TEMP와 EMP_LEVEL을 이용해 EMP_LEVEL의 과장 직급의 연봉 상한/하한 범위 내에 드는 직원의 사번,성명,직급,salary 읽기
SELECT emp_id, emp_name, A.lev, salary
FROM temp A, emp_level B
WHERE B.lev = '과장'
AND SALARY BETWEEN B.FROM_SAL AND B.TO_SAL ;

-- OUTER JOIN
/* 조인하는 여러 테이블에서 한 쪽에는 데이터가 있고, 한 쪽에는 데이터가 없는 경우,
 * 데이터가 있는 쪽 테이블의 내용을 모두 출력하는 것. => 조건에 맞지 않아도 해당하는 행을 출력
 * 
 * SELECT COLUMN1, COLUMN2, ...
 *   FROM TABLE1, TABLE2, ...
 *  WHERE TABLE1.COLUMNn = TABLE2.COLUMNn(+)
 * 위와 같은 상황에서 기준 되는 테이블은 TABLE1 
 * 연산자 (+)는 NULL열이 작성되어야 하는 쪽에 붙는다.
 */
-- 동일한 QUERY에 OUTER 기호가 붙는 경우와 아닌 경우 비교
-- 일반 조인
SELECT A.EMP_ID, B.EMP_ID
  FROM TEMP A, TCOM B
 WHERE B.WORK_YEAR = '2001'
   AND B.EMP_ID = A.EMP_ID ;
-- OUTER JOIN
SELECT A.EMP_ID, B.EMP_ID 
  FROM TEMP A, TCOM B 
 WHERE B.WORK_YEAR(+) = '2001'
  AND B.EMP_ID(+) = A.EMP_ID;

--Q 각 사번의 성명, 이름, SALARY, 연봉하한금액, 연봉상한금액을 보고자한다.
--  TEMP와 EMP_LEVEL을 조인하여 결과를 보여주되, 연봉의 상하한이 등록되어 있지 않는 '수습'사원은 성명,이름,SALARY까지 나오게 출력
SELECT * FROM TEMP t ;
SELECT * FROM EMP_LEVEL el ;
SELECT B.EMP_ID, B.EMP_NAME, B.SALARY, A.FROM_SAL, A.TO_SAL
  FROM EMP_LEVEL A, TEMP B
 WHERE B.LEV = A.LEV(+); --EMP_LEVEL에는 '수습'에 대한 데이터가 없기 때문에 NULL열 발생.

-- JOINING TABLE INSELF 같은 테이블을 다른 테이블처럼 인식하여 JOIN 반드시 ALIAS를 사용한다.
-- TDEPT 테이블에 자신의 상위 부서 정보를 관리하고 있다. 이 테이블을 이용하여 부서코드, 부서명, 상위부서코드, 상위부서명을 읽어오기
SELECT A.DEPT_CODE 부서코드, A.DEPT_NAME 부서명, B.DEPT_CODE 상위부서코드, B.DEPT_NAME 상위부서명
  FROM TDEPT A, TDEPT B 
 WHERE B.DEPT_CODE = A.PARENT_DEPT ;
--Q TEMP 자료를 이용해 NON-EQUI JOIN이면서 SELF JOIN이고 OUTER JOIN인 쿼리 작성
--  사번, 성명, 생일, 자신보다 생일이 빠른 사람의 수를 읽어와 자신보다 생일이 빠른 사람의 수 순서로 정렬하는 쿼리
SELECT A.EMP_ID 사번, A.EMP_NAME 성명, A.BIRTH_DATE 생일, COUNT(B.BIRTH_DATE) 생일빠른사람수 
  FROM TEMP A, TEMP B
 WHERE B.BIRTH_DATE(+) < A.BIRTH_DATE 
GROUP BY A.EMP_ID, A.EMP_NAME, A.BIRTH_DATE 
ORDER BY COUNT(B.BIRTH_DATE) ;
--Q TEMP와 TDEPT를 이용하여 다음 컬럼을 보여주는 SQL을 만들어보자.
--  상위부서가 'CA0001'인 부서에 소속된 직원을
--  1.사번 2.성명 3.부서코드 4.부서명 5.상위부서코드 6.상위부서명 7.상위부서장코드 8.상위부서장성명 순으로 보여준다.
SELECT A.EMP_ID, B.DEPT_CODE, B.DEPT_NAME, C.DEPT_CODE, C.DEPT_NAME, D.EMP_ID, D.EMP_NAME
  FROM TEMP A, TDEPT B, TDEPT C, TEMP D
 WHERE B.DEPT_CODE = A.DEPT_CODE 
   AND C.DEPT_CODE = B.PARENT_DEPT 
   AND C.DEPT_CODE = 'CA0001'
   AND D.EMP_ID = C.BOSS_ID ;

-- 서브쿼리(SUB QUERY)
-- SELECT한 결과를 조건비교에 사용하거나 UPDATE, INSERT에 사용할 때 이르는 말.

-- SINGLE ROW 서브쿼리 : 가장 일반적이고 단순한 형태. SELECT 결과로 나오는 행의 수가 단 한 행이며, 이 중 한 컬럼을 사용
-- TEMP에서 연봉이 가장 많은 직원의 ROW를 찾아서 이 금액과 동일한 금액을 받는 직원의 사변과 성명 보여주기
SELECT EMP_ID, EMP_NAME
  FROM TEMP
 WHERE SALARY = ( SELECT MAX(SALARY) FROM TEMP ) ;
-- TEMP의 자료를 이용해 SALARY의 평균을 구하고 이보다 큰 금액을 받는 직원의 사번과 성명, 연봉
SELECT EMP_ID, EMP_NAME, SALARY
  FROM TEMP
 WHERE SALARY > ( SELECT AVG(SALARY) FROM TEMP ) ;

-- MULTI ROW 서브쿼리
-- SINGLE ROW와 달리 서브쿼리의 결과 행이 한 행 이상이 될 수 있는 경우를 의미하고 IN, ANY, ALL, EXISTS등의 연산시에 가능
-- TEMP의 직원 중 인천에 근무하는 지원의 사번과 성명을 읽어오기
SELECT EMP_ID, EMP_NAME
  FROM TEMP
 WHERE DEPT_CODE IN ( SELECT DEPT_CODE
                        FROM TDEPT
                       WHERE AREA = '인천' );

--Q TCOM에 연봉 외에 COMMISSION을 받는 직원의 사번이 보관되어 있다. 
--  이 정보를 SUB QUERY로 SELECT하여 부서 명칭별로 COMMISSION을 받는 인원수를 세는 문장
SELECT B.DEPT_NAME, COUNT(*) 
  FROM TEMP A, TDEPT B
 WHERE B.DEPT_CODE = A.DEPT_CODE
   AND A.EMP_ID IN (SELECT EMP_ID FROM TCOM)
GROUP BY B.DEPT_NAME ; 

-- MULTI COLUMN 서브쿼리. 서브쿼리에서 결과로 나오는 행들이 한 컬럼이 아닌 두 개 이상을 가지는 경우
-- 보통 PK컬럼이 두 개 이상인 경우에 KEY값을 한번에 묶어서 비교하기 위해 자주 사용됨.
-- TDEPT에서 부서코드와 BOSS_ID를 읽어서, 이 두 개의 컬럼이 TEMP의 부서코드와 사번에 일치하는 사람의 사번과 성명 읽어오기
SELECT EMP_ID, EMP_NAME 
  FROM TEMP
 WHERE (DEPT_CODE, EMP_ID) IN 
       (SELECT DEPT_CODE, BOSS_ID
          FROM TDEPT); 
--Q TEMP에서 부서별 최고 연봉금액을 읽어서 해당 부서와 최고 연봉금액이 동시에 일치하는 사원의 사번,성명,연봉 읽기
SELECT * FROM TEMP ;
SELECT EMP_ID, EMP_NAME, SALARY
  FROM TEMP
 WHERE (DEPT_CODE, SALARY) IN
       (SELECT DEPT_CODE, MAX(SALARY) 
          FROM TEMP
        GROUP BY DEPT_CODE);
      
-- CORRELATED 서브쿼리
/* InnerQuery에서 OuterQuery의 어떤 컬럼값을 사용하는 경우를 correlated 서브쿼리라고 한다.       
 * InnerQuery(흔히 SUB QUERY)와 OuterQuery(흔히 MAIN QUERY)가 서로 단순히 연관관계가 있는 것이 아니고 서로 값을 주고 받는 연관관계가 성립한다.
 * 일반적인 서브쿼리는 SUBQUERY의 겨로가를 MAINQUERY가 이용한다.
 * CORRELATED 서브쿼리는 SUBQUERY가 MAINQUERY의 값을 이용하고, 그렇게 구해진 SUB QUERY의 값을 다시 MAIN QUERY가 이용한다.
 */
-- 직원 중 자신의 연봉이 자신과 같은 LEV에 해당하는 직원의 평균 SALARY보다 많은 경우에 이 사원의 사번과 성명 읽어오기
SELECT EMP_ID, EMP_NAME
  FROM TEMP A
 WHERE SALARY > ( SELECT AVG(SALARY)
                    FROM TEMP B 
                   WHERE B.LEV = A.LEV ) ; 
-- TDEPT의 BOSS_ID를 UPDATE하는 문장이다.
-- 해당 부서에 속하는 사원을 찾아서 이 중 사번이 가장 빠른 사람을 부서장으로 임명한다고 가정하고 결과를 TDEPT에 반영하는 UPDATE 문장
UPDATE TDEPT A
   SET A.BOSS_ID = (SELECT MIN(B.EMP_ID)
                      FROM TEMP B
                     WHERE B.DEPT_CODE = A.DEPT_CODE) ;
/*
 * UPDATE 기본 문법
 * UPDATE table_name SET column_name1=변경값, column_name2=변경값 ... ;
 */                   
--Q TEMP 테이블의 각 사원별 연봉을 10%를 COMMISSION으로 하는 새로운 자료를 TCOM에 INSERT.
--  이 때 WORK_YEAR는 '2002', BONUS_RATE=0.1이 된다.
INSERT INTO TCOM (WORK_YEAR, EMP_ID, BONUS_RATE, COMM)
	        SELECT '2002', EMP_ID, 0.1, SALARY*0.1 FROM TEMP ;
