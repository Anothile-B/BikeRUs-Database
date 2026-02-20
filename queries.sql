-- Constraints
SELECT constraint_name, constraint_type, search_condition  --Constraint from Bike table
FROM user_constraints
WHERE table_name = 'BIKE';

SELECT constraint_name, constraint_type, search_condition  --Constraint from Volunteer table
FROM user_constraints
WHERE table_name = 'VOLUNTEER';



-- Generate query  
SELECT 
    d.Donor_ID AS "Donor ID",  --Display Donor ID
    b.Bike_Type AS "Bike Type",  --Display type of bike donated 
    b.Description AS "Bike Description",   --Display Bike description 
    'R ' || TO_CHAR(n.Value, '9999') AS "Bike Value"   --Display bike price
FROM Donation n
JOIN Donor d ON n.Donor_ID = d.Donor_ID  --Join donor table to get donor details
JOIN Bike b ON n.Bike_ID = b.Bike_ID     --Join bike table to get bike details
WHERE n.Value > 1500   --Display values that are above 1500
ORDER BY n.Value DESC;    --Order from highest to lowest 

