SELECT 
    ct.CallTypeName,
    AVG(f.OnSceneArrivalDuration) AS AvgOnSceneArrivalDuration,
    AVG(f.ToHospitalArrivalDuration) AS AvgToHospitalArrivalDuration,
    COUNT(*) AS InterventionCount
FROM EMSFacts f
JOIN CallTypesDim ct ON f.FinalCallTypeKey = ct.CallType_ID
GROUP BY ct.CallTypeName, ct.CallType_ID
ORDER BY AvgOnSceneArrivalDuration DESC;