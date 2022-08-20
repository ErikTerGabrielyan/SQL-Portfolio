-- Answer 1
SELECT geo_name AS "County", state_us_abbreviation AS "State", 
internal_point_lat AS "Latitude", internal_point_lon AS "Longitude", 
area_water AS "Area (Water)", p0030001 AS "Population (Adults)", 
ROUND((CAST (p0030001 AS numeric(8,1)) / p0010001 * 100),2) AS pct_adult
FROM us_counties_2010
WHERE state_us_abbreviation = 'CA' OR state_us_abbreviation = 'FL' OR 
state_us_abbreviation = 'PA'
ORDER BY state_us_abbreviation ASC, pct_adult DESC;
-- Answer 2
COPY (
SELECT geo_name, state_us_abbreviation, internal_point_lat, 
internal_point_lon, (CAST (housing_unit_count_100_percent AS 
numeric(12,2))), (CAST(population_count_100_percent AS numeric(12,2)))
FROM us_counties_2010
WHERE state_us_abbreviation = 'DC' OR state_us_abbreviation = 'MD' 
OR state_us_abbreviation = 'VA'
)
TO 'C:\Users\Public\dmv_states.csv'
WITH (FORMAT CSV, HEADER, DELIMITER '|');
CREATE TABLE dmv_states (
county varchar(90),
state varchar(2),
latitude numeric(10,7),
longitude numeric(10,7),
household numeric(12,2),
population numeric(12,2)
);
COPY dmv_states
FROM 'C:\Users\Public\dmv_states.csv'
WITH (FORMAT CSV, HEADER, DELIMITER '|');