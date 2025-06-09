SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'CrashFacts';


-- missing values test
select count(*) as MissingValues from CrashFacts
where Crash_ID is null or CrashDateKey is null or CrashTimeKey is null or BoroughKey is null or StreetKey is null or Latitude is null or Longitude is null
or PeopleInjured is null or PeopleKilled is null or PedestriansInjured is null or PedestriansKilled is null or CyclistsInjured is null or CyclistsKilled is null or MotoristInjured is null or MotoristsKilled is null
or VehiclesAmount is null

-- date dim connection
select count(*) as MissingDateConnection
from CrashFacts f 
left join DateDim d on f.CrashDateKey = d.DateKey
where d.FullDate is null;

-- time dim connection
select count(*) as MissingTimeConnection
from CrashFacts f 
left join TimeDim d on f.CrashTimeKey = d.TimeKey
where d.TimeValue is null;

-- street connection
select count(*) as MissingStreetConnection
from CrashFacts f 
left join SpeedLimitsDim d on f.StreetKey = d.Street_ID
where d.StreetName = NULL or trim(d.StreetName)=''

-- street mapping 
select Crash_ID, StreetName from [ELT_staging_DB].dbo.Crashes where Crash_ID=5

select f.Crash_ID, f.StreetKey, d.StreetName from CrashFacts f
left join SpeedLimitsDim d on f.StreetKey = d.Street_ID
where f.Crash_ID=5

-- district connection
select count(*) as MissingBoroughConnection
from CrashFacts f
left join DistrictDetailsDim d on f.BoroughKey = d.District_ID
where d.DistrictName is null or trim(d.DistrictName)=''

-- district correct mapping

select Crash_ID, Borough from [ELT_staging_DB].dbo.Crashes where Crash_ID=5

select f.Crash_ID, f.BoroughKey, d.DistrictName from CrashFacts f
left join DistrictDetailsDim d on f.BoroughKey = d.District_ID
where f.Crash_ID=5

-- bridge testing - Factors
WITH ExplodedFactors AS (
    SELECT Crash_ID,
           CASE 
               WHEN Factor = 'Unspecified' THEN 'Unknown'
               ELSE Factor
           END AS Factor
    FROM (
        SELECT Crash_ID, Factor1, Factor2, Factor3, Factor4, Factor5
        FROM [ELT_Staging_DB].dbo.Crashes
    ) AS p
    UNPIVOT (
        Factor FOR FactorCol IN (Factor1, Factor2, Factor3, Factor4, Factor5)
    ) AS unpvt
    WHERE Factor IS NOT NULL
),

MappedFactors AS (
    SELECT ef.Crash_ID, df.Factor_ID
    FROM ExplodedFactors ef
    JOIN ContributingFactorsDim df ON ef.Factor = df.FactorName
),
ExpectedBridge AS (
    SELECT Crash_ID, Factor_ID, COUNT(*) AS ExpectedAmt
    FROM MappedFactors
    GROUP BY Crash_ID, Factor_ID
),
ActualBridge AS (
    SELECT Crash_ID, Factor_ID, FactorAmt AS ActualAmt
    FROM CrashFactorBridge
)
SELECT 
    COALESCE(e.Crash_ID, a.Crash_ID) AS Crash_ID,
    COALESCE(e.Factor_ID, a.Factor_ID) AS Factor_ID,
    e.ExpectedAmt,
    a.ActualAmt
FROM ExpectedBridge e
FULL OUTER JOIN ActualBridge a
    ON e.Crash_ID = a.Crash_ID AND e.Factor_ID = a.Factor_ID
WHERE ISNULL(e.ExpectedAmt, 0) <> ISNULL(a.ActualAmt, 0)


-- bridge testing Vehicles

-- Unpivotujemy pojazdy z tabeli Crashes
WITH UnpivotedVehicles AS (
    SELECT Crash_ID,
        -- Odwzorowanie rêcznych transformacji Vehicle z ETL
        CASE 
            WHEN Vehicle IN ('0', 'UKN', 'n/a', 'UNK', 'UNATTACHED') THEN 'UNKNOWN'
            WHEN Vehicle = '18 WEELER' THEN '18 WHEELER'
            WHEN Vehicle = 'AMBULENCE' THEN 'AMBULANCE'
            WHEN Vehicle = 'backh' THEN 'BACK HOE'
            WHEN Vehicle = 'comme' THEN 'COMMERCIAL'
            WHEN Vehicle = 'CONCRETE M' THEN 'CONCRETE MIXER'
            WHEN Vehicle = 'DIRTBIKE' THEN 'DIRT BIKE'
            ELSE Vehicle
        END AS VehicleType
    FROM (
        SELECT Crash_ID, Vehicle1, Vehicle2, Vehicle3, Vehicle4, Vehicle5
        FROM [ELT_Staging_DB].dbo.Crashes
    ) AS src
    UNPIVOT (
        Vehicle FOR VehicleCol IN (Vehicle1, Vehicle2, Vehicle3, Vehicle4, Vehicle5)
    ) AS unpvt
    WHERE Vehicle IS NOT NULL
),

-- £¹czymy z wymiarem, ¿eby uzyskaæ Vehicle_ID
Expected AS (
    SELECT uv.Crash_ID, dvt.Vehicle_ID, COUNT(*) AS ExpectedAmount
    FROM UnpivotedVehicles uv
    JOIN dbo.VehicleTypesDim dvt
        ON uv.VehicleType = dvt.VehicleTypeName
    GROUP BY uv.Crash_ID, dvt.Vehicle_ID
),

-- Dane z bridge
Actual AS (
    SELECT Crash_ID, Vehicle_ID, VehicleAmt AS ActualAmount
    FROM dbo.CrashVehicleBridge
)

-- Porównanie oczekiwanej liczby z bridge
SELECT 
    COALESCE(e.Crash_ID, a.Crash_ID) AS Crash_ID,
    COALESCE(e.Vehicle_ID, a.Vehicle_ID) AS Vehicle_ID,
    e.ExpectedAmount,
    a.ActualAmount
FROM Expected e
FULL OUTER JOIN Actual a 
    ON e.Crash_ID = a.Crash_ID AND e.Vehicle_ID = a.Vehicle_ID
WHERE ISNULL(e.ExpectedAmount, 0) <> ISNULL(a.ActualAmount, 0)
