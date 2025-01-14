--(variable declaration and print value)

SET SERVEROUTPUT ON;
DECLARE
  dept_id Suppliers.Supplier_Id%TYPE;
  supplier_name Suppliers.SupplierName%TYPE;
  phone Suppliers.Phone%TYPE;
  experience Suppliers.Experience%TYPE;
  address Suppliers.Address%TYPE;
BEGIN
  SELECT Supplier_Id, SupplierName, Phone, Experience, Address
  INTO dept_id, supplier_name, phone, experience, address
  FROM Suppliers
  WHERE Supplier_Id = 7;
  
  DBMS_OUTPUT.PUT_LINE('Supplier_Id: ' || dept_id);
  DBMS_OUTPUT.PUT_LINE('SupplierName: ' || supplier_name);
  DBMS_OUTPUT.PUT_LINE('Phone: ' || phone);
  DBMS_OUTPUT.PUT_LINE('Experience: ' || experience);
  DBMS_OUTPUT.PUT_LINE('Address: ' || address);
END;
/



--(Insert and set default value)


SET SERVEROUTPUT ON;
DECLARE
  supplier_id Suppliers.Supplier_Id%TYPE := 11;
  supplier_name Suppliers.SupplierName%TYPE := 'New Supplier';
  phone Suppliers.Phone%TYPE := '+8801871294963';
  experience Suppliers.Experience%TYPE := '5';
  address Suppliers.Address%TYPE := 'New Address';
BEGIN
  INSERT INTO Suppliers (Supplier_Id, SupplierName, Phone, Experience, Address)
  VALUES (supplier_id, supplier_name, phone, experience, address);
  
  DBMS_OUTPUT.PUT_LINE('Row inserted successfully.');
  DBMS_OUTPUT.PUT_LINE('Supplier_Id: ' || supplier_id);
  DBMS_OUTPUT.PUT_LINE('SupplierName: ' || supplier_name);
  DBMS_OUTPUT.PUT_LINE('Phone: ' || phone);
  DBMS_OUTPUT.PUT_LINE('Experience: ' || experience);
  DBMS_OUTPUT.PUT_LINE('Address: ' || address);
END;
/



--(ROW TYPE)  allows us to store the entire row of data from a table or cursor into a single variable.

SET SERVEROUTPUT ON;
DECLARE
  medicine_row Medicines%ROWTYPE;
  medicine_id Medicines.Medicine_Id%TYPE := 3;
BEGIN
  SELECT * INTO medicine_row FROM Medicines WHERE Medicine_Id = medicine_id;
  
  DBMS_OUTPUT.PUT_LINE('Medicine_Id: ' || medicine_row.Medicine_Id);
  DBMS_OUTPUT.PUT_LINE('Medicine_Name: ' || medicine_row.Medicine_Name);
  DBMS_OUTPUT.PUT_LINE('Medicine_Price: ' || medicine_row.Medicine_Price);
  DBMS_OUTPUT.PUT_LINE('Medicine_Quantity: ' || medicine_row.Medicine_Quantity);
  DBMS_OUTPUT.PUT_LINE('Supplier_Id: ' || medicine_row.Supplier_Id);
END;
/



--(Cursor and row count) This will count the row and by using loop we'll produce our outputs 


SET SERVEROUTPUT ON;
DECLARE
  CURSOR supplier_cursor IS
    SELECT * FROM Suppliers;
  supplier_row Suppliers%ROWTYPE;
BEGIN
  OPEN supplier_cursor;
  FETCH supplier_cursor INTO supplier_row;
  
  WHILE supplier_cursor%FOUND LOOP
    DBMS_OUTPUT.PUT_LINE('Supplier_Id: ' || supplier_row.Supplier_Id);
    DBMS_OUTPUT.PUT_LINE('SupplierName: ' || supplier_row.SupplierName);
    DBMS_OUTPUT.PUT_LINE('Phone: ' || supplier_row.Phone);
    DBMS_OUTPUT.PUT_LINE('Experience: ' || supplier_row.Experience);
    DBMS_OUTPUT.PUT_LINE('Address: ' || supplier_row.Address);
    DBMS_OUTPUT.PUT_LINE('Row count: ' || supplier_cursor%ROWCOUNT);
    
    FETCH supplier_cursor INTO supplier_row;
  END LOOP;
  
  CLOSE supplier_cursor;
END;
/



--(FOR LOOP/WHILE LOOP/ARRAY with extend() function)

