## 準備
CREATE TABLE Shohin(
    shohin_id     CHAR(4) NOT NULL,
    shohin_mei    VARCHAR(100) NOT NULL,
    shohin_bunrui VARCHAR(32) NOT NULL,
    hanbai_tanka  INTEGER,
    shiire_tanka  INTEGER,
    torokubi      DATE,
    PRIMARY KEY (shohin_id)
);
START TRANSACTION;
INSERT INTO Shohin VALUES ('0001', 'Tシャツ', '衣服', 1000, 500, '2009-09-20');
INSERT INTO Shohin VALUES ('0002', '穴あけパンチ',  '事務用品', 500, 320, '2009-09-11');
INSERT INTO Shohin VALUES ('0003', 'カッターシャツ', '衣服', 4000, 2800, NULL);
INSERT INTO Shohin VALUES ('0004', '包丁', 'キッチン用品', 3000, 2800, '2009-09-20');
INSERT INTO Shohin VALUES ('0005', '圧力鍋', 'キッチン用品', 6800, 5000, '2009-01-15');
INSERT INTO Shohin VALUES ('0006', 'フォーク', 'キッチン用品', 500, NULL, '2009-09-20');
INSERT INTO Shohin VALUES ('0007', 'おろしがね', 'キッチン用品', 880, 790, '2008-04-28');
INSERT INTO Shohin VALUES ('0008', 'ボールペン', '事務用品', 100, NULL, '2009-11-11');
COMMIT;

CREATE TABLE Shohin2
(shohin_id     CHAR(4)      NOT NULL,
 shohin_mei    VARCHAR(100) NOT NULL,
 shohin_bunrui VARCHAR(32)  NOT NULL,
 hanbai_tanka  INTEGER      ,
 shiire_tanka  INTEGER      ,
 torokubi      DATE         ,
 PRIMARY KEY (shohin_id));


INSERT INTO Shohin2 VALUES ('0001', 'Tシャツ', '衣服', 1000, 500, '2009-09-20');
INSERT INTO Shohin2 VALUES ('0002', '穴あけパンチ', '事務用品', 500, 320, '2009-09-11');
INSERT INTO Shohin2 VALUES ('0003', 'カッターシャツ', '衣服', 4000, 2800, NULL);
INSERT INTO Shohin2 VALUES ('0009', '手袋', '衣服', 800, 500, NULL);
INSERT INTO Shohin2 VALUES ('0010', 'やかん', 'キッチン用品', 2000, 1700, '2009-09-20');

CREATE TABLE children(
  company_id INTEGER NOT NULL,
  employee_id CHAR(4) NOT NULL,
  child VARCHAR(100),
  PRIMARY KEY (company_id, employee_id, child)
);

INSERT INTO children VALUES (1,'000A', '信二');
INSERT INTO children VALUES (1,'000A', '達夫');
INSERT INTO children VALUES (1,'001F', '敦');
INSERT INTO children VALUES (1,'001F', '清美');
INSERT INTO children VALUES (1,'001F', '陽子');

CREATE TABLE companies(
    id   INTEGER NOT NULL PRIMARY KEY,
    name VARCHAR(30) NOT NULL 
);

INSERT INTO companies VALUES
(1, 'A商社'),
(2, 'Bカンパニー'),
(3, 'C事務所'),
(4, 'D金融');

CREATE TABLE employees(
  company_id      INTEGER NOT NULL,
  employee_id     CHAR(4) NOT NULL,
  employee_name   VARCHAR(100),
  age             INTEGER,
  department_id   CHAR(3) NOT NULL,
  department_name VARCHAR(100),
  PRIMARY KEY (company_id, employee_id)
);

INSERT INTO employees
VALUES
  (1, '000A', '加藤', 40, 'D01', '開発'), (1, '000B', '藤本', 32, 'D02', '人事'), (1, '001F', '三島', 50, 'D03', '営業'),
  (2, '000A', '斎藤', 47, 'D03', '営業'), (2, '009F', '田島', 25, 'D01', '開発'), (2, '010A', '渋谷', 33, 'D04', '総務');

SELECT
  id,
  REPLACE(name, '金融', '証券')
FROM companies
;

## 演習1
SELECT
  shohin_id,
  shohin_mei,
  hanbai_tanka
FROM(
    SELECT * FROM Shohin
    UNION ALL
    SELECT * FROM Shohin2
) AS union_shohin
ORDER BY hanbai_tanka DESC
;


## 演習2
WITH parent_child AS(
    SELECT
        e.company_id,
        e.employee_id,
        employee_name,
        child as child_name
    FROM employees as e
        LEFT OUTER JOIN children as c
        ON e.employee_id = c.employee_id
        AND e.company_id = c.company_id
)
SELECT
  company_id,
  employee_id,
  employee_name,
  COUNT(child_name)
FROM parent_child
GROUP BY company_id, employee_id
;
