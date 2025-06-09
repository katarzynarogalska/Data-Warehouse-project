-- 1 Null values
select count(*) as NullValues from SpeedLimits
where StreetName is null or trim(StreetName)='' or SpeedLimit is null or IsSigned is null or trim(IsSigned)=''

-- 2 data types
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'SpeedLimits';