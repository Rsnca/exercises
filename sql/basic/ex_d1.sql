## 演習3
CREATE TABLE companies(
    id   INTEGER NOT NULL PRIMARY KEY,
    name VARCHAR(30) NOT NULL 
);

## 演習4
ALTER TABLE day1_to_drop ADD COLUMN phone_number CHAR(11);

## 準備
START TRANSACTION; 
INSERT INTO exercise.day1_to_drop VALUES(1, '佐藤太郎', 'sato@gmail.com', '1983-01-05', '12345678901');
INSERT INTO exercise.day1_to_drop VALUES(2, '鈴木次郎', 'suzuki@gmail.com', '1994-08-21', '23456789012');
INSERT INTO exercise.day1_to_drop VALUES(3, '田中三郎', 'tanaka@gmail.com', '1998-12-09', '34567890123');
INSERT INTO exercise.day1_to_drop VALUES(4, '高橋四郎', 'takahashi@yahoo.co.jp', '1995-03-27', '45678901234');
COMMIT;

## 演習5
SELECT * FROM day1_to_drop;

## 演習6
SELECT
  id   as "ユーザーID",
  name as "ユーザー氏名"
FROM day1_to_drop
;

## 演習7
DROP TABLE day1_to_drop;

## 演習8
DESCRIBE companies;
SHOW COLUMNS FROM day1_to_drop;