SELECT 
    d.DistrictName AS Borough,
    d.AvgPopulation,
    
    ROUND(1.0 * d.TotalSNAPRecipients / d.AvgPopulation * 100, 2) AS [% SNAP Recipients],
    ROUND(1.0 * d.TotalCashAssistanceRecipients / d.AvgPopulation * 100, 2) AS [% Cash Assistance],
    ROUND(1.0 * d.TotalMEDICAIDRecipients / d.AvgPopulation * 100, 2) AS [% Medicaid],

    (SELECT COUNT(DISTINCT c.Crash_ID)
     FROM CrashFacts c 
     WHERE c.BoroughKey = d.District_ID) AS TotalCrashes,

    (SELECT COUNT(DISTINCT e.EMS_ID)
     FROM EMSFacts e 
     WHERE e.BoroughKey = d.District_ID) AS TotalEMSInterventions,

    CAST(ROUND(
        (SELECT COUNT(DISTINCT c.Crash_ID)
         FROM CrashFacts c 
         WHERE c.BoroughKey = d.District_ID) * 100000.0 / d.AvgPopulation, 0
    ) AS INT) AS CrashesPer100k,

    CAST(ROUND(
        (SELECT COUNT(DISTINCT e.EMS_ID)
         FROM EMSFacts e 
         WHERE e.BoroughKey = d.District_ID) * 100000.0 / d.AvgPopulation, 0
    ) AS INT) AS EMSInterventionsPer100k

FROM 
    DistrictDetailsDim d
WHERE 
    d.IsValid = 1
ORDER BY 
    d.AvgPopulation DESC;
