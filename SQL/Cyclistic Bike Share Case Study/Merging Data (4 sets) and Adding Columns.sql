
--------------------------------------------------------------------------------------------------------
---------- MERGING DATASETS (4 SETS) SAVE IT TO A ONE BIG DATASETS (OUTPUT: OGDivvy_Trips_4sets_v2)
--------------------------------------------------------------------------------------------------------

SELECT *
FROM
	(
	SELECT	
		ride_id
		,started_at
		,ended_at
		,rideable_type
		,start_station_id
		,start_station_name
		,end_station_id
		,end_station_name
		,member_casual
	FROM
		OGDivvy_Trips_2019_Q2
	UNION
	SELECT	
		ride_id
		,started_at
		,ended_at
		,rideable_type
		,start_station_id
		,start_station_name
		,end_station_id
		,end_station_name
		,member_casual	
	FROM	
		OGDivvy_Trips_2019_Q3
	UNION
	SELECT	
		ride_id
		,started_at
		,ended_at
		,rideable_type
		,start_station_id
		,start_station_name
		,end_station_id
		,end_station_name
		,member_casual
	FROM
		OGDivvy_Trips_2019_Q4
	UNION
	SELECT	
		ride_id
		,started_at
		,ended_at
		,rideable_type
		,start_station_id
		,start_station_name
		,end_station_id
		,end_station_name
		,member_casual	
	FROM	
		OGDivvy_Trips_2020_Q1
	) merge4sets
ORDER BY
	started_at
GO


--------------------------------------------------------------------------------------------------------
---------- ADDING COLUMNS FOR CALCULATIONS (OUTPUT: OGDivvy_Trips_4sets_v2r1)
---------- (month, day, year, day_of_week, ride_length, weekday_id)
---------- Columns = 15, Rows = 3,876,042
--------------------------------------------------------------------------------------------------------

SELECT
	ride_id
	,started_at
	,ended_at
	,rideable_type
	,start_station_id
	,start_station_name
	,end_station_id
	,end_station_name
	,member_casual
	,DATEPART(month, started_at) AS month
	,DATEPART(day, started_at) AS day
	,DATENAME(year, started_at) AS year
	,DATENAME(weekday, started_at) AS day_of_week
	,DATEDIFF(SECOND, started_at, ended_at) as ride_length
	,iif(DATENAME(weekday, started_at) = 'Sunday',1,iif(DATENAME(weekday, started_at) = 'Monday',2,iif(DATENAME(weekday, started_at) = 'Tuesday',3,iif(DATENAME(weekday, started_at) = 'Wednesday',4,iif(DATENAME(weekday, started_at) = 'Thursday',5,iif(DATENAME(weekday, started_at) = 'Friday',6,7)))))) AS weekday_id
FROM
	OGDivvy_Trips_4sets_v2