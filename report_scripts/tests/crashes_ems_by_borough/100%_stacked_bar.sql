WITH SeverityByBorough AS (
    SELECT 
        d.DistrictName AS Borough,
        s.SeverityLevel,
        COUNT(*) AS InterventionCount
    FROM EMSFacts e
    JOIN DistrictDetailsDim d ON e.BoroughKey = d.District_ID AND d.IsValid = 1
    JOIN SeverityLevelsDim s ON e.FinalSeverityLevelKey = s.SeverityLevel_ID
    GROUP BY d.DistrictName, s.SeverityLevel
),
TotalByBorough AS (
    SELECT 
        Borough,
        SUM(InterventionCount) AS TotalInterventions
    FROM SeverityByBorough
    GROUP BY Borough
)
SELECT 
    s.Borough,
    s.SeverityLevel,
    s.InterventionCount,
    t.TotalInterventions,
    CAST(s.InterventionCount AS FLOAT) / t.TotalInterventions * 100 AS Percentage
FROM SeverityByBorough s
JOIN TotalByBorough t ON s.Borough = t.Borough
ORDER BY s.Borough, s.SeverityLevel;