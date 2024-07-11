CREATE TABLE Customers (
    CustomerID int PRIMARY KEY,
    FirstName varchar(50) NOT NULL,
    LastName varchar(50) NOT NULL,
    Email varchar(100),
    Phone varchar(20),
    Address varchar(200),
    City varchar(50),
    State varchar(50),
    ZipCode varchar(10),
    Country varchar(50)
);

CREATE TABLE Products (
    ProductID int PRIMARY KEY,
    ProductName varchar(100) NOT NULL,
    Category varchar(50),
    Price decimal(10, 2) NOT NULL,
    StockQuantity int NOT NULL
);

CREATE TABLE Employees (
    EmployeeID int PRIMARY KEY,
    FirstName varchar(50) NOT NULL,
    LastName varchar(50) NOT NULL,
    Title varchar(50),
    Email varchar(100),
    Phone varchar(20)
);

CREATE TABLE Orders (
    OrderID int PRIMARY KEY,
    CustomerID int NOT NULL,
    OrderDate datetime NOT NULL,
    TotalAmount decimal(10, 2) NOT NULL,
    EmployeeID int,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE OrderDetails (
    OrderDetailID int PRIMARY KEY,
    OrderID int NOT NULL,
    ProductID int NOT NULL,
    Quantity int NOT NULL,
    UnitPrice decimal(10, 2) NOT NULL,
    TotalPrice AS (Quantity * UnitPrice) PERSISTED,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
