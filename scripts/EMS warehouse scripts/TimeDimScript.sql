-- Skypt do stworzenia wymiaru czasu zawierajacego czas i przypisana pore dnia
CREATE TABLE TimeDim (
    TimeKey INT PRIMARY KEY,       
    TimeValue TIME,                
    Hour INT,
    PartOfDay NVARCHAR(20)         
);

-- Wype³nianie TimeDim co 1 godzinê
WITH Times AS (
    SELECT CAST('00:00:00' AS TIME) AS TimeValue
    UNION ALL
    SELECT DATEADD(HOUR, 1, TimeValue)
    FROM Times
    WHERE TimeValue < '23:00:00'
)
INSERT INTO TimeDim (TimeKey, TimeValue, Hour, PartOfDay)
SELECT
    DATEPART(HOUR, TimeValue) * 10000 AS TimeKey,
    TimeValue,
    DATEPART(HOUR, TimeValue),
    CASE 
        WHEN DATEPART(HOUR, TimeValue) BETWEEN 0 AND 4 THEN 'Night'
        WHEN DATEPART(HOUR, TimeValue) BETWEEN 5 AND 8 THEN 'Early Morning'
        WHEN DATEPART(HOUR, TimeValue) BETWEEN 9 AND 11 THEN 'Late Morning'
        WHEN DATEPART(HOUR, TimeValue) BETWEEN 12 AND 16 THEN 'Afternoon'
        WHEN DATEPART(HOUR, TimeValue) BETWEEN 17 AND 20 THEN 'Evening'
        WHEN DATEPART(HOUR, TimeValue) BETWEEN 21 AND 23 THEN 'Late Evening'
    END AS PartOfDay
FROM Times
OPTION (MAXRECURSION 24);