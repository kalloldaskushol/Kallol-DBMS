```mermaid
erDiagram
    TRAIN ||--o{ TRAIN_SCHEDULE : has
    STATION ||--o{ TRAIN_SCHEDULE : source_for
    STATION ||--o{ TRAIN_SCHEDULE : destination_for

    PASSENGER ||--o{ TICKET : books
    TRAIN ||--o{ TICKET : for
    TICKET ||--|| PAYMENT : paid_by

    TRAIN {
        NUMBER train_id PK
        VARCHAR2 train_name
        VARCHAR2 train_type
        NUMBER total_seats
    }

    STATION {
        NUMBER station_id PK
        VARCHAR2 station_name UK
        VARCHAR2 city
    }

    TRAIN_SCHEDULE {
        NUMBER schedule_id PK
        NUMBER train_id FK
        NUMBER source_station FK
        NUMBER destination_station FK
        VARCHAR2 departure_time
        VARCHAR2 arrival_time
    }

    PASSENGER {
        NUMBER passenger_id PK
        VARCHAR2 name
        NUMBER age
        VARCHAR2 gender
        VARCHAR2 phone UK
    }

    TICKET {
        NUMBER ticket_id PK
        NUMBER passenger_id FK
        NUMBER train_id FK
        DATE journey_date
        NUMBER seat_number
        VARCHAR2 booking_status
    }

    PAYMENT {
        NUMBER payment_id PK
        NUMBER ticket_id FK
        NUMBER amount
        VARCHAR2 payment_mode
        VARCHAR2 payment_status
    }
