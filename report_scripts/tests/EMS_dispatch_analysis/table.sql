SELECT 
    sl.SeverityLevel,
    AVG(e.OnSceneArrivalDuration) AS AvgResponseTimeMinutes,
    CONCAT(
        FLOOR(AVG(e.OnSceneArrivalDuration)), ' min ',
        ROUND((AVG(e.OnSceneArrivalDuration) * 60) % 60, 0), ' s'
    ) AS AvgResponseTimeFormatted
FROM EMSFacts e
JOIN SeverityLevelsDim sl ON e.FinalSeverityLevelKey = sl.SeverityLevel_ID
GROUP BY sl.SeverityLevel
ORDER BY AVG(e.OnSceneArrivalDuration);