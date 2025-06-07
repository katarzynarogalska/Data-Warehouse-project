WITH CallTypeSeverity AS (
    SELECT 
        ct.CallTypeName,
        sl.SeverityLevel,
        COUNT(*) AS InterventionCount
    FROM EMSFacts e
    JOIN CallTypesDim ct ON e.FinalCallTypeKey = ct.CallType_ID
    JOIN SeverityLevelsDim sl ON e.FinalSeverityLevelKey = sl.SeverityLevel_ID
    GROUP BY ct.CallTypeName, sl.SeverityLevel
)

SELECT 
    CallTypeName,
    SeverityLevel,
    InterventionCount,
    SUM(InterventionCount) OVER (PARTITION BY CallTypeName) AS TotalForCallType
FROM CallTypeSeverity
ORDER BY 
    SUM(InterventionCount) OVER (PARTITION BY CallTypeName) DESC,
    CallTypeName,
    InterventionCount DESC;