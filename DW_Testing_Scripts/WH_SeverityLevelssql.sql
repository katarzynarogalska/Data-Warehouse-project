-- 1 row count check
select count(*) from SeverityLevelsDim

-- 2 all values check
select * from SeverityLevelsDim

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
    AND t.table_name = 'SeverityLevelsDim';