
--1 schema
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'CallTypesDim';

-- primary key check 
SELECT 
    k.column_name
FROM 
    information_schema.table_constraints t
JOIN 
    information_schema.key_column_usage k 
  ON t.constraint_name = k.constraint_name
     AND t.table_name = k.table_name
WHERE 
    t.constraint_type = 'PRIMARY KEY'
    AND t.table_name = 'CallTypesDim';

--2 No missing values but 'UNKNOWN' row
select count(*) as NullValues from CallTypesDim
where CallType_ID is null or CallTypeShort is null or trim(CallTypeShort)='' or CallTypeName is null or trim(CallTypeName)=''

select * from CallTypesDim
where CallTypeShort = 'UNKNOWN'

--3 all values loaded 
select count(*) as RowsCount from CallTypesDim