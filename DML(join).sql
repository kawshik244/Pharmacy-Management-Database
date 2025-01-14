--(NATURAL JOIN)the query retrieves the CustomerName, Medicine_Name, Price, and OrderDate from the Customers, Orders, and Medicines tables. It performs natural joins between these tables

SELECT c.CustomerName, m.Medicine_Name, o.Price, o.OrderDate
FROM Customers c
NATURAL JOIN Orders o
NATURAL JOIN Medicines m
WHERE o.Price > 1000
  AND m.Supplier_Id = 3;



--(CROSS JOIN)This query will return all possible combinations of rows from both tables. 

SELECT *
FROM Suppliers
CROSS JOIN Medicines;


--To understand join more clearly let's add some extra rows.


INSERT INTO Medicines VALUES(11, 'Ciprofloxacin', '14', '1900', '3');
INSERT INTO Medicines VALUES(12, 'Diazepam', '9', '1400', '4');
INSERT INTO Medicines VALUES(13, 'Fluoxetine', '7', '1000', '6');


--(LEFT JOIN) The LEFT JOIN keyword returns all records from the left table, even if there are no matches in the right table

SELECT Suppliers.Supplier_Id, Suppliers.SupplierName, Medicines.Medicine_Name
FROM Suppliers
LEFT JOIN Medicines ON Suppliers.Supplier_Id = Medicines.Supplier_Id;



--(RIGHT JOIN) The RIGHT JOIN keyword returns all records from the right table , even if there are no matches in the left table.


SELECT Suppliers.Supplier_Id, Suppliers.SupplierName, Medicines.Medicine_Name
FROM Suppliers
RIGHT JOIN Medicines ON Suppliers.Supplier_Id = Medicines.Supplier_Id;



--(FULL JOIN) The FULL OUTER JOIN keyword returns all matching records from both tables whether the other table matches or not. 

SELECT Suppliers.Supplier_Id, Suppliers.SupplierName, Medicines.Medicine_Name
FROM Suppliers
FULL JOIN Medicines ON Suppliers.Supplier_Id = Medicines.Supplier_Id;


--(INNER JOIN) Almost like natural join but..
Inner Join joins two table on the basis of the column which is explicitly specified in the ON clause. it'll contain duplicate columns

SELECT Suppliers.Supplier_Id, Suppliers.SupplierName, Medicines.Medicine_Name
FROM Suppliers
INNER JOIN Medicines ON Suppliers.Supplier_Id = Medicines.Supplier_Id;




--(VIEW)  a view named "CustomerOrders" is created. It combines data from the Customers and Orders tables using an inner join on the Customer_Id column. The SELECT statement defines the columns to be included in the view. 


DROP VIEW CustomerOrders;


CREATE VIEW CustomerOrders AS
SELECT Customers.Customer_Id, Customers.CustomerName, Orders.Order_Id, Orders.Price
FROM Customers
INNER JOIN Orders ON Customers.Customer_Id = Orders.Customer_Id;

SELECT * FROM CustomerOrders;



