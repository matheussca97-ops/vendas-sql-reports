LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Categories.csv'
INTO TABLE categories
FIELDS TERMINATED BY ';'      
ENCLOSED BY ''                
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Customers.csv'
INTO TABLE customers
FIELDS TERMINATED BY ';'      
ENCLOSED BY ''                
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Employees.csv'
INTO TABLE employees
FIELDS TERMINATED BY ';'      
ENCLOSED BY ''                
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/OrderDetails.csv'
INTO TABLE orderDetails
FIELDS TERMINATED BY ';'      
ENCLOSED BY ''                
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/products.csv'
INTO TABLE products
FIELDS TERMINATED BY ';'      
ENCLOSED BY ''                
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Shippers.csv'
INTO TABLE shippers
FIELDS TERMINATED BY ';'      
ENCLOSED BY ''                
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Suppliers.csv'
INTO TABLE suppliers
FIELDS TERMINATED BY ';'      
ENCLOSED BY ''                
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Orders.csv'
INTO TABLE orders
FIELDS TERMINATED BY ';'      
ENCLOSED BY ''                
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(OrderID, CustomerID, EmployeeID, @OrderDate, ShipperID)
SET Orderdate = str_to_date(@OrderDate, '%d/%m/%Y')
;
