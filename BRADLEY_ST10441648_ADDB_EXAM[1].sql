DROP TABLE Trail_Event CASCADE CONSTRAINTS PURGE;
DROP TABLE Client CASCADE CONSTRAINTS PURGE;
DROP TABLE Trail CASCADE CONSTRAINTS PURGE;
DROP TABLE Guide CASCADE CONSTRAINTS PURGE;


-- 1. GUIDE Table
CREATE TABLE Guide (
    GUIDE_ID        NUMBER(3) PRIMARY KEY,
    GUIDE_FNAME     VARCHAR2(30) NOT NULL,
    GUIDE_SNAME     VARCHAR2(30) NOT NULL,
    GUIDE_CONTACT   CHAR(10) NOT NULL,
    GUIDE_LEVEL     NUMBER(2) CHECK (GUIDE_LEVEL BETWEEN 1 AND 10)
);

-- 2. CLIENT Table
CREATE TABLE Client (
    CLIENT_ID       CHAR(5) PRIMARY KEY,
    CLIENT_FNAME    VARCHAR2(30) NOT NULL,
    CLIENT_SNAME    VARCHAR2(30) NOT NULL,
    CLIENT_ADDRESS  VARCHAR2(50) NOT NULL,
    CLIENT_CONTACT  CHAR(10) NOT NULL
);

-- 3. TRAIL Table
CREATE TABLE Trail (
    TRAIL_ID                NUMBER(3) PRIMARY KEY,
    TRAIL_NAME              VARCHAR2(50) NOT NULL,
    TRAIL_DURATION          VARCHAR2(20) NOT NULL,
    TRAIL_LOCATION          VARCHAR2(50) NOT NULL,
    TRAIL_EXPERIENCE_LVL    NUMBER(2) CHECK (TRAIL_EXPERIENCE_LVL BETWEEN 1 AND 10),
    TRAIL_COST              NUMBER(6,2) NOT NULL
);

-- 4. TRAIL_EVENT Table
CREATE TABLE Trail_Event (
    EVENT_ID        CHAR(6) PRIMARY KEY,
    EVENT_DATE      DATE NOT NULL,
    PARTICIPANTS    NUMBER(3) DEFAULT 1 CHECK (PARTICIPANTS >= 1),
    GUIDE_ID        NUMBER(3) NOT NULL,
    CLIENT_ID       CHAR(5) NOT NULL,
    TRAIL_ID        NUMBER(3) NOT NULL,
    
    -- Foreign Key Constraints
    CONSTRAINT fk_trailevent_guide FOREIGN KEY (GUIDE_ID) REFERENCES Guide(GUIDE_ID),
    CONSTRAINT fk_trailevent_client FOREIGN KEY (CLIENT_ID) REFERENCES Client(CLIENT_ID),
    CONSTRAINT fk_trailevent_trail FOREIGN KEY (TRAIL_ID) REFERENCES Trail(TRAIL_ID)
);



-- Inserting GUIDE data
INSERT INTO Guide VALUES (201, 'Liam', 'Daniels', '0843569001', 7);
INSERT INTO Guide VALUES (202, 'Emily', 'Stewart', '0763698022', 3);
INSERT INTO Guide VALUES (203, 'Owen', 'Mthembu', '0786598999', 9);
INSERT INTO Guide VALUES (204, 'Clara', 'Van Wyk', '0796369444', 4);
INSERT INTO Guide VALUES (205, 'Marcus', 'Reid', '0826598111', 8);

