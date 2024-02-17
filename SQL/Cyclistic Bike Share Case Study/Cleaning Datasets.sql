
--------------------------------------------------------------------------------------------------------
---------- CLEANING EACH DATASET (OGDivvy_Trips_2019_Q2, OGDivvy_Trips_2019_Q3, OGDivvy_Trips_2019_Q4, 
---------- OGDivvy_Trips_2020_Q1) PRIOR TO ITS MERGING TO FORM ONE BIG DATA SET (OGDivvy_Trips_4sets_v2)
--------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------
---------- RENAMING COLUMNS (OGDivvy_Trips_2019_Q2)
--------------------------------------------------------------------------------------------------------
sp_RENAME 'dbo.OGDivvy_Trips_2019_Q2._01_Rental_Details_Rental_ID', 'ride_id', 'COLUMN'
GO
sp_RENAME 'dbo.OGDivvy_Trips_2019_Q2._01_Rental_Details_Local_Start_Time', 'started_at', 'COLUMN' 
GO
sp_RENAME 'dbo.OGDivvy_Trips_2019_Q2._01_Rental_Details_Local_End_Time', 'ended_at', 'COLUMN' 
GO
sp_RENAME 'dbo.OGDivvy_Trips_2019_Q2._01_Rental_Details_Bike_ID', 'rideable_type', 'COLUMN' 
GO
sp_RENAME 'dbo.OGDivvy_Trips_2019_Q2._03_Rental_Start_Station_ID', 'start_station_id', 'COLUMN' 
GO
sp_RENAME 'dbo.OGDivvy_Trips_2019_Q2._03_Rental_Start_Station_Name', 'start_station_name', 'COLUMN' 
GO
sp_RENAME 'dbo.OGDivvy_Trips_2019_Q2._02_Rental_End_Station_ID', 'end_station_id', 'COLUMN' 
GO
sp_RENAME 'dbo.OGDivvy_Trips_2019_Q2._02_Rental_End_Station_Name', 'end_station_name', 'COLUMN' 
GO
sp_RENAME 'dbo.OGDivvy_Trips_2019_Q2.User_Type', 'member_casual', 'COLUMN' 
GO

--------------------------------------------------------------------------------------------------------
---------- CONVERTING DATA TYPES 
--------------------------------------------------------------------------------------------------------
ALTER TABLE 
	OGDivvy_Trips_2019_Q2
ALTER COLUMN 
	ride_id nvarchar(50) NOT NULL
GO

ALTER TABLE 
	OGDivvy_Trips_2019_Q2
ALTER COLUMN 
	rideable_type nvarchar(50) NOT NULL
GO

--------------------------------------------------------------------------------------------------------
--------- DELETING COLUMNS NO LONGER NEEDED IN THE ANALYSIS
--------------------------------------------------------------------------------------------------------
ALTER TABLE 
	OGDivvy_Trips_2019_Q2
DROP COLUMN 
	[_01_Rental_Details_Duration_In_Seconds_Uncapped]
	,[Member_Gender]
	,[_05_Member_Details_Member_Birthday_Year]
GO

--------------------------------------------------------------------------------------------------------
--------- REPLACING VALUE IN member_casual column from "Subscriber" to "member", 
--------- and from "Customer" to "casual"
--------------------------------------------------------------------------------------------------------
UPDATE OGDivvy_Trips_2019_Q2
SET member_casual = 'member'
WHERE member_casual = 'Subscriber'
GO

UPDATE OGDivvy_Trips_2019_Q2
SET member_casual = 'casual'
WHERE member_casual = 'Customer'
GO

--------------------------------------------------------------------------------------------------------
---------- DELETING & REMOVING BAD DATA (start_station_name = "HQ QR")
--------------------------------------------------------------------------------------------------------
DELETE FROM OGDivvy_Trips_2019_Q2
WHERE 
	start_station_name = 'HQ QR' OR
	DATEDIFF(SECOND, started_at, ended_at) <= 0
GO

--------------------------------------------------------------------------------------------------------
---------- RENAMING COLUMNS (Divvy_Trips_2019_Q3)
--------------------------------------------------------------------------------------------------------
sp_RENAME 'OGDivvy_Trips_2019_Q3.trip_id', 'ride_id', 'COLUMN' 
GO
sp_RENAME 'OGDivvy_Trips_2019_Q3.bikeid', 'rideable_type', 'COLUMN' 
GO
sp_RENAME 'OGDivvy_Trips_2019_Q3.start_time', 'started_at', 'COLUMN' 
GO
sp_RENAME 'OGDivvy_Trips_2019_Q3.end_time', 'ended_at', 'COLUMN' 
GO
sp_RENAME 'OGDivvy_Trips_2019_Q3.from_station_name', 'start_station_name', 'COLUMN' 
GO
sp_RENAME 'OGDivvy_Trips_2019_Q3.from_station_id', 'start_station_id', 'COLUMN' 
GO
sp_RENAME 'OGDivvy_Trips_2019_Q3.to_station_name', 'end_station_name', 'COLUMN' 
GO
sp_RENAME 'OGDivvy_Trips_2019_Q3.to_station_id', 'end_station_id', 'COLUMN' 
GO
sp_RENAME 'OGDivvy_Trips_2019_Q3.usertype', 'member_casual', 'COLUMN' 
GO

