
-- 1. 將下列的資料新增至MY_EMP 資料表中,不要列舉欄位。(1 Patel Ralph rpatel 795)。

INSERT INTO MY_EMP
VALUES(1,'Patel','Ralph','rpatel',795) ;
SELECT * FROM MY_EMP;

-- 2. 使用列舉欄位方式,將下列的資料新增至 MY_EMP資料表中。(2 Dancs Betty bdancs 860)。

INSERT INTO MY_EMP(ID,LAST_NAME,FIRST_NAME,USERID,SALARY)
VALUES(2,"Dancs","Betty","Bdancs",860);
SELECT * FROM MY_EMP;

-- 3. 將下列的資料新增至 MY_EMP資料表中。
-- 			3 Biri Ben bbiri 1100
-- 			4 Newman Chad cnewman 750
INSERT INTO MY_EMP
VALUES 
	(3,"Biri","Ben","bbiri",1100),
    (4,"Newman","Chad","cnewan",750);
SELECT * FROM MY_EMP;

-- 4. 將員工編號為3的名字(last name)更改為 Drexler 。
SET SQL_SAFE_UPDATES = 0;
UPDATE MY_EMP
SET LAST_NAME = "Drexler"
WHERE ID = 3;
SELECT * FROM MY_EMP;

-- 5. 將薪資低於900元的所有員工薪資調整為1000元。

UPDATE MY_EMP
SET SALARY = 1000
WHERE SALARY < 1000;
SELECT * FROM MY_EMP;

-- 6. 刪除 Betty Dancs 的資料。

DELETE FROM MY_EMP
WHERE FIRST_NAME = "Betty" and last_name = "Dancs";
SELECT * FROM MY_EMP;

-- 7. 啟動一個資料庫交易,將所有員工的薪資調升10%,設定一個交易儲存點,
-- 刪除所有MY_EMP資料表中的資料,確認資料已被你刪光了,放棄刪除資料的動作確認交易
START TRANSACTION;
UPDATE MY_EMP
SET SALARY = SALARY * 1.3;
SAVEPOINT POINT;
DELETE FROM MY_EMP;
SELECT * FROM MY_EMP;
ROLLBACK TO POINT;
COMMIT;






