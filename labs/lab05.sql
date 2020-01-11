-- Name: Charles Cartr
-- File: lab05.sql
-- Date: January 28, 2019

-- 1
SELECT orderid, orderdate, custid, empid,
DATEFROMPARTS(YEAR(orderdate), 12, 31) AS endofyear
FROM Sales.Orders
WHERE orderdate <> DATEFROMPARTS(YEAR(orderdate), 12, 31);

WITH C AS
(
SELECT *,
DATEFROMPARTS(YEAR(orderdate), 12, 31) AS endofyear
FROM Sales.Orders
)
SELECT orderid, orderdate, custid, empid, endofyear
FROM C
WHERE orderdate <> endofyear;

-- 2
select empid, max(orderdate) as maxorderdate
  from sales.orders group by empid;

select o.empid, o.orderid, o.custid, d.maxorderdate
from sales.orders o join
  (select empid, max(orderdate) as maxorderdate
  from sales.orders group by empid) d
  on o.orderdate = d.maxorderdate 
  and o.empid = d.empid;

with d as
(select empid, max(orderdate) as maxorderdate
  from sales.orders group by empid)
select o.empid, o.orderid, o.custid, d.maxorderdate
from sales.Orders o join d on
  o.empid = d.empid and
  o.orderdate = d.maxorderdate;

-- 3
WITH OrdersRN AS
(
SELECT orderid, orderdate, custid, empid,
ROW_NUMBER() OVER(ORDER BY orderdate, orderid) AS rownum
FROM Sales.Orders
)
SELECT * FROM OrdersRN WHERE rownum BETWEEN 11 AND 20;

-- 4
select o.empid, year(o.orderdate) as orderyear, sum(od.qty) as qtysum
  from sales.orders o join Sales.OrderDetails od 
  on o.orderid = od.orderid group by o.empid, year(o.orderdate)
  order by o.empid, year(o.orderdate);

drop view if exists sales.vemporders;
go
create view sales.vemporders as
(select o.empid, year(o.orderdate) as orderyear, sum(od.qty) as qtysum
  from sales.orders o join Sales.OrderDetails od 
  on o.orderid = od.orderid group by o.empid, year(o.orderdate));
go

SELECT * FROM Sales.VEmpOrders ORDER BY empid, orderyear;