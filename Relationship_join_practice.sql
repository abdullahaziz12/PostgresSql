-- ============================================
-- SQL JOINs & Relationships Practice
-- Schema: students <-> enrollment <-> course (many-to-many via junction table)
-- ============================================

CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE course (
    course_id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    instructor VARCHAR(100)
);

CREATE TABLE enrollment (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INTEGER,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    course_id INTEGER,
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

INSERT INTO students (name, city)
VALUES ('Ali', 'Lahore'), ('Sara', 'Karachi'), ('Bilal', 'Lahore'), ('Zara', 'Islamabad');

INSERT INTO course (title, instructor)
VALUES ('Database Systems', 'Dr. Khan'), ('Web Dev', 'Dr. Ahmed'), ('AI Basics', 'Dr. Khan');

INSERT INTO enrollment (student_id, course_id)
VALUES (1,1), (1,2), (2,1), (3,2);
-- Note: Zara (student 4) has no enrollment, AI Basics (course 3) has no student


-- ============================================
-- Q1: Students + course titles, only for students who ARE enrolled
-- (INNER JOIN -> unmatched rows on both sides dropped, e.g. Zara & AI Basics won't show)
-- ============================================
SELECT s.name, c.title
FROM enrollment e
INNER JOIN students s ON s.student_id = e.student_id
INNER JOIN course c ON c.course_id = e.course_id;


-- ============================================
-- Q2: ALL students with their course titles, even if not enrolled (NULL for Zara)
-- (LEFT JOIN chain, both joins must be LEFT to preserve Zara through to course.title)
-- ============================================
SELECT s.name, c.title
FROM students s
LEFT JOIN enrollment e ON s.student_id = e.student_id
LEFT JOIN course c ON c.course_id = e.course_id;


-- ============================================
-- Q3: ALL courses with student names, even if no student enrolled (NULL for AI Basics)
-- (course is the anchor table this time, so it's on the LEFT / preserved side)
-- ============================================
SELECT c.title, s.name
FROM course c
LEFT JOIN enrollment e ON c.course_id = e.course_id
LEFT JOIN students s ON s.student_id = e.student_id;


-- ============================================
-- Q4: Names of students enrolled specifically in 'Database Systems'
-- (INNER JOIN + WHERE filter -- unmatched rows are irrelevant here, so no need for LEFT/RIGHT)
-- ============================================
SELECT s.name
FROM enrollment e
INNER JOIN students s ON s.student_id = e.student_id
INNER JOIN course c ON c.course_id = e.course_id
WHERE c.title = 'Database Systems';


-- ============================================
-- Q5: Each student's name + total enrollment count (0 for students with none, e.g. Zara)
-- IMPORTANT: count e.enrollment_id (the "many" side), NOT s.name --
-- counting s.name would wrongly count Zara as 1 since her name is never NULL.
-- ============================================
SELECT s.name, COUNT(e.enrollment_id) AS total_enrollments
FROM students s
LEFT JOIN enrollment e ON s.student_id = e.student_id
GROUP BY s.name;


-- ============================================
-- Q6: Students who are NOT enrolled in any course (anti-join pattern)
-- LEFT/RIGHT JOIN + WHERE <many-side column> IS NULL
-- ============================================
SELECT s.name
FROM students s
LEFT JOIN enrollment e ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL;


-- ============================================
-- Q7: Courses with NO students enrolled (anti-join pattern, mirrored to Q6)
-- ============================================
SELECT c.title
FROM course c
LEFT JOIN enrollment e ON c.course_id = e.course_id
WHERE e.enrollment_id IS NULL;