SELECT 
    d.DistrictName,
    AVG(f.OnSceneArrivalDuration) AS AvgResponseTime
FROM EMSFacts f
JOIN DistrictDetailsDim d ON f.BoroughKey = d.District_ID
GROUP BY d.DistrictName
ORDER BY AvgResponseTime DESC;