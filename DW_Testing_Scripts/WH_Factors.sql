SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'ContributingFactorsDim';

-- 2 missing values
select count(*) as MissingRows from ContributingFactorsDim
where FactorName is null or trim(FactorName)=''

-- 3 Unknown values
select * from ContributingFactorsDim
where FactorName='UNKNOWN'

-- 4 Row count
SELECT COUNT(DISTINCT value) AS UnikalnychWartosci
FROM (
    SELECT CASE WHEN Factor1 = 'Unspecified' THEN 'Unknown' ELSE Factor1 END AS value
    FROM [ELT_staging_DB].dbo.Crashes
    WHERE Factor1 IS NOT NULL

    UNION
    SELECT CASE WHEN Factor2 = 'Unspecified' THEN 'Unknown' ELSE Factor2 END
    FROM [ELT_staging_DB].dbo.Crashes
    WHERE Factor2 IS NOT NULL

    UNION
    SELECT CASE WHEN Factor3 = 'Unspecified' THEN 'Unknown' ELSE Factor3 END
    FROM [ELT_staging_DB].dbo.Crashes
    WHERE Factor3 IS NOT NULL

    UNION
    SELECT CASE WHEN Factor4 = 'Unspecified' THEN 'Unknown' ELSE Factor4 END
    FROM [ELT_staging_DB].dbo.Crashes
    WHERE Factor4 IS NOT NULL

    UNION
    SELECT CASE WHEN Factor5 = 'Unspecified' THEN 'Unknown' ELSE Factor5 END
    FROM [ELT_staging_DB].dbo.Crashes
    WHERE Factor5 IS NOT NULL
) AS AllFactors;


-- Liczba wierszy w TabelaA
SELECT COUNT(*) AS RowsCount FROM ContributingFactorsDim;