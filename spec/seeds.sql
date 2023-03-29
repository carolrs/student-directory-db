TRUNCATE TABLE cohorts RESTART IDENTITY;
TRUNCATE TABLE students RESTART IDENTITY; 

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.
INSERT INTO cohorts (name) VALUES ('March');
INSERT INTO students (name, cohort_id ) VALUES ('Carolina', '1');
INSERT INTO students (name, cohort_id ) VALUES ('John','1');

