-- 1 unique count of Borough values
select 
(select count(distinct Borough) from ELT_staging_DB.dbo.NYCPopulation) as Pop_Boroughs,
(select count(distinct Borough) from ELT_staging_DB.dbo.SocialHelp) as Social_Boroughs,
(select count(distinct DistrictName) from FinalWarehouse.dbo.DistrictDetailsDim) as Dim_Boroughs;

-- 2 schema
select * from DistrictDetailsDim;

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'DistrictDetailsDim';


-- 3 aggregated measures

WITH aggregated_help AS (
    SELECT 
        CASE 
            WHEN Borough = 'Staten_Island' THEN 'RICHMOND / STATEN ISLAND'
            ELSE Borough
        END AS Borough,
        AVG(TotalSNAPRecipients) AS avg_snap,
        AVG(TotalCashAssistanceRecipients) AS avg_cash,
        AVG(TotalMEDICAIDRecipients) AS avg_medicaid
    FROM ELT_staging_DB.dbo.SocialHelp
    GROUP BY 
        CASE 
            WHEN Borough = 'Staten_Island' THEN 'RICHMOND / STATEN ISLAND'
            ELSE Borough
        END
)
SELECT 
    d.DistrictName AS Borough,
    CASE 
        WHEN ABS(h.avg_snap - d.TotalSNAPRecipients) > 1 THEN 'YES'
        ELSE 'NO'
    END AS snap_diff,
    
    CASE 
        WHEN ABS(h.avg_cash - d.TotalCashAssistanceRecipients) > 1 THEN 'YES'
        ELSE 'NO'
    END AS cash_diff,
    
    CASE 
        WHEN ABS(h.avg_medicaid - d.TotalMEDICAIDRecipients) > 1 THEN 'YES'
        ELSE 'NO'
    END AS medicaid_diff
FROM aggregated_help h
JOIN FinalWarehouse.dbo.DistrictDetailsDim d 
    ON h.Borough = d.DistrictName;


-- 4 SCD 2 


select * from DistrictDetailsDim
select count(*) as OldFKEMS from EMSFacts where BoroughKey = 1
select count(*) as NewFKEMs from EMSFacts where BoroughKey = 6
select count(*) as OldFkCrashes from CrashFacts where BoroughKey =1
select count(*) as NewFkCrashes from CrashFacts where BoroughKey =6