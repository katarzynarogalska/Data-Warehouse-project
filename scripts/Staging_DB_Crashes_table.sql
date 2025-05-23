
CREATE TABLE [dbo].[Crashes](
	[Crash_ID] [int] identity(1,1) primary key,
	[CrashDate] [date] NOT NULL,
	[CrashTime] [time](7) NOT NULL,
	[Borough] [nvarchar](50) NOT NULL,
	[StreetName] [nvarchar](100) NOT NULL,
	[PeopleInjured] [int] NOT NULL,
	[PeopleKilled] [int] NOT NULL,
	[PedestriansInjured] [int] NOT NULL,
	[PedestriansKilled] [int] NOT NULL,
	[CyclistsInjured] [int] NOT NULL,
	[CyclistsKilled] [int] NOT NULL,
	[MotoristInjured] [int] NOT NULL,
	[MotoristsKilled] [int] NOT NULL,
	[Factor1] [nvarchar](250) NULL,
	[Factor2] [nvarchar](250) NULL,
	[Factor3] [nvarchar](250) NULL,
	[Factor4] [nvarchar](250) NULL,
	[Factor5] [nvarchar](250) NULL,
	[Vehicle1] [nvarchar](100) NULL,
	[Vehicle2] [nvarchar](100) NULL,
	[Vehicle3] [nvarchar](100) NULL,
	[Vehicle4] [nvarchar](100) NULL,
	[Vehicle5] [nvarchar](100) NULL
) ON [PRIMARY]
GO


