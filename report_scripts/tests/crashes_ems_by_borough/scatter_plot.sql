WITH BoroughStats AS (
    SELECT 
        d.District_ID,
        d.DistrictName AS Borough,
        d.TotalCashAssistanceRecipients,
        d.AvgPopulation,
        CAST(d.TotalCashAssistanceRecipients AS FLOAT) / d.AvgPopulation * 100 AS CashAssistancePercentage
    FROM DistrictDetailsDim d
    WHERE d.IsValid = 1
),
EMSCounts AS (
    SELECT 
        e.BoroughKey,
        COUNT(DISTINCT e.EMS_ID) AS EMSInterventions
    FROM EMSFacts e
    GROUP BY e.BoroughKey
),
CrashCounts AS (
    SELECT 
        c.BoroughKey,
        COUNT(DISTINCT c.Crash_ID) AS Crashes
    FROM CrashFacts c
    GROUP BY c.BoroughKey
)
SELECT 
    b.Borough,
    ROUND(b.CashAssistancePercentage, 2) AS CashAssistancePercentage,
    COALESCE(e.EMSInterventions, 0) AS EMSInterventions,
    COALESCE(c.Crashes, 0) AS Crashes,
    ROUND(
      CASE WHEN b.AvgPopulation > 0 THEN COALESCE(e.EMSInterventions, 0) * 100000.0 / b.AvgPopulation ELSE 0 END
    , 0) AS EMSInterventionsPer100k,
    ROUND(
      CASE WHEN b.AvgPopulation > 0 THEN COALESCE(c.Crashes, 0) * 100000.0 / b.AvgPopulation ELSE 0 END
    , 0) AS CrashesPer100k
FROM BoroughStats b
LEFT JOIN EMSCounts e ON b.District_ID = e.BoroughKey
LEFT JOIN CrashCounts c ON b.District_ID = c.BoroughKey
ORDER BY b.CashAssistancePercentage;
