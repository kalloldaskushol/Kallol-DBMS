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

-- Testing the view
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

-- Testing the view
SELECT * FROM view_daily_revenue;


-- Trigger to auto-cancel ticket if payment fails.

CREATE OR REPLACE TRIGGER trg_cancel_on_payment_fail
AFTER UPDATE OF payment_status ON Payment
FOR EACH ROW
BEGIN
    IF :NEW.payment_status = 'FAILED' THEN
        UPDATE Ticket
        SET booking_status = 'CANCELLED'
        WHERE ticket_id = :NEW.ticket_id;
    END IF;
END;
/
-- Testing the trigger
-- Assume we have a payment with payment_id = 1
UPDATE Payment
SET payment_status = 'FAILED'
WHERE payment_id = 1;  
-- Check the corresponding ticket's booking_status
SELECT booking_status
FROM Ticket
WHERE ticket_id = (SELECT ticket_id FROM Payment WHERE payment_id = 1);