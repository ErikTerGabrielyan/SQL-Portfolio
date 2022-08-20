-- Answer 1 Part 1
ALTER TABLE meat_poultry_egg_inspect
ADD poultry_processing boolean;
ALTER TABLE meat_poultry_egg_inspect
ADD meat_processing boolean;
ALTER TABLE meat_poultry_egg_inspect
ADD export_certification boolean;
-- Answer 1 Part 2
UPDATE meat_poultry_egg_inspect
SET poultry_processing = TRUE
WHERE activities LIKE '%Poultry Processing%';
UPDATE meat_poultry_egg_inspect
SET meat_processing = TRUE
WHERE activities LIKE '%Meat Processing%';
UPDATE meat_poultry_egg_inspect
SET export_certification = TRUE
WHERE activities LIKE '%Certification - Export%';
-- Answer 1 Part 3
SELECT COUNT(poultry_processing) AS "# Poultry Processing", 
COUNT(meat_processing) AS "# Meat Processing", COUNT(export_certification) 
AS "# Export Certificate"
FROM meat_poultry_egg_inspect;
-- Answer 2 Part 1
SELECT trip_id,
   tpep_pickup_datetime AS pickup,
   tpep_dropoff_datetime AS dropoff,
   tpep_dropoff_datetime - tpep_pickup_datetime AS 
length_of_ride,
   total_amount AS trip_cost
FROM nyc_yellow_taxi_trips_2016_06_01
WHERE (date_part('hour', tpep_dropoff_datetime - tpep_pickup_datetime) >= 
1 AND date_part('hour', tpep_dropoff_datetime - tpep_pickup_datetime) < 2)
OR (date_part('hour', tpep_dropoff_datetime - tpep_pickup_datetime) = 2 
AND date_part('minute', tpep_dropoff_datetime - tpep_pickup_datetime) < 
30)
ORDER BY trip_cost DESC;
-- Answer 2 Part 2
-- I found it very strange that the top three most expensive trips all had a total amount of $800.
-- The strange part is, all three had a trip distance of 0, and a fare of $750. How does this work?
-- Is there an error in the trip distance? Need to ask the city officials about this.