SELECT 
    t.IncidentMonthName AS IncidentMonthName,
    COUNT(*) AS InterventionCount
FROM EMSFacts e
JOIN vwDimDate_Incident t ON e.IncidentDateKey = t.IncidentDateKey
GROUP BY t.IncidentMonthName, t.IncidentMonth
ORDER BY t.IncidentMonth;  