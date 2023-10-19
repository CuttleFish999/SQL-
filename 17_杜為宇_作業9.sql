
-- 1. 使用EMP資料表中的員工編號(empno),姓名(ename)及部門編號(deptno)來建立一個EMP_VU view,並將姓名(ename)欄位名稱改成EMPLOYEE。
-- DROP VIEW EMP_VU;
CREATE VIEW EMP_VU AS 
SELECT empno , ename , deptno 
FROM DEMO.EMP;

-- 2. 顯示EMP_VU view中的資料內容。

SELECT * FROM EMP_VU;

-- 3. 使用EMP_VU view來顯示所有員工之姓名及部門編號。

SELECT EMPLOYEE , deptno 
FROM EMP_VU;

-- 4. 新建一個名為 DEPT20的view, 包含在部門20的所有員工之員工編號，員工姓名，及部門編號。
-- 將View中的資料項目命名為 EMPLOYEE_ID, EMPLOYEE, and 
-- DEPARTMENT_NO。並設定不允許使用者透過 DEPT20 來更改員工所屬的部門編號。
DROP VIEW DEPT20;
CREATE VIEW DEPT20 AS 
SELECT empno "EMPLOYEE_ID", ename"EMPLOYEE", deptno"DEPARTMENT_NO"
FROM DEMO.EMP
WHERE DEPTNO = 20;

-- SELECT * FROM DEPT20;

-- 5. 顯示DEPT20 view的欄位定義資料(結構)及其所有資料內容。

SELECT * FROM DEPT20;

-- 6. 試試看利用DEPT20 view將 Smith 轉調到部門30。

UPDATE DEPT20
SET DEPARTEMNT_NO = 30
WHERE EMPLOYEE = "Smith";


-- 7. 新建一個名為 SALARY_VU的view，包含所有員工之姓名，部門名稱，薪資和薪資等級。
-- 將View中的資料項目分別命名為 Employee, Department, Salary, Grade。
-- DROP VIEW SALARY_VU;
CREATE VIEW SALARY_VU AS 
SELECT ename Employee , dname Department , sal Salary , grade Grade
FROM DEMO.EMP e JOIN DEMO.DEPT d ON e.deptno = d.deptno JOIN salgrade s ON e.sal BETWEEN s.LOSAL AND s.HISAL;
SELECT * FROM SALARY_VU;

-- 8. 在EMP資料表中利用ename欄位建立一個non-unique index 命名為idx_emp_ename。

CREATE INDEX idx_emp_ename ON demo.emp(ename);
SHOW INDEX FROM DEMO.EMP;
