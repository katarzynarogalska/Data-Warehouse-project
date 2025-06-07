SELECT 
    t.CrashPartOfDay AS TimeCategory,
    SUM(c.PedestriansInjured) AS TotalPedestriansInjured,
    SUM(c.CyclistsInjured) AS TotalCyclistsInjured,
    SUM(c.MotoristInjured) AS TotalMotoristsInjured,
    SUM(c.PeopleInjured) AS TotalPeopleInjured
FROM 
    CrashFacts c
JOIN 
    vwTimeDim_Crash t ON c.CrashTimeKey = t.CrashTimeKey
GROUP BY 
    t.CrashPartOfDay
ORDER BY 
    CASE t.CrashPartOfDay
        WHEN 'Early Morning' THEN 1
        WHEN 'Late Morning' THEN 2
        WHEN 'Afternoon' THEN 3
        WHEN 'Evening' THEN 4
        WHEN 'Late Evening' THEN 5
        WHEN 'Night' THEN 6
        ELSE 7
    END;