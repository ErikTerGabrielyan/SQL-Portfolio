-- ASSIGNMENT 5 - QUESTION 2
-- Partial script for the 'student_by_state' stored procedure
-- Feel free to remove/edit the comments once you have finished the code (in fact, please do)
USE ischool;

DROP PROCEDURE IF EXISTS student_by_state;

DELIMITER //
-- The CREATE statement is below
CREATE PROCEDURE student_by_state (
		students_state_param VARCHAR(50)
	)

BEGIN
-- --> The procedure is made up of a single select statement with the following columns:
-- --- student which is the person's full name in '(first name) (last name)' format
-- --- department, and location which is in '(city), (state)' format, 

-- --> Only include students from the state that match the parameter state
-- --- List each student only once
-- --- Order by student DESC, location, street
SELECT DISTINCT CONCAT(CONCAT(p.fname, " "), p.lname) AS student,
p.department AS department,
CONCAT(CONCAT(ad.city, ", "), ad.state) AS location
FROM people p JOIN person_addresses p_ad ON (p.person_id = p_ad.person_id)
JOIN addresses ad ON (p_ad.address_id = ad.address_id)
WHERE ad.state = students_state_param
GROUP BY p.person_id
ORDER BY student DESC, location;

END //

DELIMITER ;

-- --> TEST YOUR CODE:
-- --- Run the statement below to test your code: 
-- --- Do you see the rows with the following values?
-- --- NOTE: These may not be the only rows displayed.

-- --- Torie Oguz			BSIS		Washington, DC
-- --- Nicoline Duchateau	BSIS		Washington, DC
-- --- Murray Barker		ISCHOOL		Washington, DC
-- --- Isaiah Denial		BSIS		Washington, DC
-- --- Genna Ellul			BSIS		Washington, DC


-- --- If "Yes", you have built the stored procedure as required; 
-- --- if "No", continue working on it.
CALL student_by_state('DC');

