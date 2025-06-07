SELECT TOP 10
    vt.VehicleTypeName,
    COUNT(*) AS CrashCount
FROM 
    CrashFacts c
JOIN 
    CrashVehicleBridge cvb ON c.Crash_ID = cvb.Crash_ID
JOIN 
    VehicleTypesDim vt ON cvb.Vehicle_ID = vt.Vehicle_ID
GROUP BY 
    vt.VehicleTypeName
ORDER BY 
    COUNT(*) DESC;