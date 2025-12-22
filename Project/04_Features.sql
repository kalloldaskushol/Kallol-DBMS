-- 1. List trains with source & destination station names
SELECT 
    t.train_name,
    s1.station_name AS source_station,
    s2.station_name AS destination_station,
    ts.departure_time,
    ts.arrival_time
FROM Train t
JOIN Train_Schedule ts ON t.train_id = ts.train_id
JOIN Station s1 ON ts.source_station = s1.station_id
JOIN Station s2 ON ts.destination_station = s2.station_id;


-- 2. Find trains that start from a specific city and ends to a specific city:
SELECT train_name
FROM Train
WHERE train_id IN (
    SELECT train_id
    FROM Train_Schedule
    WHERE source_station IN (
        SELECT station_id
        FROM Station
        WHERE UPPER(city) = UPPER(:source_city)
    )
    AND destination_station IN (
        SELECT station_id
        FROM Station
        WHERE UPPER(city) = UPPER(:dest_city)
    )
);


-- To clear the variable
UNDEFINE city_name;

-- 3. Passengers booked for a specific train (train_id = 101)
SELECT name
    FROM Passenger
WHERE passenger_id IN (
    SELECT passenger_id
    FROM Ticket
    WHERE train_id = :train_id
);

-- 4. Display train schedule between a time range

SELECT *
    FROM Ticket --ticket table has journey_date column
WHERE journey_date >=  TO_DATE(:start_date, 'YYYY-MM-DD')
  AND journey_date <=  TO_DATE(:end_date,   'YYYY-MM-DD')
  AND booking_status LIKE 'CONFIRMED'
ORDER BY journey_date;

-- To clear the variables
UNDEFINE start_date;
UNDEFINE end_date;