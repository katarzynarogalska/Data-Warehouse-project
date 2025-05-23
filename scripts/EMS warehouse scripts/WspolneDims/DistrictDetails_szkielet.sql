
CREATE TABLE [dbo].[DistrictDetailsDim](
	[Distric_ID] [int] IDENTITY(1,1) NOT NULL,
	[DistrictName] [nvarchar](50) NOT NULL,
	[AvgPopulation] [int] NOT NULL,
	[ShareOfTotalPopulation] [decimal](10, 2) NOT NULL,
	[TotalSNAPRecipients] [int] NOT NULL,
	[TotalCashAssistanceRecipients] [int] NOT NULL,
	[TotalMedicaidRecipients] [int] NOT NULL,
	[ValidFrom] date NOT NULL,
	[ValidTo] date NULL,
	[IsValid] bit NOT NULL,
 CONSTRAINT [PK__District__E1C9A8CD2A33858A] PRIMARY KEY CLUSTERED 
(
	[Distric_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE DistrictDetailsDim 
ADD CONSTRAINT DF_StartDate DEFAULT (GETDATE()) FOR ValidFrom;

ALTER TABLE DistrictDetailsDim 
ADD CONSTRAINT DF_EndDate DEFAULT (NULL) FOR ValidTo;

ALTER TABLE DistrictDetailsDim 
ADD CONSTRAINT DF_Valid DEFAULT (1) FOR IsValid;