-- Inserting CLIENT data
INSERT INTO Client VALUES ('CL101', 'Nathan', 'Daniels', '14 Willow Street', '0821112255');
INSERT INTO Client VALUES ('CL102', 'Aisha', 'Morgan', '22 Olive Road', '0769658547');
INSERT INTO Client VALUES ('CL103', 'Zara', 'Smith', '8 Hilltop Way', '0843256574');
INSERT INTO Client VALUES ('CL104', 'Jade', 'Pillay', '10 Sunset Drive', '0762356111');
INSERT INTO Client VALUES ('CL105', 'Sipho', 'Nkosi', '31 Forest Lane', '0821235000');
INSERT INTO Client VALUES ('CL106', 'Tahir', 'Essop', '77 Oak Avenue', '0847541999');
INSERT INTO Client VALUES ('CL107', 'Hannah', 'Jacobs', '96 Pine Road', '0745556000');
INSERT INTO Client VALUES ('CL108', 'Amelia', 'Jones', '55 Riverbank', '0814745005');
INSERT INTO Client VALUES ('CL109', 'Riley', 'Howard', '12 Clover Street', '0822232000');

-- Inserting TRAIL data
INSERT INTO Trail VALUES (650, 'Mountain Ridge', '3 hours', 'Storm Peak', 8, 750);
INSERT INTO Trail VALUES (651, 'Forest Walk', '1 hour', 'Green Woods', 2, 150);
INSERT INTO Trail VALUES (652, 'Canyon Trek', '2 hours', 'Red Valley', 4, 500);
INSERT INTO Trail VALUES (653, 'River Bend Trail', '1 hour', 'Silver Stream', 1, 120);
INSERT INTO Trail VALUES (654, 'Sunset Hike', '3 hours', 'Golden Cliffs', 3, 400);
INSERT INTO Trail VALUES (655, 'Rocky Path', '30 minutes', 'Stone Ridge', 1, 90);
INSERT INTO Trail VALUES (656, 'Highland Pass', '1 hour', 'Cloud Plains', 5, 300);
INSERT INTO Trail VALUES (657, 'Wildflower Route', '2 hours', 'Bloom Valley', 3, 250);
INSERT INTO Trail VALUES (658, 'Eagle Point Trek', '2 hours', 'Eagle Heights', 6, 600);

-- Inserting TRAIL_EVENT data
INSERT INTO Trail_Event VALUES ('EV_201', TO_DATE('05-JUL-2025', 'DD-MON-YYYY'), 5, 203, 'CL101', 658);
INSERT INTO Trail_Event VALUES ('EV_202', TO_DATE('06-JUL-2025', 'DD-MON-YYYY'), 7, 203, 'CL103', 655);
INSERT INTO Trail_Event VALUES ('EV_203', TO_DATE('08-JUL-2025', 'DD-MON-YYYY'), 8, 201, 'CL104', 652);
INSERT INTO Trail_Event VALUES ('EV_204', TO_DATE('09-JUL-2025', 'DD-MON-YYYY'), 3, 202, 'CL105', 651);
INSERT INTO Trail_Event VALUES ('EV_205', TO_DATE('11-JUL-2025', 'DD-MON-YYYY'), 6, 205, 'CL107', 658);
INSERT INTO Trail_Event VALUES ('EV_206', TO_DATE('12-JUL-2025', 'DD-MON-YYYY'), 4, 203, 'CL106', 656);
INSERT INTO Trail_Event VALUES ('EV_207', TO_DATE('15-JUL-2025', 'DD-MON-YYYY'), 9, 201, 'CL101', 654);
INSERT INTO Trail_Event VALUES ('EV_208', TO_DATE('17-JUL-2025', 'DD-MON-YYYY'), 5, 204, 'CL108', 652);
INSERT INTO Trail_Event VALUES ('EV_209', TO_DATE('18-JUL-2025', 'DD-MON-YYYY'), 7, 202, 'CL109', 653);
INSERT INTO Trail_Event VALUES ('EV_210', TO_DATE('19-JUL-2025', 'DD-MON-YYYY'), 10, 205, 'CL102', 652);
INSERT INTO Trail_Event VALUES ('EV_211', TO_DATE('20-JUL-2025', 'DD-MON-YYYY'), 12, 203, 'CL103', 654);
INSERT INTO Trail_Event VALUES ('EV_212', TO_DATE('21-JUL-2025', 'DD-MON-YYYY'), 8, 201, 'CL104', 656);
INSERT INTO Trail_Event VALUES ('EV_213', TO_DATE('22-JUL-2025', 'DD-MON-YYYY'), 15, 205, 'CL105', 658);
INSERT INTO Trail_Event VALUES ('EV_214', TO_DATE('23-JUL-2025', 'DD-MON-YYYY'), 6, 202, 'CL106', 655);
INSERT INTO Trail_Event VALUES ('EV_215', TO_DATE('24-JUL-2025', 'DD-MON-YYYY'), 11, 203, 'CL107', 651);
INSERT INTO Trail_Event VALUES ('EV_216', TO_DATE('25-JUL-2025', 'DD-MON-YYYY'), 9, 205, 'CL108', 653);


