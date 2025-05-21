CREATE TABLE SeverityLevelsDim(
	SeverityLevel_ID INT PRIMARY KEY,
	SeverityLevel NVARCHAR(50)
	)

-- manually fill values as found in documentation for each severity level
INSERT INTO SeverityLevelsDim (SeverityLevel_ID, SeverityLevel)
VALUES 
    (1, 'Immidiate Life Threat'),
    (2, 'Critical Condition'),
    (3, 'Severe Condition'),
	(4, 'Moderate Condition'),
	(5, 'Minor Condition'),
	(6, 'Non Urgent'),
	(7, 'Informational Call'),
	(8, 'Informational Call'),
	(9, 'Misuse'),
	(-1,'Unknown');