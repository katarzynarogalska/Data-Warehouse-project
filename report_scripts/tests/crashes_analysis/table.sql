WITH DistrictStats AS (
    SELECT 
        d.DistrictName,
        COUNT(c.Crash_ID) AS TotalCrashCount,
        SUM(c.PeopleInjured) AS TotalPeopleInjured,
        SUM(c.PeopleKilled) AS TotalPeopleKilled
    FROM 
        CrashFacts c
        JOIN DistrictDetailsDim d ON c.BoroughKey = d.District_ID
    WHERE 
        d.IsValid = 1
    GROUP BY 
        d.DistrictName
),
TotalStats AS (
    SELECT 
        'Total' AS DistrictName,
        SUM(TotalCrashCount) AS TotalCrashCount,
        SUM(TotalPeopleInjured) AS TotalPeopleInjured,
        SUM(TotalPeopleKilled) AS TotalPeopleKilled
    FROM 
        DistrictStats
)

SELECT * FROM DistrictStats
UNION ALL
SELECT * FROM TotalStats;