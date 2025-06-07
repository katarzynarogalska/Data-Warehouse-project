WITH CrashCounts AS (
    SELECT 
        d.DistrictName,
        COUNT(DISTINCT c.Crash_ID) AS TotalCrashCount
    FROM 
        DistrictDetailsDim d
    LEFT JOIN 
        CrashFacts c ON d.District_ID = c.BoroughKey
    GROUP BY 
        d.DistrictName
),
EMSCounts AS (
    SELECT 
        d.DistrictName,
        COUNT(DISTINCT e.EMS_ID) AS TotalEMSDispatchCount
    FROM 
        DistrictDetailsDim d
    LEFT JOIN 
        EMSFacts e ON d.District_ID = e.BoroughKey
    GROUP BY 
        d.DistrictName
)
SELECT 
    COALESCE(c.DistrictName, e.DistrictName) AS DistrictName,
    COALESCE(c.TotalCrashCount, 0) AS TotalCrashCount,
    COALESCE(e.TotalEMSDispatchCount, 0) AS TotalEMSDispatchCount
FROM 
    CrashCounts c
FULL OUTER JOIN 
    EMSCounts e ON c.DistrictName = e.DistrictName
ORDER BY 
    DistrictName;