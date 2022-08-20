/*Answer 1*/
SELECT CONCAT(course_code,course_number) AS 'Course', course_description AS 'Description', credits AS 'Credits', course_prereq AS 'Prerequisites' FROM ischool.courses
WHERE course_prereq IS NOT NULL
AND course_number < 400;

/*Answer 2*/
SELECT person_id AS 'UID', CONCAT(lname, ", ", fname) AS 'Name', department AS 'Department', title AS 'Title', email AS 'Email' FROM ischool.people
WHERE title IS NOT NULL
ORDER BY title;