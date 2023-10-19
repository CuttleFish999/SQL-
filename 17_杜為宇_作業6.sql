-- 1. 顯示和Blake同部門的所有員工之姓名和進公司日期。
SELECT ENAME , HIREDATE
FROM DEMO.EMP
WHERE DEPTNO = (
	SELECT DEPTNO
    FROM DEMO.EMP
    WHERE ENAME = "BLAKE"
);

-- 2. 顯示所有在Blake之後進公司的員工之姓名及進公司日期。

SELECT ENAME , HIREDATE
FROM DEMO.EMP
WHERE HIREDATE > (
	SELECT HIREDATE
	FROM DEMO.EMP
    WHERE ENAME = "BLAKE"
);

-- 3. 顯示薪資比公司平均薪資高的所有員工之員工編號,姓名和薪資，並依薪資由高到低排列。
SELECT EMPNO , ENAME , SAL
FROM DEMO.EMP
WHERE SAL > (
	SELECT AVG(SAL)
	FROM DEMO.EMP
)
ORDER BY SAL DESC;

-- 4. 顯示和姓名中包含名為 "T" 的人在相同部門工作的所有員工之員工編號和姓名。

SELECT EMPNO , ENAME
FROM DEMO.EMP
WHERE DEPTNO IN (
	SELECT DEPTNO
	FROM DEMO.EMP
    WHERE ENAME LIKE "%T%"
);
-- 5. 顯示在Dallas工作的所有員工之姓名, 部門編號和職稱。

SELECT ENAME , DEPTNO , JOB
FROM DEMO.EMP
WHERE DEPTNO IN (
	SELECT DEPTNO
	FROM DEMO.DEPT
    WHERE LOC = "Dallas"
);


-- 6. 顯示直屬於”King”的員工之姓名和薪資。

SELECT ENAME , SAL
FROM DEMO.EMP
WHERE MGR = '7839';

-- 7. 顯示銷售部門”Sales” 所有員工之部門編號,姓名和職稱。

SELECT DEPTNO , ENAME , JOB
FROM DEMO.EMP
WHERE DEPTNO = "30";

-- 8. 顯示薪資比公司平均薪資還要高且和名字中有T 的人在相同部門上班的所有員工之員工編號,姓名和薪資。


SELECT EMPNO , ENAME , SAL
FROM DEMO.EMP
WHERE SAL > (
	SELECT AVG(SAL)
    FROM DEMO.EMP
) AND DEPTNO IN (
	SELECT DEPTNO
    FROM DEMO.EMP
    WHERE ENAME LIKE "%T%"
);


-- 9. 顯示和有賺取佣金的員工之部門編號和薪資都相同的員工之姓名,部門編號和薪資。


SELECT ENAME , DEPTNO , SAL
FROM DEMO.EMP
WHERE (SAL , DEPTNO) IN (
	SELECT SAL , DEPTNO
    FROM DEMO.EMP
    WHERE COMM IS NOT NULL AND COMM > 0
    GROUP BY SAL , DEPTNO
    HAVING COUNT(*) > 1
)
ORDER BY 1;

-- 10.顯示和在Dallas工作的員工之薪資和佣金都相同的員工之姓名,部門編號和薪資。

SELECT E1.ENAME , E1.DEPTNO , E1.SAL
FROM DEMO.EMP AS E1 JOIN DEMO.EMP AS E2 ON E1.SAL = E2.SAL
										AND IFNULL(E1.COMM,0) = IFNULL(E2.COMM,0)
                                        AND E1.DEPTNO = E2.DEPTNO
                                        AND E1.EMPNO <> E2.EMPNO
JOIN DEMO.DEPT AS D ON E1.DEPTNO = D.DEPTNO
WHERE D.LOC = "Dallas"
ORDER BY 1 DESC;
             
-- 11.顯示薪資和佣金都和Scott相同的所有員工之姓名,進公司日期和薪資。(不要在結果中顯示Scott的資料)

SELECT E1.ENAME , E1.HIREDATE , E1.SAL
FROM DEMO.EMP AS E1 JOIN DEMO.EMP AS E2
	ON E2.ENAME = "Scott"
	AND E1.SAL = E2.SAL
	AND IFNULL(E1.COMM,0) = IFNULL(E2.COMM,0)
	WHERE E1.ENAME = "Scott";


-- 12.顯示薪資比所有職稱是”Clerk”還高的員工之姓名,進公司日期和薪資，並將結果依薪資由高至低顯示。



SELECT ENAME , HIREDATE , SAL
FROM DEMO.EMP
WHERE SAL > ALL 
(
	SELECT SAL
    FROM DEMO.EMP
    WHERE JOB = "CLERK"
	ORDER BY SAL DESC
);



