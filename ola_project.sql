
select count(booking_id) from ola_bookings

--1. Retrieve all successful bookings:

create view successful_rides as 
select * from ola_bookings
where booking_status = 'Success'


--2. Find the average ride distance for each vehicle type:

create view avg_distance as 
select vehicle_type , avg(ride_distance) as avg_distance
from ola_bookings
group by 1


--3. Get the total number of cancelled rides by customers:

select count(*) from ola_bookings
where booking_status = 'Canceled by Customer'



--4. List the top 5 customers who booked the highest number of rides:

create view top5_customer as
select customer_id,count(booking_id)as total_rides from ola_bookings
group by 1
order by 2 desc
limit 5


--5. Get the number of rides cancelled by drivers due to personal and car-related issues:

create view canceled_by_driver as
select count(*) canceled_by_Driver from ola_bookings
where canceled_rides_by_driver = 'Personal & Car related issue'

--6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

create view max_min_driver_rating as
select max(driver_ratings) as max_driver_ratings,
	min(driver_ratings) as min_driver_ratings
FROM ola_bookings
where vehicle_type = 'Prime Sedan'


--7. Retrieve all rides where payment was made using UPI:

create view upi_payment as 
select * from ola_bookings
where payment_method = 'UPI'


--8. Find the average customer rating per vehicle type:

create view avg_rating_by_vehiclev as
select vehicle_type , round(avg(customers_ratings),1) as avg_customer_rating
from ola_bookings
group by vehicle_type


--9. Calculate the total booking value of rides completed successfully:

create view total_successful_booking as
select sum(booking_vallue) as total_booking_vallue from ola_bookings
where booking_status = 'Success'


--10. List all incomplete rides along with the reason:

create view incomplete_rides as
select incomplete_rides , incomplete_rides_reasons
from ola_bookings
where incomplete_rides = 'Yes'

