SELECT 
    t.IncidentPartOfDay,
    COUNT(*) AS InterventionCount,
    ROUND(AVG(e.OnSceneArrivalDuration), 2) AS AvgResponseTimeMinutes
FROM EMSFacts e
JOIN vwTimeDim_Incident t ON e.IncidentTimeKey = t.IncidentTimeKey
GROUP BY t.IncidentPartOfDay