WITH TimeIntervals AS (
    SELECT 
        CASE
            WHEN OnSceneArrivalDuration < 2 THEN '0-2 min'
            WHEN OnSceneArrivalDuration < 4 THEN '2-4 min'
            WHEN OnSceneArrivalDuration < 6 THEN '4-6 min'
            WHEN OnSceneArrivalDuration < 8 THEN '6-8 min'
            WHEN OnSceneArrivalDuration < 10 THEN '8-10 min'
            WHEN OnSceneArrivalDuration < 12 THEN '10-12 min'
            WHEN OnSceneArrivalDuration < 14 THEN '12-14 min'
            WHEN OnSceneArrivalDuration < 16 THEN '14-16 min'
            WHEN OnSceneArrivalDuration < 18 THEN '16-18 min'
            WHEN OnSceneArrivalDuration < 20 THEN '18-20 min'
            ELSE '>20 min'
        END AS TimeInterval,
        OnSceneArrivalDuration
    FROM EMSFacts
),
IntervalStats AS (
    SELECT 
        TimeInterval,
        COUNT(*) AS InterventionCount,
        ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM TimeIntervals), 2) AS Percentage
    FROM TimeIntervals
    GROUP BY TimeInterval
)
SELECT 
    TimeInterval,
    InterventionCount,
    Percentage
FROM IntervalStats;