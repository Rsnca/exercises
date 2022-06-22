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

CREATE TABLE SampleMath(
m  NUMERIC (10,3),
n  INTEGER,
p  INTEGER);

INSERT INTO SampleMath(m, n, p) VALUES (500,  0,    NULL);
INSERT INTO SampleMath(m, n, p) VALUES (-180, 0,    NULL);
INSERT INTO SampleMath(m, n, p) VALUES (NULL, NULL, NULL);
INSERT INTO SampleMath(m, n, p) VALUES (NULL, 7,    3);
INSERT INTO SampleMath(m, n, p) VALUES (NULL, 5,    2);
INSERT INTO SampleMath(m, n, p) VALUES (NULL, 4,    NULL);
INSERT INTO SampleMath(m, n, p) VALUES (8,    NULL, 3);
INSERT INTO SampleMath(m, n, p) VALUES (2.27, 1,    NULL);
INSERT INTO SampleMath(m, n, p) VALUES (5.555,2,    NULL);
INSERT INTO SampleMath(m, n, p) VALUES (NULL, 1,    NULL);
INSERT INTO SampleMath(m, n, p) VALUES (8.76, NULL, NULL);

CREATE TABLE SampleStr
(str1  VARCHAR(40),
 str2  VARCHAR(40),
 str3  VARCHAR(40));

INSERT INTO SampleStr (str1, str2, str3) VALUES ('あいう',	'えお'	,	NULL);
INSERT INTO SampleStr (str1, str2, str3) VALUES ('abc'	,	'def'	,	NULL);
INSERT INTO SampleStr (str1, str2, str3) VALUES ('山田'	,	'太郎'  ,	'です');
INSERT INTO SampleStr (str1, str2, str3) VALUES ('aaa'	,	NULL    ,	NULL);
INSERT INTO SampleStr (str1, str2, str3) VALUES (NULL	,	'あああ',	NULL);
INSERT INTO SampleStr (str1, str2, str3) VALUES ('@!#$%',	NULL	,	NULL);
INSERT INTO SampleStr (str1, str2, str3) VALUES ('ABC'	,	NULL	,	NULL);
INSERT INTO SampleStr (str1, str2, str3) VALUES ('aBC'	,	NULL	,	NULL);
INSERT INTO SampleStr (str1, str2, str3) VALUES ('abc太郎',	'abc'	,	'ABC');
INSERT INTO SampleStr (str1, str2, str3) VALUES ('abcdefabc', 'abc'	,	'ABC');
INSERT INTO SampleStr (str1, str2, str3) VALUES ('ミックマック',	'ッ', 'っ');


## 演習1
SELECT *
FROM Shohin
WHERE
  shohin_bunrui IN ('衣服', 'キッチン用品')
  AND hanbai_tanka - shiire_tanka >= 300
;

## 演習2
SELECT
  ROUND(m, -1) as m_round
FROM SampleMath
;

## 演習3
SELECT
  REPLACE(str2, '太郎', '花子') as name_replace
FROM SampleStr
WHERE str2 = '太郎'
;

## 演習4
SELECT
  COALESCE(CONCAT(m, '+', n), 0) as concat
FROM SampleMath
;

## 演習5
SELECT
    *
FROM
    Shohin
WHERE 
    torokubi IN ('2009-09-20', '2009-09-11', '2009-01-15')
;

## 演習6
SELECT
  shohin_mei,
  hanbai_tanka,
  CASE
    WHEN hanbai_tanka > 500 THEN '高い'
    WHEN hanbai_tanka <= 500 THEN '安い'
  END AS feels_hanbai_tanka
FROM Shohin
;