--------------------------------------------------------------------------------------------------------
---------- CONVERTING DATA TYPES 
--------------------------------------------------------------------------------------------------------
ALTER TABLE 
	OGDivvy_Trips_2019_Q3
ALTER COLUMN 
	ride_id nvarchar(50) NOT NULL
GO

ALTER TABLE 
	OGDivvy_Trips_2019_Q3
ALTER COLUMN 
	rideable_type nvarchar(50) NOT NULL
GO

--------------------------------------------------------------------------------------------------------
--------- DELETING COLUMNS NO LONGER NEEDED IN THE ANALYSIS
--------------------------------------------------------------------------------------------------------
ALTER TABLE 
	OGDivvy_Trips_2019_Q3
DROP COLUMN 
	tripduration, gender, birthyear
GO

--------------------------------------------------------------------------------------------------------
--------- REPLACING VALUE IN member_casual column from "Subscriber" to "member", 
--------- and from "Customer" to "casual"
--------------------------------------------------------------------------------------------------------
UPDATE OGDivvy_Trips_2019_Q3
SET member_casual = 'member'
WHERE member_casual = 'Subscriber'
GO

UPDATE OGDivvy_Trips_2019_Q3
SET member_casual = 'casual'
WHERE member_casual = 'Customer'
GO

--------------------------------------------------------------------------------------------------------
---------- DELETING & REMOVING BAD DATA (start_station_name = "HQ QR")
--------------------------------------------------------------------------------------------------------
DELETE FROM OGDivvy_Trips_2019_Q3
WHERE 
	start_station_name = 'HQ QR' OR
	DATEDIFF(SECOND, started_at, ended_at) <= 0
GO

--------------------------------------------------------------------------------------------------------
---------- RENAMING COLUMNS (OGDivvy_Trips_2019_Q4)
--------------------------------------------------------------------------------------------------------
sp_RENAME 'OGDivvy_Trips_2019_Q4.trip_id', 'ride_id', 'COLUMN' 
GO
sp_RENAME 'OGDivvy_Trips_2019_Q4.bikeid', 'rideable_type', 'COLUMN' 
GO
sp_RENAME 'OGDivvy_Trips_2019_Q4.start_time', 'started_at', 'COLUMN' 
GO
sp_RENAME 'OGDivvy_Trips_2019_Q4.end_time', 'ended_at', 'COLUMN' 
GO
sp_RENAME 'OGDivvy_Trips_2019_Q4.from_station_name', 'start_station_name', 'COLUMN' 
GO
sp_RENAME 'OGDivvy_Trips_2019_Q4.from_station_id', 'start_station_id', 'COLUMN' 
GO
sp_RENAME 'OGDivvy_Trips_2019_Q4.to_station_name', 'end_station_name', 'COLUMN' 
GO
sp_RENAME 'OGDivvy_Trips_2019_Q4.to_station_id', 'end_station_id', 'COLUMN' 
GO
sp_RENAME 'OGDivvy_Trips_2019_Q4.usertype', 'member_casual', 'COLUMN' 
GO

--------------------------------------------------------------------------------------------------------
---------- CONVERTING DATA TYPES 
--------------------------------------------------------------------------------------------------------
ALTER TABLE 
	OGDivvy_Trips_2019_Q4
ALTER COLUMN 
	ride_id nvarchar(50) NOT NULL
GO

ALTER TABLE 
	OGDivvy_Trips_2019_Q4
ALTER COLUMN 
	rideable_type nvarchar(50) NOT NULL
GO

--------------------------------------------------------------------------------------------------------
--------- DELETING COLUMNS NO LONGER NEEDED IN THE ANALYSIS
--------------------------------------------------------------------------------------------------------
ALTER TABLE 
	OGDivvy_Trips_2019_Q4
DROP COLUMN 
	tripduration, gender, birthyear
GO

--------------------------------------------------------------------------------------------------------
--------- REPLACING VALUE in member_casual column from "Subscriber" to "member", 
--------- and from "Customer" to "casual"
--------------------------------------------------------------------------------------------------------
UPDATE OGDivvy_Trips_2019_Q4
SET member_casual = 'member'
WHERE member_casual = 'Subscriber'
GO

UPDATE OGDivvy_Trips_2019_Q4
SET member_casual = 'casual'
WHERE member_casual = 'Customer'
GO

--------------------------------------------------------------------------------------------------------
---------- DELETING & REMOVING BAD DATA (start_station_name = "HQ QR")
--------------------------------------------------------------------------------------------------------
DELETE FROM OGDivvy_Trips_2019_Q4
WHERE 
	start_station_name = 'HQ QR' OR
	DATEDIFF(SECOND, started_at, ended_at) <= 0
GO

--------------------------------------------------------------------------------------------------------
--------- DELETING COLUMNS NO LONGER NEEDED IN THE ANALYSIS (OGDivvy_Trips_2020_Q1)
--------------------------------------------------------------------------------------------------------
ALTER TABLE 
	OGDivvy_Trips_2020_Q1
DROP COLUMN 
	start_lat, start_lng, end_lat, end_lng
GO

--------------------------------------------------------------------------------------------------------
---------- DELETING & REMOVING BAD DATA (start_station_name = "HQ QR")
--------------------------------------------------------------------------------------------------------
DELETE FROM OGDivvy_Trips_2020_Q1
WHERE 
	start_station_name = 'HQ QR' OR
	DATEDIFF(SECOND, started_at, ended_at) <= 0
GO
