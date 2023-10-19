-- 1. 顯示所有員工的最高、最低、總和及平均薪資，依序將表頭命名為 Maximum, Minimum, Sum 和 Average，請將結果顯示為四捨五入的整數。

SELECT * FROM DEMO.EMP;

SELECT 
	ROUND(Max(SAL)) AS "Maximum",
    ROUND(Min(SAL))AS "Minimum",
    ROUND(SUM(SAL)) AS "Sum",
    ROUND(AVG(SAL)) AS "Average"

FROM DEMO.EMP;






SELECT 
	ROUND(MAX(SAL)) AS Maximun,
    ROUND(MIN(SAL)) AS Minimu,
    ROUND(SUM(SAL)) AS Sum,
    ROUND(AVG(SAL)) AS Average
FROM DEMO.EMP;

-- 2. 顯示每種職稱的最低、最高、總和及平均薪水。

SELECT job , 
	MIN(SAL) AS MinimunSalary,
    MAX(SAL) AS MaximunSalary,
    SUM(SAL) AS SUMSalary,
    AVG(SAL) AS AvgerageSalary
FROM DEMO.EMP
GROUP BY JOB;

-- 3. 顯示每種職稱的人數。

SELECT job , COUNT(*)
FROM DEMO.EMP
GROUP BY JOB;

-- 4. 顯示資料項命名為Number of Managers來表示擔任主管的人數。

SELECT COUNT(DISTINCT mgr) "Number of Mangers"
FROM demo.emp;

-- 5. 顯示資料項命名為DIFFERENCE的資料來表示公司中最高和最低薪水間的差額。

SELECT 
	MAX(SAL) - MIN(SAL) AS DIFFERENCE
FROM DEMO.EMP;

-- 6. 顯示每位主管的員工編號及該主管下屬員工最低的薪資，排除沒有主管和下屬員工最低薪資，少於1000的主管，並以下屬員工最低薪資作降冪排列。

SELECT MGR , MIN(SAL)
FROM EMP
GROUP BY MGR
HAVING MGR IS NOT NULL AND MIN(SAL) > 1000
ORDER BY MIN(SAL) DESC;

-- 7. 顯示在2011或2013年進公司的員工數量，並給該資料項一個合適的名稱。

SELECT YEAR(hiredate) AS HYear, COUNT(*) AS "Number of People"
FROM DEMO.EMP
WHERE YEAR(hiredate) IN (2011, 2013)
GROUP BY HYear;


-- SELECT MGR , MIN(SAL)
-- FROM EMP;


