-- ANALYZING DATA
-- 1. Total number of rides
-- 2. Total number of rides of each membership type
-- 3. Average length of rides by each member type
-- 4. Number of rides by each month of each member type
-- 5. Average length of rides of each member by month
-- 6. Number of rides by each member by day
-- 7. Average length of rides each day
-- 8. Average, Maximum, Minimum rides for each member type
-- 9. Average length of ride for each member type per day

--------------------------------------------------------------------------------------------------------
-- 1. TOTAL NUMBER OF RIDES
--------------------------------------------------------------------------------------------------------

SELECT 
	FORMAT(COUNT(ride_id), '###,###,###') AS total_rides
FROM 
	OGDivvy_Trips_4sets_v2r1
GO

--------------------------------------------------------------------------------------------------------
-- 2. TOTAL NUMBER OF RIDES OF EACH MEMBERSHIP TYPE (MEMBER & CASUAL)
--------------------------------------------------------------------------------------------------------
SELECT
	member_casual
	,FORMAT(COUNT(ride_id), '###,###,###') AS total_rides
FROM 
	OGDivvy_Trips_4sets_v2r1
GROUP BY
	member_casual

--------------------------------------------------------------------------------------------------------
-- 3. AVERAGE LENGTH OF RIDES BY EACH MEMBER TYPE 
--------------------------------------------------------------------------------------------------------
SELECT
	member_casual
	,FORMAT(AVG(ride_length), '###,###,###.##') AS [Average Ride Length]
FROM 
	OGDivvy_Trips_4sets_v2r1
GROUP BY
	member_casual
ORDER BY
	member_casual DESC
GO

--------------------------------------------------------------------------------------------------------
-- 4. NUMBER OF RIDES BY EACH MONTH OF EACH MEMBER TYPE
--------------------------------------------------------------------------------------------------------
SELECT
	member_casual
	,CASE
	WHEN month = 1 THEN 'January'
	WHEN month = 2 THEN 'February'
	WHEN month = 3 THEN 'March'
	WHEN month = 4 THEN 'April'
	WHEN month = 5 THEN 'May'
	WHEN month = 6 THEN 'June'
	WHEN month = 7 THEN 'July'
	WHEN month = 8 THEN 'August'
	WHEN month = 9 THEN 'September'
	WHEN month = 10 THEN 'October'
	WHEN month = 11 THEN 'November'
ELSE 'December'
END AS 'month_name'
	,year
	,FORMAT(CONVERT(int, COUNT(ride_id)), '###,###,###') AS total_rides
FROM
	OGDivvy_Trips_4sets_v2r1
GROUP BY
	member_casual
	,month
	,year
ORDER BY
	year
	,month
	,member_casual
GO


--------------------------------------------------------------------------------------------------------
-- 5. AVERAGE LENGTH OF RIDES OF EACH MEMBER BY MONTH
--------------------------------------------------------------------------------------------------------
SELECT
	member_casual
	,CASE
	WHEN month = 1 THEN 'January'
	WHEN month = 2 THEN 'February'
	WHEN month = 3 THEN 'March'
	WHEN month = 4 THEN 'April'
	WHEN month = 5 THEN 'May'
	WHEN month = 6 THEN 'June'
	WHEN month = 7 THEN 'July'
	WHEN month = 8 THEN 'August'
	WHEN month = 9 THEN 'September'
	WHEN month = 10 THEN 'October'
	WHEN month = 11 THEN 'November'
ELSE 'December'
END AS 'month_name'
	,year
	,FORMAT(CONVERT(float, AVG(ride_length)), '###,###,###.##') AS average_rides
FROM
	OGDivvy_Trips_4sets_v2r1
GROUP BY
	member_casual
	,month
	,year
ORDER BY
	year
	,month
	,member_casual
GO

--------------------------------------------------------------------------------------------------------
-- 6. NUMBER OF RIDES BY EACH MEMBER BY DAY
--------------------------------------------------------------------------------------------------------
SELECT 
	member_casual
	,day_of_week
	,IIF(day_of_week = 'Sunday', 1, 
	IIF(day_of_week = 'Monday', 2, 
	IIF(day_of_week = 'Tuesday', 3, 
	IIF(day_of_week = 'Wednesday', 4, 
	IIF(day_of_week = 'Thursday', 5, 
	IIF(day_of_week = 'Friday', 6, 7)))))) AS days_id
	,FORMAT(CONVERT(int,COUNT(ride_id)),'###,###,###') AS total_rides
FROM
	OGDivvy_Trips_4sets_v2r1
GROUP BY
	day_of_week
	,member_casual
ORDER BY
	member_casual --DESC
	,days_id
	,total_rides DESC
GO


--------------------------------------------------------------------------------------------------------
-- 7. AVERAGE LENGTH OF RIDES EACH DAY
--------------------------------------------------------------------------------------------------------
SELECT
	day_of_week
	,IIF(day_of_week = 'Sunday', 1, 
	IIF(day_of_week = 'Monday', 2, 
	IIF(day_of_week = 'Tuesday', 3, 
	IIF(day_of_week = 'Wednesday', 4, 
	IIF(day_of_week = 'Thursday', 5, 
	IIF(day_of_week = 'Friday', 6, 7)))))) AS days_id
	,FORMAT(AVG(ride_length), '###,###,###.###') AS average_ride_length
FROM
	OGDivvy_Trips_4sets_v2r1
GROUP BY
	day_of_week
ORDER BY
	days_id
GO

--------------------------------------------------------------------------------------------------------
-- 8. AVERAGE, MAXIMUM, MINIMUM RIDES FOR EACH MEMBER TYPE
--------------------------------------------------------------------------------------------------------
select 
	member_casual
	,format(avg(ride_length), '###,###.##') as average_ride_length
	,format(max(ride_length), '###,###.##') as maximum_ride_length
	,format(min(ride_length), '###,###.##') as minimum_ride_length
from
	OGDivvy_Trips_4sets_v2r1
group by
	member_casual
order by
	member_casual
GO


--------------------------------------------------------------------------------------------------------
-- 9. AVERAGE LENGTH OF RIDE FOR EACH MEMBER TYPE PER DAY
--------------------------------------------------------------------------------------------------------
SELECT 
	member_casual
	,day_of_week
	,IIF(day_of_week = 'Sunday', 1, 
	IIF(day_of_week = 'Monday', 2, 
	IIF(day_of_week = 'Tuesday', 3, 
	IIF(day_of_week = 'Wednesday', 4, 
	IIF(day_of_week = 'Thursday', 5, 
	IIF(day_of_week = 'Friday', 6, 7)))))) AS days_id
	,FORMAT(CONVERT(int,AVG(ride_length)),'###,###,###') AS total_rides
FROM
	OGDivvy_Trips_4sets_v2r1
GROUP BY
	day_of_week
	,member_casual
ORDER BY
	member_casual --DESC
	,days_id
	,total_rides DESC
GO