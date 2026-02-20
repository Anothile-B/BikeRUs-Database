--Create the view
CREATE OR REPLACE VIEW vwBikeRUs AS
SELECT 
    (d.Donor_FName || ' ' || d.Donor_LName) AS Donor_Name,
    d.Contact_No AS Donor_Contact, -- Include the donor's contact information
    b.Bike_Type AS Bike_Type,  -- Include the type of bike donated
    n.Donation_Date AS Donation_Date --Include the date the donation was made
FROM Donation n
JOIN Donor d 
    ON n.Donor_ID = d.Donor_ID  -- Join with Donor table to get donor details
JOIN Bike b 
    ON n.Bike_ID = b.Bike_ID  -- Join with Bike table to get bike details
WHERE LOWER(n.Volunteer_ID) = 'vol105';  --Displays results that were only made by "vol105".

-- Execute the view
SELECT * FROM vwBikeRUs;

-- Justification for using a view
/*
    Benefits of using a view:
   1. Data Security: The view hides sensitive columns example includes the donor's email and volunteer information
      from end-users and only show relevant information. To regulate information availability through views,
      several access rights can be specified.

   2. Simplicity: Rather than continuously writing complicated join statements, users and apps can query the view.Because
   complicated queries are wrapped,they can be reused without requiring complex SQL expressions to be rewritten.
*/

