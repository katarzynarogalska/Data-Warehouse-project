select count(*) as RowsCount from SpeedLimitsDim
select count(distinct StreetName) as DistinctStreets from [ELT_staging_DB].dbo.Crashes

select count(*) oldFK from CrashFacts where StreetKey = 1
select count(*) NewFK from CrashFacts where StreetKey = 3379

select * from SpeedLimitsDim
where StreetName = 'AVENUE H'

