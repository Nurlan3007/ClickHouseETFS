
select * from s3('https://learnclickhouse.s3.us-east-2.amazonaws.com/datasets/etfs/AAAU.csv') limit 100;

CREATE TABLE ETFS_name (
    Date_create DATETIME,
    Name String,
    Description String,
    id Int32
) ENGINE = MergeTree
ORDER BY Date_create;

INSERT INTO ETFS_name (Name, Description, Date_create,id)
VALUES ('AADR', 'iShares MSCI All Country Asia ex Japan ETF', now(),1),
('AAAU', 'Graniteshares Gold Trust', now(),2),
('SPY', 'SPDR S&P 500 ETF Trust', now(),3);

INSERT INTO ETFS_name (Name, Description, Date_create,id)
VALUES ('ABEQ', 'iShares MSCI All Country Asia ex Japan ETF', now(),4);


CREATE TABLE ETFS (
    name_id Int32,
    TradeDate DATE,
    Date_create DATETIME,
    Open Float64,
    High Float64,
    Low Float64,
    Close Float64,
    Volume UInt64
) ENGINE = MergeTree
ORDER BY Date_create;

INSERT INTO ETFS (name_id, TradeDate, Date_create, Open, High, Low, Close, Volume)
SELECT
    2,  -- Название ETF
    TradeDate,
    now(),   -- Текущая дата и время
    Open,
    High,
    Low,
    Close,
    Volume
FROM s3('https://learnclickhouse.s3.us-east-2.amazonaws.com/datasets/etfs/AAAU.csv')
FORMAT CSVWithNames;

INSERT INTO ETFS (name_id, TradeDate, Date_create, Open, High, Low, Close, Volume)
SELECT
    1,
    TradeDate,
    now(),
    Open,
    High,
    Low,
    Close,
    Volume
FROM s3('https://learnclickhouse.s3.us-east-2.amazonaws.com/datasets/etfs/AADR.csv')
FORMAT CSVWithNames;

INSERT INTO ETFS (name_id, TradeDate, Date_create, Open, High, Low, Close, Volume)
SELECT
    4,  -- Название ETF
    TradeDate,
    now(),   -- Текущая дата и время
    Open,
    High,
    Low,
    Close,
    Volume
FROM s3('https://learnclickhouse.s3.us-east-2.amazonaws.com/datasets/etfs/ABEQ.csv')
FORMAT CSVWithNames;

SELECT
    name_id,
    SUM(Volume),
    ETFS_name.Name
FROM ETFS
inner join ETFS_name on ETFS.name_id = ETFS_name.id
GROUP BY name_id,ETFS_name.Name

SELECT toYear(TradeDate) AS year, SUM(Volume) AS total_volume
FROM ETFS
where name_id = 1
GROUP BY year
order by year;



