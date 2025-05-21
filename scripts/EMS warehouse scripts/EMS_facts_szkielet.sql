
CREATE TABLE [dbo].[EMSFacts](
	[EMS_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[IncidentDateKey] [int] NOT NULL,
	[IncidentTimeKey] [int] NOT NULL,
	[ActivationDateKey] [int] NOT NULL,
	[ActivationTimeKey] [int] NOT NULL,
	[OnSceneDateKey] [int] NOT NULL,
	[OnSceneTimeKey] [int] NOT NULL,
	[ToHospitalDateKey] [int] NOT NULL,
	[ToHospitalTimeKey] [int] NOT NULL,
	[ClosingDateKey] [int] NOT NULL,
	[ClosingTimeKey] [int] NOT NULL,
	[ActivationDuration] [decimal](10, 2) NOT NULL,
	[OnSceneArrivalDuration] [decimal](10, 2) NOT NULL,
	[ToHospitalArrivalDuration] [decimal](10, 2) NOT NULL,
	[InterventionDuration] [decimal](10, 2) NOT NULL,
	[InitialCallTypeKey] [int] NOT NULL,
	[FinalCallTypeKey] [int] NOT NULL,
	[InitialSeverityLevelKey] [int] NOT NULL,
	[FinalSeverityLevelKey] [int] NOT NULL,
	[BoroughKey] [int] NOT NULL,
 CONSTRAINT [PK__EMSFacts__8C157F40AB0AEA44] PRIMARY KEY CLUSTERED 
(
	[EMS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[EMSFacts]  WITH CHECK ADD  CONSTRAINT [district_fk] FOREIGN KEY([BoroughKey])
REFERENCES [dbo].[DistrictDetailsDim] ([Distric_ID])
GO

ALTER TABLE [dbo].[EMSFacts] CHECK CONSTRAINT [district_fk]
GO

ALTER TABLE [dbo].[EMSFacts]  WITH CHECK ADD  CONSTRAINT [FK__EMSFacts__Activa__35BCFE0A] FOREIGN KEY([ActivationDateKey])
REFERENCES [dbo].[DateDim] ([DateKey])
GO

ALTER TABLE [dbo].[EMSFacts] CHECK CONSTRAINT [FK__EMSFacts__Activa__35BCFE0A]
GO

ALTER TABLE [dbo].[EMSFacts]  WITH CHECK ADD  CONSTRAINT [FK__EMSFacts__Activa__3A81B327] FOREIGN KEY([ActivationTimeKey])
REFERENCES [dbo].[TimeDim] ([TimeKey])
GO

ALTER TABLE [dbo].[EMSFacts] CHECK CONSTRAINT [FK__EMSFacts__Activa__3A81B327]
GO

ALTER TABLE [dbo].[EMSFacts]  WITH CHECK ADD  CONSTRAINT [FK__EMSFacts__Closin__38996AB5] FOREIGN KEY([ClosingDateKey])
REFERENCES [dbo].[DateDim] ([DateKey])
GO

ALTER TABLE [dbo].[EMSFacts] CHECK CONSTRAINT [FK__EMSFacts__Closin__38996AB5]
GO

ALTER TABLE [dbo].[EMSFacts]  WITH CHECK ADD  CONSTRAINT [FK__EMSFacts__Closin__3D5E1FD2] FOREIGN KEY([ClosingTimeKey])
REFERENCES [dbo].[TimeDim] ([TimeKey])
GO

ALTER TABLE [dbo].[EMSFacts] CHECK CONSTRAINT [FK__EMSFacts__Closin__3D5E1FD2]
GO

ALTER TABLE [dbo].[EMSFacts]  WITH CHECK ADD  CONSTRAINT [FK__EMSFacts__Incide__34C8D9D1] FOREIGN KEY([IncidentDateKey])
REFERENCES [dbo].[DateDim] ([DateKey])
GO

ALTER TABLE [dbo].[EMSFacts] CHECK CONSTRAINT [FK__EMSFacts__Incide__34C8D9D1]
GO

ALTER TABLE [dbo].[EMSFacts]  WITH CHECK ADD  CONSTRAINT [FK__EMSFacts__Incide__398D8EEE] FOREIGN KEY([IncidentTimeKey])
REFERENCES [dbo].[TimeDim] ([TimeKey])
GO

ALTER TABLE [dbo].[EMSFacts] CHECK CONSTRAINT [FK__EMSFacts__Incide__398D8EEE]
GO

ALTER TABLE [dbo].[EMSFacts]  WITH CHECK ADD  CONSTRAINT [FK__EMSFacts__OnScen__36B12243] FOREIGN KEY([OnSceneDateKey])
REFERENCES [dbo].[DateDim] ([DateKey])
GO

ALTER TABLE [dbo].[EMSFacts] CHECK CONSTRAINT [FK__EMSFacts__OnScen__36B12243]
GO

ALTER TABLE [dbo].[EMSFacts]  WITH CHECK ADD  CONSTRAINT [FK__EMSFacts__OnScen__3B75D760] FOREIGN KEY([OnSceneTimeKey])
REFERENCES [dbo].[TimeDim] ([TimeKey])
GO

ALTER TABLE [dbo].[EMSFacts] CHECK CONSTRAINT [FK__EMSFacts__OnScen__3B75D760]
GO

ALTER TABLE [dbo].[EMSFacts]  WITH CHECK ADD  CONSTRAINT [FK__EMSFacts__ToHosp__37A5467C] FOREIGN KEY([ToHospitalDateKey])
REFERENCES [dbo].[DateDim] ([DateKey])
GO

ALTER TABLE [dbo].[EMSFacts] CHECK CONSTRAINT [FK__EMSFacts__ToHosp__37A5467C]
GO

ALTER TABLE [dbo].[EMSFacts]  WITH CHECK ADD  CONSTRAINT [FK__EMSFacts__ToHosp__3C69FB99] FOREIGN KEY([ToHospitalTimeKey])
REFERENCES [dbo].[TimeDim] ([TimeKey])
GO

ALTER TABLE [dbo].[EMSFacts] CHECK CONSTRAINT [FK__EMSFacts__ToHosp__3C69FB99]
GO

ALTER TABLE [dbo].[EMSFacts]  WITH CHECK ADD  CONSTRAINT [fk_callTypes] FOREIGN KEY([InitialCallTypeKey])
REFERENCES [dbo].[CallTypesDim] ([CallType_ID])
GO

ALTER TABLE [dbo].[EMSFacts] CHECK CONSTRAINT [fk_callTypes]
GO

ALTER TABLE [dbo].[EMSFacts]  WITH CHECK ADD  CONSTRAINT [fk_callTypes2] FOREIGN KEY([FinalCallTypeKey])
REFERENCES [dbo].[CallTypesDim] ([CallType_ID])
GO

ALTER TABLE [dbo].[EMSFacts] CHECK CONSTRAINT [fk_callTypes2]
GO

ALTER TABLE [dbo].[EMSFacts]  WITH CHECK ADD  CONSTRAINT [fk_severityLevel] FOREIGN KEY([InitialSeverityLevelKey])
REFERENCES [dbo].[SeverityLevelsDim] ([SeverityLevel_ID])
GO

ALTER TABLE [dbo].[EMSFacts] CHECK CONSTRAINT [fk_severityLevel]
GO

ALTER TABLE [dbo].[EMSFacts]  WITH CHECK ADD  CONSTRAINT [fk_severityLevel2] FOREIGN KEY([FinalSeverityLevelKey])
REFERENCES [dbo].[SeverityLevelsDim] ([SeverityLevel_ID])
GO

ALTER TABLE [dbo].[EMSFacts] CHECK CONSTRAINT [fk_severityLevel2]
GO


