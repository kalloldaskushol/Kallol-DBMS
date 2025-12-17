-- Building TRAIN table:-
CREATE TABLE Train (
    train_id NUMBER PRIMARY KEY,
    train_name VARCHAR2(50) NOT NULL,
    train_type VARCHAR2(20),
    total_seats NUMBER CHECK (total_seats > 0)
);

-- Building STATION table:-
CREATE TABLE Station (
    station_id NUMBER PRIMARY KEY,
    station_name VARCHAR2(50) UNIQUE NOT NULL,
    city VARCHAR2(50)
);

-- Building TRAIN_SCHEDULE table:-
CREATE TABLE Train_Schedule (
    schedule_id NUMBER PRIMARY KEY,
    train_id NUMBER REFERENCES Train(train_id),
    source_station NUMBER REFERENCES Station(station_id),
    destination_station NUMBER REFERENCES Station(station_id),
    departure_time VARCHAR2(10),
    arrival_time VARCHAR2(10)
);

-- Building PASSENGER table:-
CREATE TABLE Passenger (
    passenger_id NUMBER PRIMARY KEY,
    name VARCHAR2(50) NOT NULL,
    age NUMBER CHECK (age > 0),
    gender VARCHAR2(10),
    phone VARCHAR2(15) UNIQUE
);

-- Building TICKET table:-
CREATE TABLE Ticket (
    ticket_id NUMBER PRIMARY KEY,
    passenger_id NUMBER REFERENCES Passenger(passenger_id),
    train_id NUMBER REFERENCES Train(train_id),
    journey_date DATE,
    seat_number NUMBER,
    booking_status VARCHAR2(20)   -- CONFIRMED / CANCELLED
);

-- Building PAYMENT table:-
CREATE TABLE Payment (
    payment_id NUMBER PRIMARY KEY,
    ticket_id NUMBER REFERENCES Ticket(ticket_id),
    amount NUMBER CHECK (amount > 0),
    payment_mode VARCHAR2(20),
    payment_status VARCHAR2(20)
);