-- Displaying all tables
SELECT '=== GUIDE TABLE ===' AS Info FROM DUAL;
SELECT * FROM Guide;

SELECT '=== CLIENT TABLE ===' AS Info FROM DUAL;
SELECT * FROM Client;

SELECT '=== TRAIL TABLE ===' AS Info FROM DUAL;
SELECT * FROM Trail;

SELECT '=== TRAIL_EVENT TABLE ===' AS Info FROM DUAL;
SELECT EVENT_ID, 
       TO_CHAR(EVENT_DATE, 'DD-MON-YYYY') AS EVENT_DATE,
       PARTICIPANTS, 
       GUIDE_ID, 
       CLIENT_ID, 
       TRAIL_ID 
FROM Trail_Event
ORDER BY EVENT_DATE;

-- Commit all changes
COMMIT;


-- QUESTION 1:Query that will display client names, trail name, and event dates
SELECT c.CLIENT_FNAME || ', ' || c.CLIENT_SNAME AS CLIENT_NAME,
       t.TRAIL_NAME,
       TO_CHAR(te.EVENT_DATE, 'DD-MON-YY') AS EVENT_DATE
FROM Client c
JOIN Trail_Event te ON c.CLIENT_ID = te.CLIENT_ID
JOIN Trail t ON te.TRAIL_ID = t.TRAIL_ID
ORDER BY te.EVENT_DATE;

-- QUESTION 2: A PL/SQL block for trails with 10+ participants
SET SERVEROUTPUT ON;
DECLARE
    v_trail_name Trail.TRAIL_NAME%TYPE;
    v_event_date Trail_Event.EVENT_DATE%TYPE;
    
    CURSOR trail_cursor IS
        SELECT t.TRAIL_NAME, te.EVENT_DATE
        FROM Trail_Event te
        JOIN Trail t ON te.TRAIL_ID = t.TRAIL_ID
        WHERE te.PARTICIPANTS >= 10;
        
BEGIN
    DBMS_OUTPUT.PUT_LINE('Trail Name || Event Date');
    DBMS_OUTPUT.PUT_LINE('------------------------');
    
    OPEN trail_cursor;
    LOOP
        FETCH trail_cursor INTO v_trail_name, v_event_date;
        EXIT WHEN trail_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_trail_name || ' || ' || TO_CHAR(v_event_date, 'DD-MON-YYYY'));
    END LOOP;
    CLOSE trail_cursor;
END;
/

-- Create view for Trail events between 19-JUL-2025 and 23-JUL-2025
CREATE OR REPLACE VIEW Trail_Event_View AS
SELECT g.GUIDE_ID,
       c.CLIENT_ID,
       c.CLIENT_ADDRESS,
       t.TRAIL_DURATION
FROM Trail_Event te
JOIN Guide g ON te.GUIDE_ID = g.GUIDE_ID
JOIN Client c ON te.CLIENT_ID = c.CLIENT_ID
JOIN Trail t ON te.TRAIL_ID = t.TRAIL_ID
WHERE te.EVENT_DATE BETWEEN '19-JUL-2025' AND '23-JUL-2025';

-- A query to display the view
SELECT * FROM Trail_Event_View;

