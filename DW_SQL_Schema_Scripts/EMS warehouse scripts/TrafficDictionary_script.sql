CREATE TABLE TrafficDim(
	Traffic_ID INT IDENTITY(1,1) PRIMARY KEY,
	LowerBound INT NOT NULL,
	UpperBound INT NOT NULL,
	TrafficCategory NVARCHAR(25) NOT NULL
	)

INSERT INTO TrafficDim(LowerBound, UpperBound, TrafficCategory)
VALUES
(0, 500, 'Very Low'),
(500, 1000, 'Low'),
(1000, 1500, 'Moderate'),
(1500, 2000, 'Moderetely High'),
(2000, 2500, 'High'),
(2500, 99999999, 'Very High')