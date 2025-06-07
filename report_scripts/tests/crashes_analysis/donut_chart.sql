SELECT 
    dd.DistrictName,
    COUNT(c.Crash_ID) AS CrashCount,
    ROUND(
        100.0 * COUNT(c.Crash_ID) / SUM(COUNT(c.Crash_ID)) OVER(),
        1
    ) AS DistrictShareInYearPct
FROM 
    CrashFacts c
JOIN 
    vwDimDate_Crash d ON c.CrashDateKey = d.CrashDateKey
JOIN 
    DistrictDetailsDim dd ON c.BoroughKey = dd.District_ID
WHERE 
    dd.IsValid = 1
GROUP BY 
    dd.DistrictName
ORDER BY 
    DistrictShareInYearPct DESC;
