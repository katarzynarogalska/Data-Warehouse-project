SELECT COUNT(DISTINCT Crash_ID) AS TotalCrashCount
FROM CrashFacts;

SELECT SUM(PeopleInjured) AS TotalPeopleInjured
FROM CrashFacts;

SELECT COUNT(DISTINCT EMS_ID) AS TotalEMSDispatchInterventions
FROM EMSFacts;

SELECT 
    COUNT(CASE WHEN OnSceneArrivalDuration < 8 THEN 1 END) * 100.0 / 
    COUNT(*) AS FastResponsePercentage
FROM EMSFacts