create database vendas_sql_reports;
use vendas_sql_reporst;

CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    SupplierID INT NOT NULL,
    CategoryID INT NOT NULL,
    Unit VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
);


CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    LastName VARCHAR(100) NOT NULL,
    FirstName VARCHAR(100) NOT NULL,
    BirthDate DATE,
    Photo LONGBLOB,
    Notes TEXT
);


CREATE TABLE Shippers (
    ShipperID INT AUTO_INCREMENT PRIMARY KEY,
    ShipperName VARCHAR(100) NOT NULL,
    Phone VARCHAR(20)
);


CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL,
    Description TEXT
);


CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(255) NOT NULL,
    ContactName VARCHAR(255),
    Address VARCHAR(255),
    City VARCHAR(100),
    PostalCode VARCHAR(20),
    Country VARCHAR(100)
);


CREATE TABLE Suppliers (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    SupplierName VARCHAR(255) NOT NULL,
    ContactName VARCHAR(255),
    Address VARCHAR(255),
    City VARCHAR(100),
    PostalCode VARCHAR(20),
    Country VARCHAR(100),
    Phone VARCHAR(30)
);


CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL
);


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    EmployeeID INT NOT NULL,
    OrderDate DATE NOT NULL,
    ShipperID INT NOT NULL
);


ALTER TABLE Products
ADD CONSTRAINT FK_ProductSupplier
FOREIGN KEY (SupplierID)
REFERENCES Suppliers(SupplierID);


ALTER TABLE Products
ADD CONSTRAINT FK_ProductCategory
FOREIGN KEY (CategoryID)
REFERENCES Categories(CategoryID);


ALTER TABLE Orders
ADD CONSTRAINT FK_OrderCustomer
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);


ALTER TABLE Orders
ADD CONSTRAINT FK_OrderEmployee
FOREIGN KEY (EmployeeID)
REFERENCES Employees(EmployeeID);


ALTER TABLE Orders
ADD CONSTRAINT FK_OrderShipper
FOREIGN KEY (ShipperID)
REFERENCES Shippers(ShipperID);


ALTER TABLE OrderDetails
ADD CONSTRAINT FK_DetailOrder
FOREIGN KEY (OrderID)
REFERENCES Orders(OrderID);


ALTER TABLE OrderDetails
ADD CONSTRAINT FK_DetailProduct
FOREIGN KEY (ProductID)
REFERENCES Products(ProductID);