-- QUESTION 4: Client Details Procedure
CREATE OR REPLACE PROCEDURE Client_Details(
    p_client_id IN Client.CLIENT_ID%TYPE,
    p_trail_date IN DATE
) IS
    v_client_name VARCHAR2(100);
    v_trail_name Trail.TRAIL_NAME%TYPE;
    v_found BOOLEAN := FALSE;
    
    CURSOR client_booking_cursor IS
        SELECT c.CLIENT_FNAME || ' ' || c.CLIENT_SNAME AS full_name,
               t.TRAIL_NAME
        FROM Client c
        JOIN Trail_Event te ON c.CLIENT_ID = te.CLIENT_ID
        JOIN Trail t ON te.TRAIL_ID = t.TRAIL_ID
        WHERE c.CLIENT_ID = p_client_id
        AND TRUNC(te.EVENT_DATE) = TRUNC(p_trail_date);
        
BEGIN
    OPEN client_booking_cursor;
    FETCH client_booking_cursor INTO v_client_name, v_trail_name;
    
    IF client_booking_cursor%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('CUSTOMER DETAILS: ' || v_client_name || 
                             ' booked for the ' || v_trail_name || 
                             ' on the ' || TO_CHAR(p_trail_date, 'DD/MON/YY') || '.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('No booking found for Client ID: ' || p_client_id || 
                             ' on date: ' || TO_CHAR(p_trail_date, 'DD-MON-YYYY'));
    END IF;
    
    CLOSE client_booking_cursor;
    
EXCEPTION
    WHEN OTHERS THEN
        IF client_booking_cursor%ISOPEN THEN
            CLOSE client_booking_cursor;
        END IF;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END Client_Details;
/

-- Testing the procedure
BEGIN
    Client_Details('CL101', TO_DATE('15-JUL-2025', 'DD-MON-YYYY'));
END;
/

-- QUESTION 5: fnClientReport Function
CREATE OR REPLACE FUNCTION fnClientReport(
    p_client_id IN Client.CLIENT_ID%TYPE
) RETURN VARCHAR2 IS
    v_output VARCHAR2(4000) := '';
    v_client_exists NUMBER := 0;
    
    CURSOR client_trails_cursor IS
        SELECT c.CLIENT_ID,
               te.TRAIL_ID,
               te.EVENT_DATE,
               t.TRAIL_COST
        FROM Client c
        JOIN Trail_Event te ON c.CLIENT_ID = te.CLIENT_ID
        JOIN Trail t ON te.TRAIL_ID = t.TRAIL_ID
        WHERE c.CLIENT_ID = p_client_id
        ORDER BY te.EVENT_DATE;
        
BEGIN
    SELECT COUNT(*) INTO v_client_exists
    FROM Client
    WHERE CLIENT_ID = p_client_id;
    
    IF v_client_exists = 0 THEN
        RETURN 'Error: Client ID ' || p_client_id || ' does not exist.';
    END IF;
    
    FOR trail_rec IN client_trails_cursor LOOP
        v_output := v_output || 'Client: ' || trail_rec.CLIENT_ID || 
                    ' | Trail: ' || trail_rec.TRAIL_ID || 
                    ' | Date: ' || TO_CHAR(trail_rec.EVENT_DATE, 'DD-MON-YYYY') || 
                    ' | Cost: R' || trail_rec.TRAIL_COST || CHR(10);
    END LOOP;
    
    IF v_output IS NULL THEN
        RETURN 'Client ' || p_client_id || ' has no trail bookings.';
    END IF;
    
    RETURN v_output;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'No data found for client: ' || p_client_id;
    WHEN OTHERS THEN
        RETURN 'Error: ' || SQLERRM;
END fnClientReport;
/

-- Testing the function
DECLARE
    v_result VARCHAR2(4000);
BEGIN
    v_result := fnClientReport('CL101');
    DBMS_OUTPUT.PUT_LINE(v_result);
END;
/
