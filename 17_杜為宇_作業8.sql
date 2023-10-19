-- 1. 利用下列資料來新建 DEPARTMENT 資料表。

CREATE TABLE department
(id INT NOT NULL, name VARCHAR(24) NOT NULL);
DESCRIBE department;

-- 2. 利用DEPT資料表中的資料,將資料新增至DEPARTMENT 資料表中(只新增相對的資料欄)。
INSERT INTO department(id, name)
SELECT deptno, dname
FROM dept;


SELECT *
FROM department;
SELECT *
FROM dept;

-- 3. 利用下列資料來新建 EMPLOYEE資料表。

CREATE TABLE employee
(id INT NOT NULL , last_name VARCHAR(24)NOT NULL , first_name VARCHAR(24) , dept_id INT);
DESCRIBE employee;

-- 4. 將EMPLOYEE資料表中last_name欄位的資料型態更改為 varchar(40)。

ALTER TABLE employee
MODIFY COLUMN last_name VARCHAR(40);

DESCRIBE EMPLOYEE;

-- 5. 使用EMP資料表的結構中之EMPNO, ENAME,and DEPTNO之定義來新建EMPLOYEE2資料表並將欄位名稱設定為 ID, LAST_NAME, and DEPT_ID 。

CREATE TABLE employee2
SELECT empno ID, ename LAST_NAME, deptno DEPT_ID
FROM emp
WHERE 1 = 0;

DESC employee2;

-- 6. 刪除整個EMPLOYEE資料表。

DROP TABLE employee;
DROP TABLE departementqq;

-- 7. 將EMPLOYEE2資料表改名為EMPLOYEE。

ALTER TABLE employee2
RENAME TO employee;

-- 8. 將EMPLOYEE資料表中的LAST_NAME欄位刪除。

ALTER TABLE employee
DROP LAST_NAME;

DESC employee;

-- 9. 修改EMPLOYEE資料表,新增一個欄位 SALARY 資料型態為 INT。

ALTER TABLE employee
ADD SALARY INT;

DESC employee;

-- 10. 修改EMPLOYEE資料表,使用ID 欄位新增一個Primary key的限制條件(constraint),並為他命名。

ALTER TABLE employee
ADD CONSTRAINT PK PRIMARY KEY(ID);

SHOW INDEXES FROM employee;

-- 11. 在EMPLOYEE資料表新增一個外來鍵(foreign key)以確保員工不會被分派到一個不存在的部門。

ALTER TABLE employee
ADD CONSTRAINT fk_employee_deptid FOREIGN KEY(dept_id) REFERENCES employee(id);

SHOW INDEXES FROM employee;