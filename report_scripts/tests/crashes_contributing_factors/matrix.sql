SELECT 
    DATEPART(HOUR, t.CrashTimeValue) AS CrashHour,
    SUM(CASE WHEN d.CrashWeekdayName = 'Sunday' THEN 1 ELSE 0 END) AS Sunday,
    SUM(CASE WHEN d.CrashWeekdayName = 'Monday' THEN 1 ELSE 0 END) AS Monday,
    SUM(CASE WHEN d.CrashWeekdayName = 'Tuesday' THEN 1 ELSE 0 END) AS Tuesday,
    SUM(CASE WHEN d.CrashWeekdayName = 'Wednesday' THEN 1 ELSE 0 END) AS Wednesday,
    SUM(CASE WHEN d.CrashWeekdayName = 'Thursday' THEN 1 ELSE 0 END) AS Thursday,
    SUM(CASE WHEN d.CrashWeekdayName = 'Friday' THEN 1 ELSE 0 END) AS Friday,
    SUM(CASE WHEN d.CrashWeekdayName = 'Saturday' THEN 1 ELSE 0 END) AS Saturday,
    COUNT(*) AS Total
FROM 
    CrashFacts c
JOIN 
    vwDimDate_Crash d ON c.CrashDateKey = d.CrashDateKey
JOIN 
    vwTimeDim_Crash t ON c.CrashTimeKey = t.CrashTimeKey
GROUP BY 
    DATEPART(HOUR, t.CrashTimeValue)
ORDER BY 
    DATEPART(HOUR, t.CrashTimeValue);