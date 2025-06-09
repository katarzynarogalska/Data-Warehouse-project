
CREATE TABLE CrashFactorBridge(
    Bridge_ID INT IDENTITY(1,1) PRIMARY KEY,
    Crash_ID INT NOT NULL,
    Factor_ID INT NOT NULL
);

CREATE TABLE CrashVehicleBridge(
	Bridge_ID INT IDENTITY(1,1) primary key,
	Crash_ID int not null,
	Vehicle_ID int not null
);

alter table CrashFactorBridge
add constraint fk_factors
foreign key (Factor_ID) references ContributingFactorsDim(Factor_ID);

alter table CrashFactorBridge
add constraint fk_crashes
foreign key (Crash_ID) references CrashFacts(Crash_ID);


alter table CrashVehicleBridge
add constraint fk_vehicles
foreign key (Vehicle_ID) references VehicleTypesDim(Vehicle_ID);

alter table CrashVehicleBridge
add constraint fk_fact_table
foreign key (Crash_ID) references CrashFacts(Crash_ID);
