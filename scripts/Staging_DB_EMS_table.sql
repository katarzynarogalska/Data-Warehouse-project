
CREATE TABLE [dbo].[EMS](
	[IncidentDateTime] [datetime] NOT NULL,
	[InitialCallType] [nvarchar](50) NOT NULL,
	[InitialSeverityLevel] [int] NOT NULL,
	[FinalCallType] [nvarchar](50) NOT NULL,
	[FinalSeverityLevel] [int] NOT NULL,
	[FirstActivationDateTime] [datetime] NOT NULL,
	[FirstOnSceneDateTime] [datetime] NOT NULL,
	[FirstToHospitalDateTime] [datetime] NOT NULL,
	[IncidentClosingDateTime] [datetime] NOT NULL,
	[Borough] [nvarchar](50) NOT NULL,
	[ActivationDuration] [decimal](10, 2) NOT NULL,
	[OnSceneArrivalDuration] [decimal](10, 2) NOT NULL,
	[ToHospitalArrivalDuration] [decimal](10, 2) NOT NULL,
	[InterventionDuration] [decimal](10, 2) NOT NULL
) ON [PRIMARY]
GO


