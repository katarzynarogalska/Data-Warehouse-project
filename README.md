# Data warehouse ETL and PowerBI raporting
NYC Accidents and EMS Dispatch data from 2020 analysis

## Project Overview

This project aims to develop a complete analytical solution for analyzing road accidents and emergency medical service (EMS) dispatches in New York City for the year 2020. It includes an end-to-end pipeline: data extraction, transformation, loading (ETL), a data warehouse, and a reporting layer built with Power BI.
##  Data Sources

- [Motor Vehicle Collisions - Crashes](https://data.cityofnewyork.us/Public-Safety/Motor-Vehicle-Collisions-Crashes/h9gi-nx95/)
- [EMS Incident Dispatch Data](https://data.cityofnewyork.us/Public-Safety/EMS-Incident-Dispatch-Data/76xm-jjuj/)
- [NYC Population by Borough (1950–2040)](https://data.cityofnewyork.us/City-Government/New-York-City-Population-by-Borough-1950-2040/)
- [Social Help Indicators](https://data.cityofnewyork.us/Social-Services/Borough-Community-District-Report/5awp-wfkt/)

## Solution Architecture

The architecture follows a **star and galaxy schema** data warehouse approach. The two main fact tables are:

- `CrashFacts` – records of traffic accidents,
- `EMSFacts` – records of emergency service dispatches.

These facts are connected to several dimension tables, including shared ones such as `DateDim`, `TimeDim`, `CallTypesDim`, `SeverityLevelsDim`, `SpeedLimitsDim`, `ContributingFactordDim`, `VehicleTypesDim` and `DistrictDetailsDim`

## ETL Process

The ETL process was implemented using **Microsoft SQL Server Integration Services (SSIS)**. Data from NYC Open Data (CSV format) is processed through:

- Loading into a staging database,
- Validation (removal of inconsistent/incomplete rows),
- Transformation (e.g., aggregation, handling nulls, slowly changing dimensions),
- Loading into the final data warehouse.

**Bridge tables** (e.g., `CrashVehicleBridge`) and **role-playing dimensions** (`DateDim`, `TimeDim`) are used where necessary as well as **SCD2** mechanizm for tacking changes in `DistrictDetailsDim` and `SpeedLimitsDim`

## Data Warehouse

The data warehouse was built in SQL Server. It includes:

- Fact Tables: `CrashFacts`, `EMSFacts`
- Dimension Tables: `SpeedLimits`, `DistrictDetails`, `CallTypes`, `SeverityLevels`, `ContributingFactors`, `VehicleTypes`, `DateDim`, `TimeDim`
- SCD Type 2 handling in `DistrictDetails` and `SpeedLimits`
- Bridge mechanisms for many-to-many relationships

## Reporting Layer

The reporting layer is implemented in **Power BI**, using DirectQuery to connect to the SQL Server data warehouse. Key features:

- KPI cards: total accidents, injuries, EMS interventions, fast response %
- Interactive maps, drill-down line charts, donut charts, decomposition trees
- Hierarchies for date and time dimensions
- Geo-analytics based on borough, ZIP code, and street name

### Report Pages Overview

1. **Overview** – KPIs, accident density map, borough comparison
2. **Crashes Analysis** – temporal and geographic analysis of crashes
3. **Crashes Contributing Factors** – parts of the day, vehicle types, contributing factors
4. **EMS Dispatch Analysis** – response time, call types, severity
5. **Dispatch Effectiveness** – benchmark analysis vs. 8-min standard
6. **Crashes vs EMS by Borough** – side-by-side comparisons



## Testing & Deployment

- ETL processes were tested using SSIS error redirection and validation rules.
- Multiple test via SQL queries to ensure the correctness of data loaded into WH.
- Duplicate prevention and SCD2-aware dimension linking implemented.
- Deployed to SQL Server and connected via Power BI with custom views and calculated measures.

## Authors

* [Katarzyna Rogalska](https://github.com/katarzynarogalska) - ETL, warehouse loading and testing
* [Zuzanna Sieńko](https://github.com/sienkozuzanna) - PowerBI layer with report design and testing

> 📦 This repository includes SQL scripts, SSIS packages, and a Power BI `.pbix` report file.
