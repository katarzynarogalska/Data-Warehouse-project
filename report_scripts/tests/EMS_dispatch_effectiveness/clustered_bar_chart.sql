SELECT 
    sl.SeverityLevel,
    COUNT(*) AS InterventionsCount
FROM EMSFacts f
JOIN SeverityLevelsDim sl ON f.FinalSeverityLevelKey = sl.SeverityLevel_ID
WHERE 
    f.OnSceneArrivalDuration > 8
GROUP BY sl.SeverityLevel, sl.SeverityLevel_ID