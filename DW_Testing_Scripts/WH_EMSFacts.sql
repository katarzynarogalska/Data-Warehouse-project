-- schema test
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'EMSFacts';

-- 2 missing values test
select count(*) as missingVals from EMSFacts 
where EMS_ID is null or IncidentDateKey is null or IncidentTimeKey is null or ActivationDateKey is null or ActivationTimeKey is null or OnSceneDateKey is null or OnSceneTimeKey is null or ToHospitalDateKey is null or
ToHospitalTimeKey is null or ClosingDateKey is null or ClosingTimeKey is null or ActivationDuration is null or OnSceneArrivalDuration is null or ToHospitalArrivalDuration is null or InterventionDuration is null
or BoroughKey is null

-- 3 Date dim connections
select count(*) as MissingIncidentDateConnection
from EMSFacts e
left join DateDim d on e.IncidentDateKey = d.DateKey
where d.FullDate is null;

select count(*) as MissingActivationDateConnection
from EMSFacts e
left join DateDim d on e.ActivationDateKey = d.DateKey
where d.FullDate is null;

select count(*) as MissingOnSceneDateConnection
from EMSFacts e
left join DateDim d on e.OnSceneDateKey = d.DateKey
where d.FullDate is null;

select count(*) as MissingToHospitalDateConnection
from EMSFacts e
left join DateDim d on e.ToHospitalDateKey = d.DateKey
where d.FullDate is null;

select count(*) as MissingClosingDateConnection
from EMSFacts e
left join DateDim d on e.ClosingDateKey = d.DateKey
where d.FullDate is null;

-- 3 Time dim connections
select count(*) as MissingIncidentTimeConnection
from EMSFacts e
left join TimeDim t on e.IncidentTimeKey = t.TimeKey
where t.TimeValue is null;

select count(*) as MissingActivationTimeConnection
from EMSFacts e
left join TimeDim t on e.ActivationTimeKey = t.TimeKey
where t.TimeValue is null;

select count(*) as MissingOnSceneTimeConnection
from EMSFacts e
left join TimeDim t on e.OnSceneTimeKey = t.TimeKey
where t.TimeValue is null;

select count(*) as MissingToHospitalTimeConnection
from EMSFacts e
left join TimeDim t on e.ToHospitalTimeKey = t.TimeKey
where t.TimeValue is null;

select count(*) as MissingClosingTimeConnection
from EMSFacts e
left join TimeDim t on e.ClosingTimeKey = t.TimeKey
where t.TimeValue is null;

-- Call types Dim Connection
select count(*) as MissingInitialCallTypeConnection
from EMSFacts e
left join CallTypesDim c on e.InitialCallTypeKey = c.CallType_ID
where c.CallTypeName is NULL or trim(c.CallTypeName)='';

select count(*) as MissingFinalCallTypeConnection
from EMSFacts e
left join CallTypesDim c on e.FinalCallTypeKey = c.CallType_ID
where c.CallTypeName is NULL or trim(c.CallTypeName)='';

-- corectness of mapping call types
select * from [ELT_staging_DB].dbo.EMS where EMS_ID = 200013590

select e.EMS_ID, e.InitialCallTypeKey, c.CallType_ID, c.CallTypeShort, c.CallTypeName  from EMSFacts e
left join CallTypesDim c on e.InitialCallTypeKey = c.CallType_ID
where e.EMS_ID = 200013590

select e.EMS_ID, e.FinalCallTypeKey, c.CallType_ID, c.CallTypeShort, c.CallTypeName  from EMSFacts e
left join CallTypesDim c on e.FinalCallTypeKey = c.CallType_ID
where e.EMS_ID = 200013590

-- Severity levels connection
select count(*) as MissingInitialSeverityConnection
from EMSFacts e
left join SeverityLevelsDim s on e.InitialSeverityLevelKey = s.SeverityLevel_ID
where s.SeverityLevel is null or trim(s.SeverityLevel)='';

select count(*) as MissingFinalSeverityConnection
from EMSFacts e
left join SeverityLevelsDim s on e.FinalSeverityLevelKey = s.SeverityLevel_ID
where s.SeverityLevel is null or trim(s.SeverityLevel)='';

-- severity level correctness of mapping
select count(*) as WronlyMapped from EMSFacts e
left join SeverityLevelsDim s on e.InitialSeverityLevelKey = s.SeverityLevel_ID
where e.InitialSeverityLevelKey = 1 and s.SeverityLevel!= 'Immediate Life Threat'

-- Boroug Dim connection
select count(*) as MissingBoroughConnection
from EMSFacts e 
left join DistrictDetailsDim d on e.BoroughKey = d.District_ID
where d.DistrictName is null or trim(d.DistrictName) =''

-- correctness of borough mapping
select EMS_ID, Borough from [ELT_staging_DB].dbo.EMS
where EMS_ID = 200013590

select e.EMS_ID, e.BoroughKey, d.DistrictName from EMSFacts e
left join DistrictDetailsDim d on e.BoroughKey = d.District_ID
where e.EMS_ID=200013590

-- foreign key constraints 
SELECT
    fk.name AS constraint_name,
    tp.name AS parent_table,
    cp.name AS parent_column,
    tr.name AS referenced_table,
    cr.name AS referenced_column
FROM 
    sys.foreign_keys AS fk
INNER JOIN 
    sys.foreign_key_columns AS fkc ON fk.object_id = fkc.constraint_object_id
INNER JOIN 
    sys.tables AS tp ON fkc.parent_object_id = tp.object_id
INNER JOIN 
    sys.columns AS cp ON fkc.parent_object_id = cp.object_id AND fkc.parent_column_id = cp.column_id
INNER JOIN 
    sys.tables AS tr ON fkc.referenced_object_id = tr.object_id
INNER JOIN 
    sys.columns AS cr ON fkc.referenced_object_id = cr.object_id AND fkc.referenced_column_id = cr.column_id
WHERE 
    tp.name = 'EMSFacts';