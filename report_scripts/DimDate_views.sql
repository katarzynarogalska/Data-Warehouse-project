CREATE VIEW vwDimDate_Crash AS
SELECT
    DateKey AS CrashDateKey,
    FullDate AS CrashFullDate,
    Year AS CrashYear,
    Month AS CrashMonth,
    Day AS CrashDay,
    MonthName AS CrashMonthName,
    WeekdayNumber AS CrashWeekdayNumber,
    WeekdayName AS CrashWeekdayName,
    IsWeekend AS CrashIsWeekend,
    SeasonName AS CrashSeasonName
FROM DateDim;
GO

CREATE VIEW vwDimDate_OnScene AS
SELECT
    DateKey AS OnSceneDateKey,
    FullDate AS OnSceneFullDate,
    Year AS OnSceneYear,
    Month AS OnSceneMonth,
    Day AS OnSceneDay,
    MonthName AS OnSceneMonthName,
    WeekdayNumber AS OnSceneWeekdayNumber,
    WeekdayName AS OnSceneWeekdayName,
    IsWeekend AS OnSceneIsWeekend,
    SeasonName AS OnSceneSeasonName
FROM DateDim;
GO

CREATE VIEW vwDimDate_ToHospital AS
SELECT
    DateKey AS ToHospitalDateKey,
    FullDate AS ToHospitalFullDate,
    Year AS ToHospitalYear,
    Month AS ToHospitalMonth,
    Day AS ToHospitalDay,
    MonthName AS ToHospitalMonthName,
    WeekdayNumber AS ToHospitalWeekdayNumber,
    WeekdayName AS ToHospitalWeekdayName,
    IsWeekend AS ToHospitalIsWeekend,
    SeasonName AS ToHospitalSeasonName
FROM DateDim;
GO

CREATE VIEW vwDimDate_Closing AS
SELECT
    DateKey AS ClosingDateKey,
    FullDate AS ClosingFullDate,
    Year AS ClosingYear,
    Month AS ClosingMonth,
    Day AS ClosingDay,
    MonthName AS ClosingMonthName,
    WeekdayNumber AS ClosingWeekdayNumber,
    WeekdayName AS ClosingWeekdayName,
    IsWeekend AS ClosingIsWeekend,
    SeasonName AS ClosingSeasonName
FROM DateDim;
GO

CREATE VIEW vwDimDate_Incident AS
SELECT
    DateKey AS IncidentDateKey,
    FullDate AS IncidentFullDate,
    Year AS IncidentYear,
    Month AS IncidentMonth,
    Day AS IncidentDay,
    MonthName AS IncidentMonthName,
    WeekdayNumber AS IncidentWeekdayNumber,
    WeekdayName AS IncidentWeekdayName,
    IsWeekend AS IncidentIsWeekend,
    SeasonName AS IncidentSeasonName
FROM DateDim;
GO

CREATE VIEW vwDimDate_Activation AS
SELECT
    DateKey AS ActivationDateKey,
    FullDate AS ActivationFullDate,
    Year AS ActivationYear,
    Month AS ActivationMonth,
    Day AS ActivationDay,
    MonthName AS ActivationMonthName,
    WeekdayNumber AS ActivationWeekdayNumber,
    WeekdayName AS ActivationWeekdayName,
    IsWeekend AS ActivationIsWeekend,
    SeasonName AS ActivationSeasonName
FROM DateDim;
GO
