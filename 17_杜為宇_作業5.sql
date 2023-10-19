-- 1. 顯示所有員工之姓名,所屬部門編號,部門名稱及部門所在地點。

SELECT e.ename , e.deptno , d.dname , d.loc
FROM demo.emp e JOIN demo.dept d on e.deptno = d.deptno;



-- 2. 顯示所有有賺取佣金的員工之姓名,佣金金額,部門名稱及部門所在地點。

SELECT * FROM DEMO.EMP;
SELECT * FROM DEMO.DEPT;

SELECT e.ename , e.comm , d.dname , d.loc
FROM demo.emp e JOIN demo.dept d on e.deptno = d.deptno and e.comm IS NOT NULL AND e.comm > 0;

-- 3. 顯示姓名中包含有”A”的員工之姓名及部門名稱。

SELECT e.ename , d.dname
FROM demo.emp e join demo.dept d on e.deptno = d.deptno and e.ename like "%A%";


-- 4. 顯示所有在”DALLAS”工作的員工之姓名,職稱,部門編號及部門名稱
SELECT e.ename , e.job , d.deptno , d.loc
FROM demo.emp e JOIN demo.dept d on d.loc = "DALLAS" AND e.deptno = d.deptno;


-- 5. 顯示出表頭名為: Employee, Emp#, Manager, Mgr#，分別表示所有員工之姓名,員工編號,主
-- 管姓名, 主管的員工編號。

SELECT *
FROM DEMO.EMP;

SELECT E1.ENAME "Employee" , E1.EMPNO "Emp#" , E2.ENAME "Manager" , E2.empno "Mgr#"
FROM DEMO.EMP E1 JOIN DEMO.EMP E2 ON E1.MGR = E2.EMPNO;

-- 6. 顯示出SALGRADE資料表的結構，並建立一查詢顯示所有員工之姓名,職稱,部門名稱,薪資及
-- 薪資等級。


SELECT E.ENAME,E.JOB ,D.DNAME , E.SAL , S.GRADE
FROM DEMO.emp e
JOIN DEMO.SALGRADE s on e.sal between s.losal and s.hisal
JOIN DEMO.DEPT d on e.deptno = d.deptno; 

SELECT * FROM  DEMO.SALGRADE;
SELECT * FROM  DEMO.EMP;
SELECT * FROM  DEMO.DEPT;
-- 7. 顯示出表頭名為: Employee, Emp Hiredate, Manager, Mgr Hiredate的資料項，來顯示所有比他的主管還要早進公司的員工之姓名,進公司日期和主管之姓名及進公司日期。

SELECT 
	E1.ENAME "Employee",
    E1.hiredate "Emp Hiredate",
    E2.Ename "Manager",
    E2.hiredate "MGR Hiredate"
FROM DEMO.EMP E1 JOIN DEMO.EMP E2 ON E1.MGR = E2.EMPNO
WHERE E1.HIREDATE < E2.HIREDATE;

-- 8. 顯示出表頭名為: dname, loc, Number of People, Salary的資料來顯示所有部門之部門名稱,部
-- 門所在地點,部門員工數量及部門員工的平均薪資，平均薪資四捨五入取到小數第二位。

SELECT 
	D.DNAME,
    D.LOC,
    COUNT(E.ENAME) "Number of People",
    ROUND(AVG(E.SAL),2) "Salary"
FROM DEMO.EMP E JOIN DEMO.DEPT D ON E.DEPTNO = D.DEPTNO
GROUP BY D.DNAME , D.LOC;

-- 9. 顯示出所有部門之編號、名稱及部門員工人數(Emp#)，包含沒有員工的部門。

SELECT 
	D.DEPTNO,
    D.DNAME,
    COUNT(E.ENAME) "Emp#"

FROM DEMO.DEPT D LEFT JOIN DEMO.EMP E ON D.DEPTNO = E.DEPTNO
GROUP BY D.DEPTNO , D.DNAME;






