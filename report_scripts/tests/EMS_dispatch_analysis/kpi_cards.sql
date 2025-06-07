SELECT 
    COUNT(*) AS Total_EMS_Dispatch_Interventions,
    FORMAT(COUNT(*), 'N0') + 'K' AS Formatted_Value
FROM EMSFacts;

SELECT 
    AVG(InterventionDuration) AS Avg_Duration_Decimal,
    CONCAT(
        CAST(AVG(InterventionDuration) AS INT), ' min ',
        CAST(ROUND((AVG(InterventionDuration) - CAST(AVG(InterventionDuration) AS INT)) * 60, 0) AS INT), ' s'
    ) AS Avg_Intervention_Duration
FROM EMSFacts;

SELECT 
    AVG(OnSceneArrivalDuration) AS Avg_Response_Decimal,
    CONCAT(
        CAST(AVG(OnSceneArrivalDuration) AS INT), ' min ',
        CAST(ROUND((AVG(OnSceneArrivalDuration) - CAST(AVG(OnSceneArrivalDuration) AS INT)) * 60, 0) AS INT), ' s'
    ) AS Avg_Response_Time
FROM EMSFacts;