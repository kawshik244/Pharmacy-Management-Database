--(Insert) into tables
INSERT INTO Suppliers VALUES(1, 'ACI', '+8801871294953', '10', 'Gazipur,Dhaka');
INSERT INTO Suppliers VALUES(2, 'XYZ Company', '+8801871294954', '15', 'Gazipur,Dhaka');
INSERT INTO Suppliers VALUES(3, 'ABC Corporation', '+8801871294955', '20', 'Banani,Dhaka');
INSERT INTO Suppliers VALUES(4, 'PQR Industries', '+8801871294956', '12', 'Dhanmondi,Dhaka');
INSERT INTO Suppliers VALUES(5, 'LMN Enterprises', '+8801871294957', '8', 'Banani,Dhaka');
INSERT INTO Suppliers VALUES(6, 'RST Ltd.', '+8801871294958', '10', 'Dhanmondi,Dhaka');
INSERT INTO Suppliers VALUES(7, 'UVW Company', '+8801871294959', '5', 'Motijheel,Dhaka');
INSERT INTO Suppliers VALUES(8, 'EFG Corporation', '+8801871294960', '18', 'Banani,Dhaka');
INSERT INTO Suppliers VALUES(9, 'HIJ Industries', '+8801871294961', '15', 'Motijheel,Dhaka');
INSERT INTO Suppliers VALUES(10, 'KLM Enterprises', '+8801871294962', '10', 'Gazipur,Dhaka');

INSERT INTO Medicines VALUES(1, 'Paracetemol', '10', '2000', '3'); 
INSERT INTO Medicines VALUES(2, 'Ibuprofen', '8', '1500', '1');
INSERT INTO Medicines VALUES(3, 'Aspirin', '12', '1800', '2');
INSERT INTO Medicines VALUES(4, 'Amoxicillin', '15', '2200', '3');
INSERT INTO Medicines VALUES(5, 'Loratadine', '6', '1200', '4');
INSERT INTO Medicines VALUES(6, 'Omeprazole', '10', '2500', '5');
INSERT INTO Medicines VALUES(7, 'Simvastatin', '5', '900', '6');
INSERT INTO Medicines VALUES(8, 'Metformin', '18', '2800', '7');
INSERT INTO Medicines VALUES(9, 'Losartan', '10', '2000', '8');
INSERT INTO Medicines VALUES(10, 'Levothyroxine', '10', '1800', '9');

INSERT INTO customers VALUES(1, 'Kawshik', '+8801948205490', '36,kakrail,Dhaka'); 
INSERT INTO customers VALUES(2, 'Rahim', '+8801948205491', '20,Mirpur,Dhaka');
INSERT INTO customers VALUES(3, 'Karim', '+8801948205492', '10,Banani,Dhaka');
INSERT INTO customers VALUES(4, 'Aisha', '+8801948205493', '15,Uttara,Dhaka');
INSERT INTO customers VALUES(5, 'Fatima', '+8801948205494', '8,Mohakhali,Dhaka');
INSERT INTO customers VALUES(6, 'Ahmed', '+8801948205495', '25,Gulshan,Dhaka');
INSERT INTO customers VALUES(7, 'Sara', '+8801948205496', '30,Dhanmondi,Dhaka');
INSERT INTO customers VALUES(8, 'Ali', '+8801948205497', '18,Motijheel,Dhaka');
INSERT INTO customers VALUES(9, 'Fahim', '+8801948205498', '22,Nikunja,Dhaka');
INSERT INTO customers VALUES(10, 'Nadia', '+8801948205499', '12,Badda,Dhaka');


INSERT INTO orders VALUES(1, '3', '2', '1200',TO_DATE('2023-05-19', 'YYYY-MM-DD')); 
INSERT INTO orders VALUES(2, '5', '4', '1500', TO_DATE('2023-08-10', 'YYYY-MM-DD'));
INSERT INTO orders VALUES(3, '1', '6', '900', TO_DATE('2023-09-01', 'YYYY-MM-DD'));
INSERT INTO orders VALUES(4, '2', '3', '1800', TO_DATE('2023-07-15', 'YYYY-MM-DD'));
INSERT INTO orders VALUES(5, '4', '8', '2000', TO_DATE('2023-10-02', 'YYYY-MM-DD'));
INSERT INTO orders VALUES(6, '7', '10', '2500', TO_DATE('2023-06-27', 'YYYY-MM-DD'));
INSERT INTO orders VALUES(7, '6', '5', '1200', TO_DATE('2023-11-08', 'YYYY-MM-DD'));
INSERT INTO orders VALUES(8, '9', '9', '2200', TO_DATE('2023-12-05', 'YYYY-MM-DD'));
INSERT INTO orders VALUES(9, '10', '7', '1800', TO_DATE('2023-09-19', 'YYYY-MM-DD'));
INSERT INTO orders VALUES(10, '8', '1', '1500', TO_DATE('2023-07-31', 'YYYY-MM-DD'));






