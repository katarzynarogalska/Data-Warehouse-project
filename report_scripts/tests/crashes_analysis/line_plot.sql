SELECT 
    d.IncidentMonth,
    d.IncidentMonthName,
    COUNT(c.Crash_ID) AS CrashCount,
    SUM(c.VehiclesAmount) AS TotalVehicleAmount,
	SUM(c.PeopleInjured) AS TotalInjured
FROM 
    CrashFacts c
JOIN 
    vwDimDate_Incident d ON c.CrashDateKey = d.IncidentDateKey
GROUP BY 
    d.IncidentMonth, d.IncidentMonthName
ORDER BY 
    d.IncidentMonth;
