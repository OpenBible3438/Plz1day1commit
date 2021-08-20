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
