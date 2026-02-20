-- Create the trigger
CREATE OR REPLACE TRIGGER trg_NoDeleteDonation  
BEFORE DELETE ON Donation
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('==================================================================');
    DBMS_OUTPUT.PUT_LINE('️ Deletion Denied');
    DBMS_OUTPUT.PUT_LINE('Users are not permitted to delete records from the Donation table.');
    DBMS_OUTPUT.PUT_LINE('Donation ID ' || :OLD.Donation_ID || ' remains intact.');
    DBMS_OUTPUT.PUT_LINE('==================================================================');

    -- Prevent the deletion from happening
    RAISE_APPLICATION_ERROR(-20001, 'Deletion not permitted from the Donation table.');
END;
/
-- Attempt to delete a record to test the trigger
DELETE FROM Donation WHERE Donation_ID = 1;



-- Create the trigger
CREATE OR REPLACE TRIGGER trg_CheckDonationValue
BEFORE UPDATE OF Value ON Donation
FOR EACH ROW
BEGIN
    -- Check that the new donation value is greater than 0
    IF :NEW.Value <= 0 THEN
        DBMS_OUTPUT.PUT_LINE('   Donation value is invalid');
        DBMS_OUTPUT.PUT_LINE('Old Value: R' || TO_CHAR(:OLD.Value, '999,990.00'));
        DBMS_OUTPUT.PUT_LINE('New Value: R' || TO_CHAR(:NEW.Value, '999,990.00'));
        DBMS_OUTPUT.PUT_LINE('Update denied: Donation value must be greater than 0.');

        -- Prevent the update
        RAISE_APPLICATION_ERROR(-20002, 'Invalid donation value. It must be greater than 0.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('  Donation update successful');
        DBMS_OUTPUT.PUT_LINE('Old Value: R' || TO_CHAR(:OLD.Value, '999,990.00'));
        DBMS_OUTPUT.PUT_LINE('New Value: R' || TO_CHAR(:NEW.Value, '999,990.00'));
        DBMS_OUTPUT.PUT_LINE('Update granted.');
    END IF;
END;
/
-- Method to test that the update was successful and work like it was intended
UPDATE Donation 
SET Value = 2800 
WHERE Donation_ID = 1;

-- Method to test whether the update failed
UPDATE Donation 
SET Value = -500 
WHERE Donation_ID = 1;


