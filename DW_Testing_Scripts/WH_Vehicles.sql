SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'VehicleTypesDim';

-- 2 missing values
select count(*) as MissingRows from VehicleTypesDim
where VehicleTypeName is null or trim(VehicleTypeName)=''

-- 3 Unknown values
select * from VehicleTypesDim
where VehicleTypeName='UNKNOWN'

--4 Row counts
SELECT COUNT(DISTINCT value) AS UnikalnychPojazdow
FROM (
    SELECT CASE 
        WHEN Vehicle1 IN ('0', 'UKN', 'UNK', 'n/a', 'UNATTACHED') THEN 'UNKNOWN'
        WHEN Vehicle1 = '18 WEELER' THEN '18 WHEELER'
        WHEN Vehicle1 = 'AMBULENCE' THEN 'AMBULANCE'
        WHEN Vehicle1 = 'backh' THEN 'BACK HOE'
        WHEN Vehicle1 = 'comme' THEN 'COMMERCIAL'
        WHEN Vehicle1 = 'CONCRETE M' THEN 'CONCRETE MIXER'
        WHEN Vehicle1 = 'DIRTBIKE' THEN 'DIRT BIKE'
        ELSE Vehicle1
    END AS value
    FROM [ELT_staging_DB].dbo.Crashes
    WHERE Vehicle1 IS NOT NULL

    UNION
    SELECT CASE 
        WHEN Vehicle2 IN ('0', 'UKN', 'UNK', 'n/a', 'UNATTACHED') THEN 'UNKNOWN'
        WHEN Vehicle2 = '18 WEELER' THEN '18 WHEELER'
        WHEN Vehicle2 = 'AMBULENCE' THEN 'AMBULANCE'
        WHEN Vehicle2 = 'backh' THEN 'BACK HOE'
        WHEN Vehicle2 = 'comme' THEN 'COMMERCIAL'
        WHEN Vehicle2 = 'CONCRETE M' THEN 'CONCRETE MIXER'
        WHEN Vehicle2 = 'DIRTBIKE' THEN 'DIRT BIKE'
        ELSE Vehicle2
    END
    FROM [ELT_staging_DB].dbo.Crashes
    WHERE Vehicle2 IS NOT NULL

    UNION
    SELECT CASE 
        WHEN Vehicle3 IN ('0', 'UKN', 'UNK', 'n/a', 'UNATTACHED') THEN 'UNKNOWN'
        WHEN Vehicle3 = '18 WEELER' THEN '18 WHEELER'
        WHEN Vehicle3 = 'AMBULENCE' THEN 'AMBULANCE'
        WHEN Vehicle3 = 'backh' THEN 'BACK HOE'
        WHEN Vehicle3 = 'comme' THEN 'COMMERCIAL'
        WHEN Vehicle3 = 'CONCRETE M' THEN 'CONCRETE MIXER'
        WHEN Vehicle3 = 'DIRTBIKE' THEN 'DIRT BIKE'
        ELSE Vehicle3
    END
    FROM [ELT_staging_DB].dbo.Crashes
    WHERE Vehicle3 IS NOT NULL

    UNION
    SELECT CASE 
        WHEN Vehicle4 IN ('0', 'UKN', 'UNK', 'n/a', 'UNATTACHED') THEN 'UNKNOWN'
        WHEN Vehicle4 = '18 WEELER' THEN '18 WHEELER'
        WHEN Vehicle4 = 'AMBULENCE' THEN 'AMBULANCE'
        WHEN Vehicle4 = 'backh' THEN 'BACK HOE'
        WHEN Vehicle4 = 'comme' THEN 'COMMERCIAL'
        WHEN Vehicle4 = 'CONCRETE M' THEN 'CONCRETE MIXER'
        WHEN Vehicle4 = 'DIRTBIKE' THEN 'DIRT BIKE'
        ELSE Vehicle4
    END
    FROM [ELT_staging_DB].dbo.Crashes
    WHERE Vehicle4 IS NOT NULL

    UNION
    SELECT CASE 
        WHEN Vehicle5 IN ('0', 'UKN', 'UNK', 'n/a', 'UNATTACHED') THEN 'UNKNOWN'
        WHEN Vehicle5 = '18 WEELER' THEN '18 WHEELER'
        WHEN Vehicle5 = 'AMBULENCE' THEN 'AMBULANCE'
        WHEN Vehicle5 = 'backh' THEN 'BACK HOE'
        WHEN Vehicle5 = 'comme' THEN 'COMMERCIAL'
        WHEN Vehicle5 = 'CONCRETE M' THEN 'CONCRETE MIXER'
        WHEN Vehicle5 = 'DIRTBIKE' THEN 'DIRT BIKE'
        ELSE Vehicle5
    END
    FROM [ELT_staging_DB].dbo.Crashes
    WHERE Vehicle5 IS NOT NULL

) AS AllVehicles;

select count(*) as rowsNumber from VehicleTypesDim
