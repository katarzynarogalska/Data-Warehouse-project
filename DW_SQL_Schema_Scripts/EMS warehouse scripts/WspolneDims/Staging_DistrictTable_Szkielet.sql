CREATE TABLE [dbo].[StagingDistrictTable](
	[Distric_ID] [int] IDENTITY(1,1) PRIMARY KEY,
	[DistrictName] [nvarchar](50) NOT NULL,
	[AvgPopulation] [int] NOT NULL,
	[ShareOfTotalPopulation] [decimal](10, 2) NOT NULL,
	[TotalSNAPRecipients] [int] NOT NULL,
	[TotalCashAssistanceRecipients] [int] NOT NULL,
	[TotalMedicaidRecipients] [int] NOT NULL,
)
