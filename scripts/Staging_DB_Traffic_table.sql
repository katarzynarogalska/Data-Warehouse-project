

CREATE TABLE [dbo].[Traffic](
	[Date] [date] NOT NULL,
	[Street] [nvarchar](100) NOT NULL,
	[TrafficVolume] [int] NOT NULL,
	[ampm] [nvarchar](2) NOT NULL,
	[Hour] [nvarchar](20) NOT NULL,
	[StartTime] [time](7) NOT NULL
) ON [PRIMARY]



