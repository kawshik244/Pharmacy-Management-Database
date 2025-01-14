
# Pharmacy Management 


This is a README file providing an overview of the database structure and queries used in the project.

## Database Diagram
![](https://github.com/kawshik244/Pharmacy-Management-Database/blob/main/db_schema.png)

## Database Overview
The database consists of several tables that store information related to users, items, transactions, admins, and user history. Here's a brief description of each table:

- **Suppliers**: Stores supplier information such as supplier ID, name, phone, experience and address.
- **Medicines**: Contains details about different medicines including medicine id, name, price, quantity and supplier id.
- **Customers**: Tracks the customer ID, name, phone and address.
- **Orders**: Stores information about orders, including the order id, customer id, medicine id, price and order date.

## SQL Queries

The project includes several SQL queries that demonstrate various operations and functionalities of the database. Here are some examples:

- **Data retrieval queries**: The initial queries retrieve information from tables such as Suppliers, Medicines, Customers and Orders.
- **DDL queries**: These queries demonstrate altering table structure by adding, modifying, renaming, and dropping columns in the users table.
- **DML queries**: The provided DML queries illustrate inserting, updating, and deleting rows from the users table.
- **Various select queries**: These queries showcase filtering, and joining data from different tables using different conditions.
- **Set membership queries**: These queries demonstrate the usage of AND, OR, EXISTS and ALL operators in conjunction with subqueries.
- **Aggregation queries**: These queries utilize aggregate functions such as COUNT, AVG, SUM, MIN, and MAX to retrieve statistical information from the database.
- **PL/SQL examples**: The PL/SQL queries demonstrate variable declarations, printing values, row type usage, cursor usage, IF-ELSE statements, functions, and procedures.

## PL/SQL Examples

The project demonstrates PL/SQL programming constructs and functionalities, such as:

1. **Variable Declaration and Usage**
   - Store and manipulate data within PL/SQL blocks.

2. **Procedures and Functions**
   - Create reusable procedures and functions to handle repetitive tasks.

3. **Cursor Usage**
   - Use cursors to iterate through query results.

4. **Control Structures**
   - Implement conditional logic with `IF-ELSE` and loops to handle complex logic.

5. **Error Handling**
   - Use exception handling to manage runtime errors gracefully.


Please note that these are just a few examples, and the project may contain more queries and functionalities.

---



## Conclusion

This README provides a brief summary of the database structure and queries used in the project. Further improvement may come
It showcases the tables, SQL queries, and PL/SQL examples to demonstrate different operations and functionalities of the database.
