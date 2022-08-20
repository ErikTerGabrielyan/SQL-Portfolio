/*Answer for Question 1*/

DROP TABLE IF EXISTS people_copy;

CREATE TABLE people_copy LIKE ischool.people;
INSERT INTO people_copy SELECT * FROM ischool.people;

DROP TABLE IF EXISTS enrollments_copy;

CREATE TABLE enrollments_copy LIKE ischool.enrollments;
INSERT INTO enrollments_copy SELECT * FROM ischool.enrollments;

INSERT INTO people_copy (lname, fname, pronoun_id, email, college, department, start_date)
VALUES ('Jones', 'Grace', '8', 'gjones@umd.edu,', 'College of Information Studies', 'TID', sysdate());

INSERT INTO enrollments_copy VALUES ('132466128', '174');
INSERT INTO enrollments_copy VALUES ('132466128', '37');
INSERT INTO enrollments_copy VALUES ('132466128', '17');

/*Answer for Question 2*/

UPDATE enrollments_copy
SET section_id = '175'
WHERE person_id = '132466128' AND section_id = '174';

SELECT CONCAT(CONCAT(p.fname, " "), p.lname) AS student_name,
CONCAT(c.course_code, c.course_number) AS course,
cs.section_number AS section_number,
CONCAT(CONCAT(cs.semester, " "), cs.year) AS semester_year
FROM people_copy p JOIN enrollments_copy e ON (p.person_id = e.person_id)
JOIN ischool.course_sections cs ON (e.section_id = cs.section_id)
JOIN ischool.courses c ON (cs.course_id = c.course_id)
WHERE fname = 'Grace';

/*Answer for Question 3*/

SELECT cs.section_id AS section_id,
cs.section_number AS section_number,
CONCAT(c.course_code, c.course_number) AS course,
CONCAT(CONCAT(p.fname, " "), p.lname) AS student_name
FROM people_copy p JOIN enrollments_copy e ON (p.person_id = e.person_id)
JOIN ischool.course_sections cs ON (e.section_id = cs.section_id)
JOIN ischool.courses c ON (cs.course_id = c.course_id)
WHERE cs.section_id > 170;

DELETE FROM enrollments_copy
WHERE section_id > 170;

SELECT cs.section_id AS section_id,
cs.section_number AS section_number,
CONCAT(c.course_code, c.course_number) AS course,
CONCAT(CONCAT(p.fname, " "), p.lname) AS student_name
FROM people_copy p JOIN enrollments_copy e ON (p.person_id = e.person_id)
JOIN ischool.course_sections cs ON (e.section_id = cs.section_id)
JOIN ischool.courses c ON (cs.course_id = c.course_id)
WHERE cs.section_id > 170;