--(INSERT) a row again

INSERT INTO Suppliers (Supplier_Id, SupplierName, Phone, Experience, Address)
VALUES (11, 'Beximco Pharma', '+8801871294963', '25 years', 'Dhaka, Bangladesh');

--(DISPLAY) a whole table

select customer_id,customername from customers;

--(UPDATE) a row

UPDATE Suppliers SET Experience = '40 years' where Supplier_id = 11;

--(DELETE) a row

delete from Suppliers where Supplier_id = 11;

--(AGGREGATE FUNCTION)(COUNT) Count the number of suppliers with an experience of more than 10 years

SELECT COUNT(*) FROM Suppliers WHERE Experience > '10 years';

--(AGGREGATE FUNCTION)(AVG) Calculate the average price of all medicines

SELECT AVG(Medicine_Price) FROM Medicines;

--(AGGREGATE FUNCTION)(SUM) Calculate the total price of all orders

SELECT SUM(Price) FROM Orders;

--(GROUP BY) This query will return the address of each supplier and the total number of suppliers grouped by address.

SELECT Address, COUNT(*) AS TotalSuppliers
FROM Suppliers
GROUP BY Address;

--(GORUP BY AND HAVING)  This query will return the address of each supplier and the total number of suppliers grouped by address having suppliers greater or equal than 3
SELECT Address, COUNT(*) AS TotalSuppliers
FROM Suppliers
GROUP BY Address
HAVING COUNT(*) >= 3;

--(UNION) This query will retrieve the names and addresses of both suppliers and customers, combining them into a single result set without any duplicate rows.

SELECT SupplierName, Address FROM Suppliers
UNION
SELECT CustomerName, Address FROM Customers;


--(SOME)  we're selecting the medicine names from the "Medicines" table where the quantity is greater than some of the quantities associated with medicines supplied by supplier with Supplier_Id = 3.

SELECT Medicine_Name
FROM Medicines
WHERE Medicine_Quantity > SOME (
  SELECT Medicine_Quantity
  FROM Medicines
  WHERE Supplier_Id = 3
);


--(ALL)  we're selecting all columns from the "Suppliers" table where the experience is greater than the experience of all other suppliers (excluding the supplier with Supplier_Id = 1).

SELECT *
FROM Suppliers
WHERE Experience > ALL (
  SELECT Experience
  FROM Suppliers
  WHERE Supplier_Id <> 1
);


--(EXIST)  The subquery within the EXISTS clause checks if there is at least one record with a matching "Supplier_Id" in the "Medicines" table.

SELECT SupplierName
FROM Suppliers
WHERE EXISTS (
  SELECT 1
  FROM Medicines
  WHERE Medicines.Supplier_Id = Suppliers.Supplier_Id
);



--(Nested Query) This nested query is used to find the names of customers who have placed orders with a price higher than 1500. 

SELECT CustomerName
FROM Customers
WHERE Customer_Id IN (
    SELECT Customer_Id
    FROM Orders
    WHERE Price > 1500
);


--(IN) the subquery retrieves the Supplier_Id values from the Suppliers table where the Address is 'Banani,Dhaka'.

SELECT *
FROM Medicines
WHERE Supplier_Id IN (
    SELECT Supplier_Id
    FROM Suppliers
    WHERE Address = 'Banani,Dhaka'
);


--(ORDER BY-DESC) the result set of the query will be sorted in descending order based on the Medicine_Name column

SELECT *
FROM Medicines
ORDER BY Medicine_Name DESC;



--(ORDER BY-ASC-Default)the result set of the query will be sorted in ascending order based on the Medicine_Name column.


SELECT *
FROM Medicines
ORDER BY Medicine_Name ASC;



--(WITH CLAUSE)It selects all the medicines from the Medicines table that have a price greater than '10'. The main query then selects all columns from the high_price_medicines table

WITH high_price_medicines AS (
    SELECT *
    FROM Medicines
    WHERE Medicine_Price > '10'
)
SELECT *
FROM high_price_medicines;



--(AND OR)(STRING OPERATION)It retrieve all medicines from the Medicines table where the medicine name contains either "Paracetemol" or "Ibuprofen" and the quantity is greater than or equal to 1000

SELECT *
FROM Medicines
WHERE (Medicine_Name LIKE '%Paracetemol%' OR Medicine_Name LIKE '%Ibuprofen%')
  AND CAST(Medicine_Quantity AS INT) >= 1000;


--(distinct)the query selects distinct values from the Medicine_Name column of the Medicines table

SELECT DISTINCT Medicine_Name
FROM Medicines;




