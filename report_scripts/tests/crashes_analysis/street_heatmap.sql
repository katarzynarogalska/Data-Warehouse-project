SELECT 
    s.SpeedLimit,
    s.IsSigned,
    COUNT(c.Crash_ID) AS CrashCount
FROM 
    CrashFacts c
    JOIN SpeedLimitsDim s ON c.StreetKey = s.Street_ID
WHERE 
    s.IsValid = 1
GROUP BY 
    s.SpeedLimit, s.IsSigned
ORDER BY 
    s.SpeedLimit, s.IsSigned;