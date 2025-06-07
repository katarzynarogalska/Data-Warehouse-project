SELECT
    s.StreetName,
    COUNT(c.Crash_ID) AS TotalCrashCount
FROM 
    CrashFacts c
    JOIN SpeedLimitsDim s ON c.StreetKey = s.Street_ID
WHERE 
    s.IsValid = 1
GROUP BY 
    s.StreetName
ORDER BY 
    TotalCrashCount DESC;