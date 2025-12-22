-- Shows how many seats are booked vs total seats per train.

CREATE OR REPLACE VIEW view_train_occupancy AS
SELECT
    tr.train_id,
    tr.train_name,
    tr.total_seats,
    COUNT(t.ticket_id) AS booked_seats,
    (tr.total_seats - COUNT(t.ticket_id)) AS available_seats
FROM Train tr
LEFT JOIN Ticket t
    ON tr.train_id = t.train_id
    AND t.booking_status = 'CONFIRMED'
GROUP BY tr.train_id, tr.train_name, tr.total_seats;
/

SELECT * FROM view_train_occupancy;

-- Shows total revenue per journey date.
CREATE OR REPLACE VIEW view_daily_revenue AS
SELECT
    t.journey_date,
    SUM(p.amount) AS total_revenue
FROM Ticket t
JOIN Payment p
    ON t.ticket_id = p.ticket_id
WHERE p.payment_status = 'PAID'
GROUP BY t.journey_date;
/

SELECT * FROM view_daily_revenue;

