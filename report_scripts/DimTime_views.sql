CREATE VIEW vwTimeDim_Crash AS
SELECT
    TimeKey AS CrashTimeKey,
    TimeValue AS CrashTimeValue,
    Hour AS CrashHour,
    PartOfDay AS CrashPartOfDay
FROM TimeDim;
GO

CREATE VIEW vwTimeDim_OnScene AS
SELECT
    TimeKey AS OnSceneTimeKey,
    TimeValue AS OnSceneTimeValue,
    Hour AS OnSceneHour,
    PartOfDay AS OnScenePartOfDay
FROM TimeDim;
GO

CREATE VIEW vwTimeDim_ToHospital AS
SELECT
    TimeKey AS ToHospitalTimeKey,
    TimeValue AS ToHospitalTimeValue,
    Hour AS ToHospitalHour,
    PartOfDay AS ToHospitalPartOfDay
FROM TimeDim;
GO

CREATE VIEW vwTimeDim_Closing AS
SELECT
    TimeKey AS ClosingTimeKey,
    TimeValue AS ClosingTimeValue,
    Hour AS ClosingHour,
    PartOfDay AS ClosingPartOfDay
FROM TimeDim;
GO

CREATE VIEW vwTimeDim_Incident AS
SELECT
    TimeKey AS IncidentTimeKey,
    TimeValue AS IncidentTimeValue,
    Hour AS IncidentHour,
    PartOfDay AS IncidentPartOfDay
FROM TimeDim;
GO

CREATE VIEW vwTimeDim_Activation AS
SELECT
    TimeKey AS ActivationTimeKey,
    TimeValue AS ActivationTimeValue,
    Hour AS ActivationHour,
    PartOfDay AS ActivationPartOfDay
FROM TimeDim;
GO
