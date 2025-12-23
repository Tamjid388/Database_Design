
--query 1
select 
    b.booking_id,
    u.name AS customer_name,
    v.name AS vehicle_name,
    b.start_date,
    b.end_date,
    b.status
from bookings b
inner join users u on b.user_id = u.user_id
inner join vehicles v on b.vehicle_id = v.vehicle_id
order by b.booking_id;

--query 2
select 
  vehicle_id,name,type,model,registration_number,rental_price,status
  from vehicles where
not exists(
  select 1 from
  bookings where
  bookings.vehicle_id=vehicles.vehicle_id
  
)
--query 3
select * from vehicles
where vehicles.type='SUV' AND status = 'available';

--query 4
select v.name as vehicle_name, count(b.booking_id) as total_bookings
from vehicles v
join bookings b on v.vehicle_id = b.vehicle_id
group by v.vehicle_id, v.name
having count(b.booking_id) > 2;