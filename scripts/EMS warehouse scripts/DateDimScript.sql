-- Skrypt na Dim Date wypelniona od 1 stycznia 2020 do 31 grudnia 2020

CREATE TABLE DateDim (
    DateKey INT PRIMARY KEY,           
    FullDate DATE,                     
    Year INT,
    Month INT,
    Day INT,
    MonthName NVARCHAR(20),
    WeekdayNumber INT,                 -- 1=Monday, 7=Sunday
    WeekdayName NVARCHAR(20),
    IsWeekend BIT,
    SeasonName NVARCHAR(20)
);

DECLARE @StartDate DATE = '2020-01-01';
DECLARE @EndDate DATE = '2020-12-31';

WITH DateRange AS (
    SELECT @StartDate AS FullDate
    UNION ALL
    SELECT DATEADD(DAY, 1, FullDate)
    FROM DateRange
    WHERE FullDate < @EndDate
)
INSERT INTO DateDim (
    DateKey, FullDate, Year, Month, Day,
    MonthName, WeekdayNumber, WeekdayName,
    IsWeekend, SeasonName
)
SELECT
    CONVERT(INT, FORMAT(FullDate, 'yyyyMMdd')) AS DateKey,
    FullDate,
    YEAR(FullDate),
    MONTH(FullDate),
    DAY(FullDate),
    DATENAME(MONTH, FullDate),
    DATEPART(WEEKDAY, FullDate),  
    DATENAME(WEEKDAY, FullDate),
    CASE 
        WHEN DATENAME(WEEKDAY, FullDate) IN ('Saturday', 'Sunday') THEN 1 
        ELSE 0 
    END AS IsWeekend,
    CASE 
        WHEN MONTH(FullDate) IN (12, 1, 2) THEN 'Winter'
        WHEN MONTH(FullDate) IN (3, 4, 5) THEN 'Spring'
        WHEN MONTH(FullDate) IN (6, 7, 8) THEN 'Summer'
        WHEN MONTH(FullDate) IN (9, 10, 11) THEN 'Autumn'
    END AS SeasonName
FROM DateRange
OPTION (MAXRECURSION 366); 
