# Car Rental Management System

## This project implements a simple car rental management system using PostgreSQL as the database backend. The system tracks users (customers and potentially admins), vehicles available for rent, and bookings made by users. It demonstrates basic  operations such as relational joins, and aggregate queries to manage and analyze rental data.



### Query 1: Retrieve All Booking Details

**Concepts Used**: INNER JOIN

**SQL Query**:
```sql
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
```
---

### Query 2: Find all vehicles that have never been booked.

**Concepts Used**: NOT EXISTS 

**SQL Query**:
```sql
select 
  vehicle_id,name,type,model,registration_number,rental_price,status
  from vehicles where
not exists(
  select 1 from
  bookings where
  bookings.vehicle_id=vehicles.vehicle_id
  )
```

---

### Query 3: Find Available SUVs
**Requirement**: Retrieve all available vehicles of a specific type (e.g. cars).

**Concepts Used**: SELECT, WHERE

**SQL Query**:
```sql
select * from vehicles
where vehicles.type='SUV' AND status = 'available';
```

---

### Query 4: Find the total number of bookings for each vehicle and display only those vehicles that have more than 2 bookings.

**Concepts Used**: GROUP BY, HAVING, COUNT

**SQL Query**:
```sql
select v.name as vehicle_name, count(b.booking_id) as total_bookings
from vehicles v
join bookings b on v.vehicle_id = b.vehicle_id
group by v.vehicle_id, v.name
having count(b.booking_id) > 2;
```

