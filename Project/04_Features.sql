-- List trains with source & destination station names
SELECT t.train_name,
       s1.station_name AS Source_Station,
       s2.station_name AS Destination_Station
    FROM Train t
JOIN Train_Schedule ts ON t.train_id = ts.train_id
JOIN Station s1 ON ts.source_station = s1.station_id
JOIN Station s2 ON ts.destination_station = s2.station_id;

-- Find trains that start from a specific city (subquery)
SELECT train_name
    FROM Train
WHERE train_id IN (
    SELECT train_id
        FROM Train_Schedule
    WHERE source_station IN (
        SELECT station_id
        FROM Station
        WHERE UPPER(city) = 'DHAKA'
    )
);

-- Passenger name, train name, journey date, booking status
SELECT p.name, t.train_name, tk.journey_date, tk.booking_status
    FROM Passenger p
JOIN Ticket tk ON p.passenger_id = tk.passenger_id
JOIN Train t ON tk.train_id = t.train_id;

-- Passengers booked for a specific train (train_id = 101)
SELECT name
FROM Passenger
WHERE passenger_id IN (
    SELECT passenger_id
    FROM Ticket
    WHERE train_id = 101
);

-- Display train schedule between a time range⭐⭐⭐⭐⭐

SELECT *
FROM Ticket
WHERE TRUNC(journey_date)
      BETWEEN DATE '2026-07-01' AND DATE '2026-07-15'
ORDER BY journey_date;

-- Train schedule with ticket count
SELECT t.train_name, ts.departure_time, ts.arrival_time,
       COUNT(tk.ticket_id) AS Total_Tickets
FROM Train t
JOIN Train_Schedule ts ON t.train_id = ts.train_id
LEFT JOIN Ticket tk ON t.train_id = tk.train_id
GROUP BY t.train_name, ts.departure_time, ts.arrival_time;

-- Revenue per train
SELECT tr.train_name, SUM(p.amount) AS Revenue
    FROM Payment p
JOIN Ticket t ON p.ticket_id = t.ticket_id
JOIN Train tr ON t.train_id = tr.train_id
WHERE p.payment_status = 'PAID'
GROUP BY tr.train_name
ORDER BY Revenue DESC;

--  Payment details for tickets of a specific train (train_id = 101)
SELECT p.payment_id, t.ticket_id, tr.train_name, p.amount, p.payment_mode
FROM Payment p
JOIN Ticket t ON p.ticket_id = t.ticket_id
JOIN Train tr ON t.train_id = tr.train_id
WHERE tr.train_id = 102;

