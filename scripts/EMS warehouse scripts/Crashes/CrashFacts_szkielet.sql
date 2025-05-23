

CREATE TABLE [dbo].[CrashFacts](
	[Crash_ID] [int] primary key,
	[CrashDateKey] [int] NOT NULL,
	[CrashTimeKey] [int] NOT NULL,
	[BoroughKey] [int] NOT NULL,
	[StreetName] [nvarchar](100) NOT NULL,
	[PeopleInjured] [int] NOT NULL,
	[PeopleKilled] [int] NOT NULL,
	[PedestriansInjured] [int] NOT NULL,
	[PedestriansKilled] [int] NOT NULL,
	[CyclistsInjured] [int] NOT NULL,
	[CyclistsKilled] [int] NOT NULL,
	[MotoristInjured] [int] NOT NULL,
	[MotoristsKilled] [int] NOT NULL,
)

alter table CrashFacts
add constraint fk_date
foreign key (CrashDateKey) references DateDim(DateKey);

alter table CrashFacts
add constraint fk_time
foreign key (CrashTimeKey) references TimeDim(TimeKey);

alter table CrashFacts
add constraint fk_district
foreign key (BoroughKey) references DistrictDetailsDim(Distric_ID);






