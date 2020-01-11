-- Name: Charles Carter
-- File: TSQL-lab2c.sql
-- Date: August 20, 2018

use TSQLV4;

--1
select orderid, orderdate, custid, empid from sales.orders
  where orderdate like N'2015-06-%';

--2
select orderid, orderdate, custid, empid from sales.orders
  where orderdate = eomonth(orderdate);

--3
select firstname, lastname, empid from hr.employees where
  lastname like N'%e%e%';

--4
select orderid, sum(qty * unitprice) as totalvalue from sales.orderdetails
  group by orderid having sum(qty * unitprice) > 10000; 

--5 
select lastname from hr.employees where lastname 
  COLLATE Latin1_General_CS_AS like N'[abcdefghijklmnoqrstuvwzyz]%';

--6
-- Query 1
SELECT empid, COUNT(*) AS numorders
FROM Sales.Orders
WHERE orderdate < '20160501'
GROUP BY empid;
-- Query 2
SELECT empid, COUNT(*) AS numorders
FROM Sales.Orders
GROUP BY empid
HAVING MAX(orderdate) < '20160501';

--7
select top 3 shipcountry, avg(freight) as avgfreight from sales.orders 
  where orderdate like N'2015-%' group by shipcountry order by avg(freight) desc;

--9
select empid, firstname, lastname, titleofcourtesy, 
  case titleofcourtesy 
    when 'Ms.' then 'Female'
	when 'Dr.' then 'Unknown'
	when 'Mrs.' then 'Female'
	when 'Mr.' then 'Male'
	else 'It'
  end as gender 
from hr.Employees;
