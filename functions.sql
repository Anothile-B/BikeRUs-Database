-- Create the function
CREATE OR REPLACE FUNCTION fn_TotalValueByVolunteer(p_VolunteerID IN VARCHAR2)
RETURN NUMBER
IS
    v_totalValue NUMBER(10,2);   -- Declare variable to store the total donation value 
    v_volunteerName VARCHAR2(100);  --Declare variable to store the volunteer's full name
    v_vat CONSTANT NUMBER := 0.15;  --Declare a constant for the vat rate
BEGIN
    -- Fetch volunteer's name
    SELECT Vol_FName || ' ' || Vol_SName
    INTO v_volunteerName
    FROM Volunteer
    WHERE Vol_ID = p_VolunteerID;

    -- Calculate total donation value including VAT
    SELECT SUM(Value + (Value * v_vat))
    INTO v_totalValue
    FROM Donation
    WHERE Volunteer_ID = p_VolunteerID;

    -- Handle case where the volunteer has no donations
    IF v_totalValue IS NULL THEN
        v_totalValue := 0;
    END IF;

    -- Display formatted output
    DBMS_OUTPUT.PUT_LINE('========================================================');
    DBMS_OUTPUT.PUT_LINE('Summary Report of Volunteer Donations');
    DBMS_OUTPUT.PUT_LINE('========================================================');
    DBMS_OUTPUT.PUT_LINE('Volunteer: ' || v_volunteerName);
    DBMS_OUTPUT.PUT_LINE('Volunteer ID: ' || p_VolunteerID);
    DBMS_OUTPUT.PUT_LINE('Total Donation Value (VAT inclusive): R' || TO_CHAR(v_totalValue, '999,990.00'));
    DBMS_OUTPUT.PUT_LINE('========================================================');

    RETURN v_totalValue;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE(' No record found for Volunteer ID: ' || p_VolunteerID);
        RETURN 0;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(' Unexpected error: ' || SQLERRM);
        RETURN 0;
END;
/

-- Execute the function using an anonymous block
DECLARE
    v_result NUMBER(10,2);
BEGIN
    v_result := fn_TotalValueByVolunteer('vol105');
END;
/
