CREATE DATABASE ConSoleGame

USE ConSoleGame
CREATE TABLE Brand
(
  BrandID INT IDENTITY(1,1) NOT NULL,
  BrandName NVARCHAR(100) NOT NULL,
  PRIMARY KEY (BrandID)
);

CREATE TABLE Category
(
  CategoryID  INT IDENTITY(1,1) NOT NULL,
  CategoryName  NVARCHAR(100) NOT NULL,
  PRIMARY KEY (CategoryID)
);

CREATE TABLE Account
(
 AccID INT IDENTITY(1,1) NOT NULL,
  Email CHAR(300) NOT NULL,
  Password CHAR(64) NOT NULL,
  FirstName NVARCHAR(100) NOT NULL,
  LastName NVARCHAR(100) NOT NULL,
  Country NVARCHAR(100) NOT NULL,
  Address NVARCHAR(300) NOT NULL,
  Role NVARCHAR(50) NOT NULL,
  PhoneNumber CHAR(11) NOT NULL,
  Birthday DATE NOT NULL,
  PRIMARY KEY (AccID)
);

CREATE TABLE Supplier
(
  SupID INT IDENTITY(1,1) NOT NULL,
  SupName NVARCHAR(100) NOT NULL,
  Country NVARCHAR(100) NOT NULL,
  Address NVARCHAR(300) NOT NULL,
  PhoneNumber CHAR(11) NOT NULL,
  PRIMARY KEY (SupID)
);

CREATE TABLE Employee
(
  EmpID INT IDENTITY(1,1) NOT NULL,
  FirstName NVARCHAR(100) NOT NULL,
  LastName NVARCHAR(100) NOT NULL,
  Birthday DATE NOT NULL,
  Role VARCHAR(50) NOT NULL,
  Country NVARCHAR(100) NOT NULL,
  Address NVARCHAR(300) NOT NULL,
  PhoneNumber CHAR(11) NOT NULL,
  PRIMARY KEY (EmpID)
);

CREATE TABLE Product
(
  ProID INT IDENTITY(1,1) NOT NULL,
  ProName NVARCHAR(100) NOT NULL,
  Price MONEY NOT NULL,
  CategoryID INT NOT NULL,
  BrandID INT NOT NULL,
  Description NVARCHAR(700) NOT NULL,
  PRIMARY KEY (ProID),
  FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),
  FOREIGN KEY (BrandID) REFERENCES Brand(BrandID)
);

CREATE TABLE Orders
(
  OrdID INT IDENTITY(1,1) NOT NULL,
  RequiredDate DATE NOT NULL,
  ShippedDate DATE NOT NULL,
  ShipAdress NVARCHAR(300) NOT NULL,
  ShipCountry NVARCHAR(100) NOT NULL,
  AccID INT NOT NULL,
  EmpID INT NOT NULL,
  PRIMARY KEY (OrdID),
  FOREIGN KEY (AccID) REFERENCES Account(AccID),
  FOREIGN KEY (EmpID) REFERENCES Employee(EmpID)
);

CREATE TABLE Barn
(
  Amount INT NOT NULL,
  ProID INT NOT NULL,
  FOREIGN KEY (ProID) REFERENCES Product(ProID)
);

CREATE TABLE InputBill
(
  InputID INT IDENTITY(1,1) NOT NULL,
  Amount INT NOT NULL,
  InputDate DATE NOT NULL,
  SupID INT NOT NULL,
  ProID INT NOT NULL,
  PRIMARY KEY (InputID),
  FOREIGN KEY (SupID) REFERENCES Supplier(SupID),
  FOREIGN KEY (ProID) REFERENCES Product(ProID)
);

CREATE TABLE OrderDetail
(
  Quantity INT NOT NULL,
  Price MONEY NOT NULL,
  Discount FLOAT NOT NULL,
  OrderDate DATE NOT NULL,
  OrdID INT NOT NULL,
  ProID INT NOT NULL,
  FOREIGN KEY (OrdID) REFERENCES Orders(OrdID),
  FOREIGN KEY (ProID) REFERENCES Product(ProID)
);