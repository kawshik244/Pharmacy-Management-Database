--Dropping the existing tables

drop table Orders;
drop table Customers;
drop table Medicines;
drop table Suppliers;


--table creation
create table Suppliers (
  Supplier_Id INT PRIMARY KEY NOT NULL,
  SupplierName VARCHAR(20),
  Phone VARCHAR(50),
  Experience VARCHAR(20),
  Address VARCHAR(50)
);



create table Medicines (
  Medicine_Id INT PRIMARY KEY NOT NULL,
  Medicine_Name VARCHAR(50),
  Medicine_Price VARCHAR(50),
  Medicine_Quantity VARCHAR(50),
  Supplier_Id INT,
  FOREIGN KEY(Supplier_Id) references Suppliers(Supplier_Id) on delete cascade
);
create table Customers (
  Customer_Id INT PRIMARY KEY NOT NULL,
  CustomerName VARCHAR(20),
  Phone VARCHAR(50),
  Address VARCHAR(50)
);


CREATE TABLE Orders (
  Order_Id INT PRIMARY KEY NOT NULL,
  Customer_Id INT,
  Medicine_Id INT,
  Price VARCHAR(50),
  OrderDate DATE,
  FOREIGN KEY (Customer_Id) references Customers(Customer_Id)  on delete cascade,
  FOREIGN KEY (Medicine_Id) references Medicines(Medicine_Id) on delete cascade
);



--(ALTER TABLE)
ALTER TABLE Suppliers 
ADD
Email VARCHAR(20);
DESC Suppliers;

--(MODIFY COLUMN DATATYPE)
ALTER TABLE Suppliers 
MODIFY
Email CHAR(50);
DESC Suppliers;

--(MODIFY COLUMN NAME)
ALTER TABLE Suppliers 
RENAME 
COLUMN Email to Mail;
DESC Suppliers;

--(DROP COLUMN)
ALTER TABLE Suppliers
DROP COLUMN Mail;
DESC Suppliers;

 