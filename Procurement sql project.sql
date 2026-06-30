
CREATE DATABASE SupplyChain_Analytics;

USE SupplyChain_Analytics;


-- Create Table
CREATE TABLE Procurement_Data (
    PO_ID VARCHAR(20),
    Order_Date DATE,
    Supplier_Name VARCHAR(50),
    Material VARCHAR(50),
    Category VARCHAR(50),
    Quantity INT,
    Unit_Price DECIMAL(10,2),
    Total_Cost DECIMAL(12,2),
    Delivery_Date DATE,
    Expected_Date DATE,
    Delivery_Status VARCHAR(20),
    Lead_Time_Days INT,
    Location VARCHAR(50),
    Transport_Mode VARCHAR(20),
    Inventory_Status VARCHAR(30)
);

 insert  into Procurement_Data value
('PO1001','2026-01-02','ABC Suppliers','Steel Rod','Raw Material',500,120,60000,'2026-01-08','2026-01-07','Delayed',6,'Chennai','Road','Available');
insert into Procurement_Data value 
('PO1002','2026-01-05','Global Parts','Plastic Components','Components',1000,25,25000,'2026-01-10','2026-01-10','On Time',5,'Bangalore','Road','Available');
 insert into Procurement_Data value ('PO1003','2026-01-08','Prime Materials','Copper Wire','Raw Material',700,80,56000,'2026-01-15','2026-01-13','Delayed',7,'Coimbatore','Rail','Low Stock'),
('PO1004','2026-01-12','Tech Source','Electronic Parts','Components',300,250,75000,'2026-01-18','2026-01-18','On Time',6,'Hyderabad','Air','Available'),
('PO1005','2026-01-15','ABC Suppliers','Aluminium Sheet','Raw Material',400,150,60000,'2026-01-22','2026-01-20','Delayed',7,'Chennai','Road','Low Stock'),
('PO1006','2026-01-18','Fast Supply','Packaging Box','Packaging',2000,10,20000,'2026-01-23','2026-01-23','On Time',5,'Mumbai','Road','Available'),
('PO1007','2026-01-20','Global Parts','Bearing','Components',600,60,36000,'2026-01-27','2026-01-25','Delayed',7,'Pune','Rail','Available'),
('PO1008','2026-01-23','Prime Materials','Rubber Parts','Components',800,40,32000,'2026-01-28','2026-01-28','On Time',5,'Coimbatore','Road','Available'),
('PO1009','2026-01-25','Tech Source','Sensors','Electronics',200,500,100000,'2026-02-02','2026-01-31','Delayed',8,'Hyderabad','Air','Low Stock'),
('PO1010','2026-01-28','Fast Supply','Carton Box','Packaging',1500,15,22500,'2026-02-03','2026-02-03','On Time',6,'Mumbai','Road','Available');


SELECT * 
FROM Procurement_Data;

-- TOTAL PURCHASE ORDER 
select count(PO_ID) as Totalorder 
from Procurement_Data;


-- TOTAL PROCUREMENT COST 
select sum(Total_Cost) as Totalprocurement_cost 
from Procurement_Data;

-- SUPPLIER PERFORMANCE 
Select Supplier_Name , count(PO_ID) as total_order,
sum(Total_Cost) as purchase_value 
from Procurement_Data
group by Supplier_Name ;

-- ON DELIVERY %
SELECT 
( SUM(CASE WHEN Delivery_Status='On Time' THEN 1 ELSE 0 END) *100.0/
 COUNT(PO_ID)) AS On_Time_Percentage
FROM Procurement_Data;


-- Delayed Deliveries
SELECT *
FROM Procurement_Data
WHERE Delivery_Status='Delayed';


-- Average Lead Time
SELECT 
AVG(Lead_Time_Days) AS Average_Lead_Time
FROM Procurement_Data;


-- Top Suppliers by Cost
SELECT 
Supplier_Name,
SUM(Total_Cost) AS Total_Spending
FROM Procurement_Data
GROUP BY Supplier_Name
ORDER BY Total_Spending DESC;


-- Transport Mode Analysis
SELECT 
Transport_Mode,
COUNT(PO_ID) AS Orders
FROM Procurement_Data
GROUP BY Transport_Mode;


-- Inventory Status Report
SELECT 
Inventory_Status,
COUNT(*) AS Item_Count
FROM Procurement_Data
GROUP BY Inventory_Status;


--  Category Wise Purchase
SELECT 
Category,
SUM(Total_Cost) AS Category_Cost
FROM Procurement_Data
GROUP BY Category;