SET SERVEROUTPUT ON
DECLARE
  counter NUMBER;
  med_name Medicines.Medicine_Name%TYPE;
  TYPE NEWARRAY IS VARRAY(7) OF Medicines.Medicine_Name%TYPE;
  PHARMA NEWARRAY := NEWARRAY();
BEGIN
  counter := 1;
  FOR x IN 2..8 LOOP
    SELECT Medicine_Name INTO med_name FROM Medicines WHERE Medicine_Id = x;
    PHARMA.EXTEND();
    PHARMA(counter) := med_name;
    counter := counter + 1;
  END LOOP;

  counter := 1;
  WHILE counter <= PHARMA.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE(PHARMA(counter));
    counter := counter + 1;
  END LOOP;
END;
/



--(ARRAY without extend() function)ARRAY without extend() function


SET SERVEROUTPUT ON
DECLARE 
   counter NUMBER := 1;
   med_name Medicines.Medicine_Name%TYPE;
   TYPE MEDICINE_ARRAY IS VARRAY(7) OF Medicines.Medicine_Name%TYPE;
   MEDICINE_NAMES MEDICINE_ARRAY := MEDICINE_ARRAY('Medicine 1', 'Medicine 2', 'Medicine 3', 'Medicine 4', 'Medicine 5', 'Medicine 6', 'Medicine 7'); 
   -- VARRAY with a size of 7 elements and initialized with some default medicine names
BEGIN
   counter := 1;
   FOR x IN 2..8  
   LOOP
      SELECT Medicine_Name INTO med_name FROM Medicines WHERE Medicine_Id = x;
      MEDICINE_NAMES(counter) := med_name;
      counter := counter + 1;
   END LOOP;
   counter := 1;
   WHILE counter <= MEDICINE_NAMES.COUNT 
   LOOP 
      DBMS_OUTPUT.PUT_LINE(MEDICINE_NAMES(counter)); 
      counter := counter + 1;
   END LOOP;
END;
/



--(if/elseif/else)

SET SERVEROUTPUT ON
DECLARE 
   counter NUMBER := 1;
   med_name Medicines.Medicine_Name%TYPE;
   TYPE MEDICINE_ARRAY IS VARRAY(5) OF Medicines.Medicine_Name%TYPE;
   MEDICINE_NAMES MEDICINE_ARRAY := MEDICINE_ARRAY('Medicine 1', 'Medicine 2', 'Medicine 3', 'Medicine 4', 'Medicine 5');
   -- VARRAY with a fixed size of 5 elements and initialized with medicine names
BEGIN
   FOR x IN 2..8  
   LOOP
      SELECT Medicine_Name INTO med_name FROM Medicines WHERE Medicine_Id = x;
      
      IF med_name = 'medicine A' THEN
         dbms_output.put_line(med_name || ' is a type A medicine');
      ELSIF med_name = 'medicine B' THEN
         dbms_output.put_line(med_name || ' is a type B medicine');
      ELSE 
         dbms_output.put_line(med_name || ' is a medicine of another type');
      END IF;
   END LOOP;
END;
/


--(Procedure)

CREATE OR REPLACE PROCEDURE proc3(
  var1 IN Medicines.Medicine_Id%TYPE,
  var2 OUT Medicines.Medicine_Name%TYPE,
  var3 OUT NUMBER
)
AS
  t_show CHAR(30);
BEGIN
  t_show := 'From procedure: ';
  SELECT Medicine_Name INTO var2 FROM Medicines WHERE Medicine_Id = var1;
  var3 := var1 * 2; 
  DBMS_OUTPUT.PUT_LINE(t_show || var2 || ' with ID ' || var1 || ' multiplied by 2 is ' || var3);
END;
/

SET SERVEROUTPUT ON
DECLARE 
  medicine_id Medicines.Medicine_Id%TYPE := 3;
  medicine_name Medicines.Medicine_Name%TYPE;
  result NUMBER;
BEGIN
  proc3(medicine_id, medicine_name, result);
END;
/


--(Function)

drop function GetTotalOrders;

CREATE OR REPLACE FUNCTION GetTotalOrders(
  customer IN INT
) RETURN NUMBER
AS
  total_order NUMBER;
BEGIN
  SELECT Price INTO total_order  FROM Orders
  WHERE Customer_Id = customer;
  
  RETURN total_order;
END;
/

SET SERVEROUTPUT ON;

DECLARE
  v_customer_id INT := 1; -- Replace with the desired account ID
  v_total_order NUMBER;
BEGIN
  v_total_order := GetTotalOrders(v_customer_id);
  DBMS_OUTPUT.PUT_LINE('Total Order: ' || v_total_order);
END;
/







