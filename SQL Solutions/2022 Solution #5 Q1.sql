CREATE OR REPLACE VIEW faculty_addresses (person, department, street, location, classification) AS (
SELECT DISTINCT CONCAT(CONCAT(p.lname, ", "), p.fname) AS person,
p.department AS department,
ad.street AS street,
CONCAT(CONCAT(ad.city, ", "), ad.state) AS location,
cl.classification AS classification
FROM people p JOIN person_addresses p_ad ON (p.person_id = p_ad.person_id)
JOIN addresses ad ON (p_ad.address_id = ad.address_id)
JOIN person_classifications p_cl ON (p_ad.person_id = p_cl.person_id)
JOIN classification cl ON (cl.classification_id = p_cl.classification_id)
WHERE department = "BSIS" AND classification = "Faculty" AND state = "MD"
ORDER BY p.lname);

SELECT * FROM faculty_addresses