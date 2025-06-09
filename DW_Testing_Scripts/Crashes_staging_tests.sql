--1 Null values in date or time
select count(*) as NullDateOrTime from Crashes
where CrashDate is null or CrashTime is null or year(CrashDate) !=2020

-- 2 Null values in metrics 
select count(*) as NullMetrics from Crashes 
where PeopleInjured is null or PeopleKilled is null or PedestriansInjured is null or PedestriansKilled is null
or CyclistsInjured is null or CyclistsKilled is null or MotoristInjured is null or MotoristsKilled is null

-- metrics logic
select count(*) as WrongMetrics from Crashes
where PeopleInjured <0 or PeopleKilled<0 or CyclistsInjured<0 or CyclistsKilled<0 or PedestriansInjured<0 or PedestriansKilled<0 or MotoristInjured<0 or MotoristsKilled<0

-- 3  Location tests
select count(*) as NullLocation from Crashes
where Latitude is null or Longitude is null or trim(Borough) ='' or Borough is null or trim(StreetName) = '' or StreetName is null

select count(*) as LocationNotInNYC
from Crashes where Latitude <40 or Latitude>41 or Longitude<-75 or Longitude>-73

-- 4 Data types 
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Crashes';

-- 5 Null values only if Vehicle + Factor are missing
select count(*) as NullFactors1 from Crashes
where (Factor1 is null or trim(Factor1) = '') and (Vehicle1 is not null and trim(Vehicle1) != '')
select count(*) as NullFactors2 from Crashes
where (Factor2 is null or trim(Factor2) = '') and (Vehicle2 is not null and trim(Vehicle2) != '')
select count(*) as NullFactors3 from Crashes
where (Factor3 is null or trim(Factor3) = '') and (Vehicle3 is not null and trim(Vehicle3) != '')
select count(*) as NullFactors4 from Crashes
where (Factor4 is null or trim(Factor4) = '') and (Vehicle4 is not null and trim(Vehicle4) != '')
select count(*) as NullFactors5 from Crashes
where (Factor5 is null or trim(Factor5) = '') and (Vehicle5 is not null and trim(Vehicle5) != '')

-- 6 Null changed to Unknown when Factor is missing and vehicle is not
select count(*) as ImputedFactor1Example from Crashes
where Factor1 = 'Unknown' and (Vehicle1 is null or trim(Vehicle1)='')

-- 7 New column - VehicleAmount
SELECT COUNT(*) AS IncorrectVehicleAmt
FROM Crashes
WHERE vehicleAmt != (
    (CASE WHEN Factor1 IS NOT NULL AND Vehicle1 IS NOT NULL THEN 1 ELSE 0 END) +
    (CASE WHEN Factor2 IS NOT NULL AND Vehicle2 IS NOT NULL THEN 1 ELSE 0 END) +
    (CASE WHEN Factor3 IS NOT NULL AND Vehicle3 IS NOT NULL THEN 1 ELSE 0 END) +
    (CASE WHEN Factor4 IS NOT NULL AND Vehicle4 IS NOT NULL THEN 1 ELSE 0 END) +
    (CASE WHEN Factor5 IS NOT NULL AND Vehicle5 IS NOT NULL THEN 1 ELSE 0 END)
);

