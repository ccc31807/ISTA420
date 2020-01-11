-- File: tsql-ch08a.sql
-- Author: Charles Carter
-- Date: July 30, 2019

-------------------------------------------------------------------
-- Microsoft SQL Server T-SQL Fundamentals
-- Chapter 08 - Data Modification
-- Exercises
-- © Itzik Ben-Gan 
---------------------------------------------------------------------

-- The database assumed in the exercise is TSQLV4

-- 1
-- Run the following code to create the dbo.Customers table
-- in the TSQLV4 database
USE TSQLV4;

DROP TABLE IF EXISTS dbo.Customers;

CREATE TABLE dbo.Customers
(
  custid      INT          NOT NULL PRIMARY KEY,
  companyname NVARCHAR(40) NOT NULL,
  country     NVARCHAR(15) NOT NULL,
  region      NVARCHAR(15) NULL,
  city        NVARCHAR(15) NOT NULL  
);

-- 1-1
-- Insert into the dbo.Customers table a row with:
-- custid:  100
-- companyname: Coho Winery
-- country:     USA
-- region:      WA
-- city:        Redmond

insert into dbo.customers values(100, 'Coho Winery', 'USA', 'WA', 'Redmond');
select * from dbo.Customers;
-- 1-2
-- Insert into the dbo.Customers table 
-- all customers from Sales.Customers
-- who placed orders

insert into dbo.customers (custid, companyname, country, region, city)
select custid, companyname, country, region, city
from sales.customers;
select * from dbo.customers;
-- 1-3
-- Use a SELECT INTO statement to create and populate the dbo.Orders table
-- with orders from the Sales.Orders
-- that were placed in the years 2014 through 

drop table if exists dbo.orders;

SELECT [orderid]
      ,[custid]
      ,[empid]
      ,[orderdate]
      ,[requireddate]
      ,[shippeddate]
      ,[shipperid]
      ,[freight]
      ,[shipname]
      ,[shipaddress]
      ,[shipcity]
      ,[shipregion]
      ,[shippostalcode]
      ,[shipcountry]
	  into dbo.orders -- the line we added to SELECT INTO
  FROM [Sales].orders
  where orderdate >= '2014-01-01' and orderdate <= '2016-12-31';

  select * from dbo.orders;


select * from dbo.orders;



-- 2
-- credit card defaults
drop table if exists dbo.CreditCardDefault;
create table dbo.CreditCardDefault (
ID int,
LIMIT_BAL int,
SEX int,
EDUCATION int,
MARRIAGE int,
AGE int,
PAY_0 int,
PAY_2 int,
PAY_3 int,
PAY_4 int,
PAY_5 int,
PAY_6 int,
BILL_AMT1 int,
BILL_AMT2 int,
BILL_AMT3 int,
BILL_AMT4 int,
BILL_AMT5 int,
BILL_AMT6 int,
PAY_AMT1 int,
PAY_AMT2 int,
PAY_AMT3 int,
PAY_AMT4 int,
PAY_AMT5 int,
PAY_AMT6 int,
payment int);

bulk insert dbo.CreditCardDefault
from 'd:\ista420\data\default-of-credit-card-clients.csv'
with (
DATAFILETYPE = 'char',
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n',
FIRSTROW=2
);
select * from dbo.CreditCardDefault;

