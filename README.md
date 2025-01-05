# SQL-Northwind-Portfolio-Project

This repository contains data for a fictional company, Northwind Traders, which imports and exports specialty foods globally. The database includes various tables that store information about customers, orders, employees, products, suppliers, and more, emulating a real-world business environment. It serves as a useful resource for practicing SQL queries, designing database schemas, and gaining a deeper understanding of relational database concepts.


# Table of Contents
Tables

Relationship

Queries and Answers

Summary

# Tables 
The Northwind database consists of several interconnected tables, each representing a different aspect of the business:
Tables included are Customers, Employees, Orders, Order details, Products, Categories, Suppliers, Shippers, Regions and Territories.

# Relationship

The database includes several relationships between tables, representing how different business aspects are connected:

Orders are linked to Customers by the CustomerID

Orders are processed by Employees (via the EmployeeID)

Order Details relate to Orders through the OrderID and to Products through the ProductID.

Products are supplied by Suppliers via the SupplierID.

Products belong to Categories via the CategoryID.

# Queries and Answers
Northwind queries.sql contains a list of sample queries with answers using the northwind database. 

# Summary
The Northwind database is an excellent tool for gaining practical knowledge of relational databases and SQL. It serves as a real-world example of how businesses organize and manage their data, making it ideal for students, developers, and database administrators alike. By exploring the database and executing queries, you can develop hands-on skills in data manipulation, reporting, and understanding intricate relationships between different data sets.
