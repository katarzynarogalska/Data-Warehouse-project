WITH CrashStats AS (
    SELECT 
        dd.DistrictName,
        COUNT(CASE WHEN cf.PeopleInjured > 0 OR cf.PeopleKilled > 0 THEN 1 END) * 100.0 / COUNT(*) AS PercentageWithInjuries,
        SUM(cf.PeopleInjured * 1.0) / COUNT(*) AS AvgPeopleInjuredPerCrash
    FROM 
        CrashFacts cf
    JOIN 
        DistrictDetailsDim dd ON cf.BoroughKey = dd.District_ID
    WHERE 
        dd.IsValid = 1
    GROUP BY 
        dd.DistrictName
)
SELECT 
    DistrictName,
    ROUND(PercentageWithInjuries, 2) AS PercentageWithInjuries,
    ROUND(AvgPeopleInjuredPerCrash, 2) AS AvgPeopleInjuredPerCrash
FROM 
    CrashStats
ORDER BY 
    DistrictName;
