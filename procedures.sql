SET SERVEROUTPUT ON;

-- Create the procedure
CREATE OR REPLACE PROCEDURE spDonorDetails(p_BikeID IN VARCHAR2) AS
    v_donorName     VARCHAR2(100);   --Declare varibales to store the fetched data, donor's full name
    v_volunteerName VARCHAR2(50);     --Name of the volunteer 
    v_bikeDesc      VARCHAR2(100);    --Bike description
    v_donationDate  DATE;              --Donation date
BEGIN
    -- Fetch donor, volunteer, bike and date details
    SELECT 
        d.Donor_FName || ' ' || d.Donor_LName,
        v.Vol_FName,
        b.Description,
        n.Donation_Date
    INTO
        v_donorName,
        v_volunteerName,
        v_bikeDesc,
        v_donationDate
    FROM Donation n
    JOIN Donor d ON n.Donor_ID = d.Donor_ID  --Join with donor table
    JOIN Volunteer v ON n.Volunteer_ID = v.Vol_ID  --Join with volunteer table
    JOIN Bike b ON n.Bike_ID = b.Bike_ID   --Join with bike table
    WHERE n.Bike_ID = p_BikeID;

    -- Display formatted output
    DBMS_OUTPUT.PUT_LINE('ATTENTION: ' || v_donorName || 
                         ', assisted by: ' || v_volunteerName || 
                         ', donated the ' || v_bikeDesc || 
                         ' on the ' || TO_CHAR(v_donationDate, 'DD/Mon/YYYY'));

EXCEPTION -- Exception handling prevents runtime failure theres an unexpected error
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No donation found for Bike ID: ' || p_BikeID);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
END;
/
-- Execute the procedure for bike id
EXEC spDonorDetails('B004');



