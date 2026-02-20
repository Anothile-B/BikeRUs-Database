SET SERVEROUTPUT ON;

DECLARE
    -- Constant for vat rate
    c_vat_rate CONSTANT NUMBER := 0.15;

    -- Variables to store values fetched from the cursor
    v_description   Bike.Description%TYPE;  
    v_manufacturer  Bike.Manufacturer%TYPE;  
    v_type          Bike.Bike_Type%TYPE;    
    v_value         Donation.Value%TYPE;    
    v_vat           NUMBER(10,2);           --Vat amount
    v_total         NUMBER(10,2);            --Total

    -- Cursor to retrieve all road bikes and their values
    CURSOR c_RoadBikes IS
        SELECT 
            b.Description,  --Bike description
            b.Manufacturer,  --Bike manufacturer
            b.Bike_Type,     --Bike type
            n.Value           --Bike donation value
        FROM Bike b
        JOIN Donation n ON b.Bike_ID = n.Bike_ID
        WHERE UPPER(b.Bike_Type) = 'ROAD BIKE';

BEGIN
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('  ROAD BIKE REPORT(VAT-INCLUSIVE)');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------');

    FOR rec IN c_RoadBikes LOOP
        v_description  := rec.Description;
        v_manufacturer := rec.Manufacturer;
        v_type         := rec.Bike_Type;
        v_value        := rec.Value;
        v_vat          := v_value * c_vat_rate;   --Calculates vat amount
        v_total        := v_value + v_vat;         --Calcutes total amount with vat included

        DBMS_OUTPUT.PUT_LINE('BIKE DESCRIPTION: ' || v_description);
        DBMS_OUTPUT.PUT_LINE('BIKE MANUFACTURER: ' || v_manufacturer);
        DBMS_OUTPUT.PUT_LINE('BIKE TYPE: ' || v_type);
        DBMS_OUTPUT.PUT_LINE('VALUE: R' || TO_CHAR(v_value, '999,990.00'));
        DBMS_OUTPUT.PUT_LINE('VAT: R' || TO_CHAR(v_vat, '999,990.00'));
        DBMS_OUTPUT.PUT_LINE('TOTAL AMOUNT: R' || TO_CHAR(v_total, '999,990.00'));
        DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------');
    END LOOP;  --End loop
END;
/

