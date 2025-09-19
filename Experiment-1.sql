CREATE TABLE FeePayments (
    payment_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    amount DECIMAL(10, 2),
    payment_date DATE
);

INSERT INTO FeePayments (payment_id, student_name, amount, payment_date)
VALUES
(1, 'Ashish', 5000.00, '2024-06-01'),
(2, 'Smaran', 4500.00, '2024-06-02'),
(3, 'Vaibhav', 5500.00, '2024-06-03');

START TRANSACTION;
INSERT INTO FeePayments (payment_id, student_name, amount, payment_date)
VALUES (7, 'Sneha', 4700.00, '2024-06-08');

INSERT INTO FeePayments (payment_id, student_name, amount, payment_date)
VALUES (1, 'Arjun', 4900.00, '2024-06-09');
ROLLBACK;
SELECT * FROM FeePayments;
START TRANSACTION;

INSERT INTO FeePayments (payment_id, student_name, amount, payment_date)
VALUES (8, 'Arjun', 4900.00, '2024-06-09');

COMMIT;

SELECT * FROM FeePayments;