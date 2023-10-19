-- 1. 顯示系統目前的日期並將表頭命名為”系統日期”。
SELECT CURDATE() AS '系統日期'; 


-- 2. 顯示所有員工之員工編號,姓名,薪資及將薪資增加15%並且以整數表示,並將表頭命名為”New Salary”。



SELECT EMPNO , ENAME , SAL , SAL * 1.15 AS "New Salary"
FROM DEMO.EMP;




SELECT EMPNO , ENAME , ROUND(sal), ROUND(SAL * 1.15)  AS "New Salary"
FROM DEMO.EMP; 

-- 3. 接續第二題,增加一個資料項表頭命名為Increase (將New Salary 減掉 salary 的值)。



SELECT EMPNO , ENAME , SAL , SAL * 1.15 , (SAL * 1.15) - SAL AS Increase FROM DEMO.EMP; 



SELECT EMPNO , ENAME , ROUND(SAL) , ROUND(SAL * 1.15) , ROUND(SAL * 1.15) - ROUND(SAL) AS Increase
FROM DEMO.EMP;

-- 4. 顯示員工的姓名,進公司日期,檢討薪資的日期(指在進公司工作六個月後的第一個星期一),將該欄命名，為 REVIEW,並自訂日期格式為:Sunday, the Seventh of September。(星期幾, 幾月幾日)。

SELECT 
    ENAME, HIREDATE, 
    DATE_FORMAT(
    DATE_ADD(
    DATE_ADD(HIREDATE, INTERVAL 6 MONTH), INTERVAL (9 - DAYOFWEEK(
	DATE_ADD(HIREDATE, INTERVAL 6 MONTH))) % 7 DAY),
    '%W, the %D of %M') 
    AS REVIEW
FROM 
    demo.emp;
SELECT 
	ENAME , HIREDATE, DATE_FORMAT(DATE_ADD(HIREDATE , INTERVAL 6 MONTH), INTERVAL (9 - DAYOFWEEK(DATE_ADD(HIREDATE , INTERVAL 6 MONTH)))% 7 DAY),
    '%W , THE %D OF %M')
    AS REVIEW
FROM
DEMO.EMP;
    
-- 5. 顯示每位員工的姓名,資料項(MONTHS_WORKED):計算到今天為止工作了幾個月(將月數四捨五入到
-- 整數)。
SELECT 
	ename,
    DATEDIFF(CURDATE() , hiredate) div 30 as 
    MONTHS_WORKED
FROM	
	DEMO.EMP;
-- 6. 顯示如下格式:<員工姓名> earns <薪水> monthly but wants <3倍的薪水>.並將表頭顯示為Dream Salaries。
SELECT 
	CONCAT( ename," earns " , sal, " monthly but wants ",sal * 3)
	AS "Dream Salaries"
FROM
	DEMO.EMP;
-- 7. 顯示所有員工之姓名和薪資,設定薪資長度為15個字元並且在左邊加上$符號,將表頭命名為SALARY。
SELECT 
	ENAME,LPAD(SAL,15,"$")
	AS SALARY
FROM
	DEMO.EMP;
-- 8. 顯示員工之姓名,進公司日期,資料項(DAY):顯示員工被雇用的那天為星期幾,並以星期一作為一週的起始日,依星期排序。
SELECT 
	ename,
    hiredate,
    dayofweek(hiredate) as DAY
FROM
	DEMO.EMP
order by  
	DAY;
-- 9. 顯示員工的姓名和名為COMM的欄位:顯示佣金額,如果該員工沒有賺取佣金則顯示"No Commission."。
select
	ename,
    COALESCE(Comm,"No Commission") as Comm
from
	demo.emp;
-- 10.顯示資料項命名為 EMPLOYEE_AND_THEIR_SALARIES 的資料來顯示所有員工之名字和薪資,且用星號來表示他們的薪資,每一個星號表示100元,並以薪資由高到低來顯示。
SELECT 
	
	ename,REPEAT('*',sal / 100) AS EMPLOYEE_AND_THEIR_SALARIES 
FROM
	DEMO.EMP;

