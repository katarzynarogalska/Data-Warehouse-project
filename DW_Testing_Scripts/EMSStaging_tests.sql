

--1 Null values in dates 
select count(*) as NullDates from EMS
where IncidentDateTime is null or FirstActivationDateTime is null or FirstOnSceneDateTime is null or FirstToHospitalDateTime is null or IncidentClosingDateTime is null

--2 Valid dates
select count(*) as InvalidDateRows from EMS
where FirstActivationDateTime<IncidentDateTime or FirstOnSceneDateTime<FirstActivationDateTime or FirstToHospitalDateTime<FirstOnSceneDateTime or IncidentClosingDateTime<FirstToHospitalDateTime

-- 3 Data types
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'EMS';

-- 4 Missing text values imputation
select count(*) as NullTextFields from EMS
where TRIM(InitialCallType) = '' or InitialCallType is null or FinalCallType is null or TRIM(FinalCallType)='' or Borough is null or TRIM(Borough) = ''

select count(*) as UnknownBorough from EMS 
where Borough = 'UNKNOW' 

select count(*) as UnknownInitialCallTypes from EMS 
where InitialCallType = 'UNKNOW' 

-- 5 Missing int values imputation
select count(*) as NullSeverityLevel from EMS
where InitialSeverityLevel is null or FinalSeverityLevel is null

-- 6 Calculated durations
select count(*) as WronglyCalculatedDurations from EMS
WHERE ABS(ActivationDuration - (DATEDIFF(SECOND, IncidentDateTime, FirstActivationDateTime) * 1.0 / 60)) > 0.01 or
ABS(OnSceneArrivalDuration - (DATEDIFF(SECOND, FirstActivationDateTime, FirstOnSceneDateTime) * 1.0 / 60)) > 0.01 or
ABS(ToHospitalArrivalDuration - (DATEDIFF(SECOND, FirstOnSceneDateTime, FirstToHospitalDateTime) * 1.0 / 60)) > 0.01 or 
ABS(InterventionDuration - (DATEDIFF(SECOND, IncidentDateTime, IncidentClosingDateTime) * 1.0 / 60)) > 0.01




