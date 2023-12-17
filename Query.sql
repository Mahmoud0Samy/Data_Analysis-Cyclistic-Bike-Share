-- Created a table to import all the data to it.
CREATE TABLE Cyclitics_2023_1stQuarter(
	ride_id VARCHAR,
    rideable_type VARCHAR,
    started_at TIMESTAMP,
    ended_at TIMESTAMP,
    start_station_name VARCHAR,
    start_station_id VARCHAR,
    end_station_name VARCHAR,
    end_station_id VARCHAR,
    start_lat DOUBLE PRECISION,
    start_lng DOUBLE PRECISION,
    end_lat DOUBLE PRECISION,
    end_lng DOUBLE PRECISION,
    member_casual VARCHAR
);

-- Imported data using pgAdmin4 GUI.
SELECT * FROM Cyclitics_2023_1stQuarter
-- 639424 Rows.

-- DATA CLEANING & PREPARING--------------------

SELECT * FROM Cyclitics_2023_1stQuarter 
	WHERE ride_id IS NULL OR
    rideable_type IS NULL OR
    started_at IS NULL OR
    ended_at IS NULL OR
    start_station_name IS NULL OR
    start_station_id IS NULL OR
    end_station_name IS NULL OR
    end_station_id IS NULL OR
    start_lat IS NULL OR
    start_lng IS NULL OR
    end_lat IS NULL OR
    end_lng IS NULL OR
    member_casual IS NULL;
-- There are 141133 records with null values.

SELECT * FROM Cyclitics_2023_1stQuarter 
	WHERE ride_id IS NULL OR
    rideable_type IS NULL OR
    started_at IS NULL OR
    ended_at IS NULL OR
    member_casual IS NULL;
-- Null values in the location attributes account for all the null values.
-- I attempted to establish a new column (areas) to cluster nearby stations based on longitude and latitude.
-- Despite numerous attempts, the accuracy was never achieved, and certain records had null values for both longitude and latitude.

DELETE FROM Cyclitics_2023_1stQuarter 
	WHERE ride_id IS NULL OR
    rideable_type IS NULL OR
    started_at IS NULL OR
    ended_at IS NULL OR
    start_station_name IS NULL OR
    start_station_id IS NULL OR
    end_station_name IS NULL OR
    end_station_id IS NULL OR
    start_lat IS NULL OR
    start_lng IS NULL OR
    end_lat IS NULL OR
    end_lng IS NULL OR
    member_casual IS NULL;
-- 141133 rows deleted.

SELECT ride_id, started_at , ended_at FROM Cyclitics_2023_1stQuarter
	WHERE ended_at >= 2023-04-01
	ORDER BY started_at DESC;
--All the data are from the 2023 1st quarter time period

SELECT DISTINCT ride_id FROM Cyclitics_2023_1stQuarter;
--No dublicates in ride_id

-- DATA PROCESSING--------------------

-- Add a new column for weekday
ALTER TABLE Cyclitics_2023_1stQuarter
	ADD COLUMN weekday_name VARCHAR;

-- Update the new column with weekday information
UPDATE Cyclitics_2023_1stQuarter
	SET weekday_name =
	  CASE EXTRACT(DOW FROM started_at)
		WHEN 0 THEN 'Sunday'
		WHEN 1 THEN 'Monday'
		WHEN 2 THEN 'Tuesday'
		WHEN 3 THEN 'Wednesday'
		WHEN 4 THEN 'Thursday'
		WHEN 5 THEN 'Friday'
		WHEN 6 THEN 'Saturday'
	  END;
-- UPDATE 498291 rows

-- Now I will create a column called ride_length
ALTER TABLE Cyclitics_2023_1stQuarter
	ADD COLUMN ride_length INTERVAL;
	
-- Added data to the column by subtracting started_at and ended_at
UPDATE Cyclitics_2023_1stQuarter
	SET ride_length = ended_at - started_at;
-- UPDATE 498291 rows

-- Add a new column for seconds in a single ride
ALTER TABLE Cyclitics_2023_1stQuarter
	ADD COLUMN Ride_length_seconds INTEGER;

UPDATE Cyclitics_2023_1stQuarter
	SET Ride_length_seconds = EXTRACT(EPOCH FROM ride_length)
-- UPDATE 498291

SELECT * FROM Cyclitics_2023_1stQuarter 
	WHERE Ride_length_seconds <= 59
	ORDER BY ride_length;
-- I've observed instances where rides have a duration of 0 seconds, indicating that it may not be a genuine ride.
-- This could be attributed to either a potential bug or the ride being canceled almost immediately after initiation.

DELETE FROM Cyclitics_2023_1stQuarter 
	WHERE Ride_length_seconds <= 59;
-- DELETE 13421	

-- DATA ANALYSIS & FACT FINDING--------------------

SELECT station_name, COUNT(ride_id) AS ride_count FROM (
    SELECT start_station_name AS station_name, ride_id FROM Cyclitics_2023_1stQuarter
    UNION ALL
    SELECT end_station_name AS station_name, ride_id FROM Cyclitics_2023_1stQuarter) AS combined_stations
	GROUP BY station_name
	ORDER BY ride_count DESC;
-- Stations experiencing the highest activity include Ellis Ave & 60th St, University Ave & 57th St, and Clinton St & Washington Blvd.
-- Conversely, stations in close proximity to the Public Rack exhibit lower activity, potentially influenced by the sheer volume of stations in that area.

SELECT rideable_type, COUNT(ride_id) FROM Cyclitics_2023_1stQuarter
	GROUP BY rideable_type;
-- During the first quarter of 2023 classic_bike were used 286864 times, docked_bike were used 6777 times, and electric_bike were used 204650 times.
	
SELECT AVG(ride_length), AVG(Ride_length_seconds), weekday_name FROM Cyclitics_2023_1stQuarter
	GROUP BY weekday_name;
SELECT ROUND(AVG(Ride_length_seconds), 2), weekday_name FROM Cyclitics_2023_1stQuarter
	GROUP BY weekday_name;
-- The average ride duration peaks on Saturdays and Sundays compared to the rest of the days in the week.

SELECT COUNT(*), rideable_type, member_casual FROM Cyclitics_2023_1stQuarter
	GROUP BY rideable_type, member_casual;
SELECT COUNT(member_casual),rideable_type FROM Cyclitics_2023_1stQuarter 
	WHERE member_casual = 'member'
	GROUP BY rideable_type;
-- Members didn't use docked bikes during the selected time period.
	
SELECT EXTRACT(HOUR FROM started_at) AS hour, member_casual, weekday_name, COUNT(*) AS frequency FROM Cyclitics_2023_1stQuarter
	GROUP BY hour, member_casual, weekday_name
	ORDER BY hour, frequency DESC;
-- Hour 16 and 17 are when most rides start.

SELECT AVG(Ride_length_seconds) AS Ride_length_avg, member_casual, weekday_name FROM Cyclitics_2023_1stQuarter
	GROUP BY member_casual, weekday_name;
-- This indicates that casual members tend to have longer rides, while annual members engage in more frequent rides.