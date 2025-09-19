CREATE TABLE StudentEnrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    course_id VARCHAR(10) NOT NULL,
    enrollment_date DATE NOT NULL,
    CONSTRAINT unique_student_course UNIQUE (student_name, course_id)
);

INSERT INTO StudentEnrollments (student_name, course_id, enrollment_date) VALUES
('Smaran', 'CSE102', '2024-07-01'),
('Vaibhav', 'CSE101', '2024-07-01');

BEGIN;
INSERT INTO StudentEnrollments (student_name, course_id, enrollment_date)
VALUES ('Ashish', 'CSE101', '2024-07-01');
COMMIT;

SELECT * FROM StudentEnrollments;

START TRANSACTION;
SELECT * FROM StudentEnrollments
WHERE student_name = 'Ashish' AND course_id = 'CSE101'
FOR UPDATE;
UPDATE StudentEnrollments
SET enrollment_date = '2025-09-15'
WHERE student_name = 'Ashish' AND course_id = 'CSE101';
COMMIT;

SELECT * FROM StudentEnrollments WHERE student_name = 'Ashish';
START TRANSACTION;
SELECT * FROM StudentEnrollments
WHERE student_name = 'Ashish' AND course_id = 'CSE101'
FOR UPDATE;
UPDATE StudentEnrollments
SET enrollment_date = '2025-10-01'
WHERE student_name = 'Ashish' AND course_id = 'CSE101';
START TRANSACTION;
SELECT * FROM StudentEnrollments
WHERE student_name = 'Ashish' AND course_id = 'CSE101'
FOR UPDATE;
UPDATE StudentEnrollments
SET enrollment_date = '2025-11-01'
WHERE student_name = 'Ashish' AND course_id = 'CSE101';
COMMIT;

SELECT * FROM StudentEnrollments WHERE student_name = 'Ashish';