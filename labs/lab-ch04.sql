-- Name: Chares Carter
-- File: lab-ch04.sql
-- Date: August 27, 2018

--1
select orderid, orderdate, custid, empid from sales.Orders
  where orderdate = (select max(orderdate) from sales.Orders)
  order by orderid desc; 

--2
select custid, empid, orderdate, orderid from sales.orders
  where custid =
(select top 1 custid from sales.orders
  group by custid order by count(orderid) desc);

--3
select e.empid, e.firstname, e.lastname from hr.employees e
  where e.empid not in 
(select distinct o.empid from sales.orders o 
  where o.orderdate >= '2016-05-01')

--4
select distinct c.country from sales.Customers c
  where c.country not in
  (select distinct e.country from hr.employees e);

--5
select o1.custid, o1.orderid, o1.orderdate, o1.empid
  from sales.orders o1
  where o1.orderdate in 		
(select max(o.orderdate) from sales.orders o
  where o1.custid = o.custid)
  order by o1.custid;

--6
select c.custid, c.companyname from sales.customers c
  where exists
(select so.custid from sales.orders so where 
  c.custid = so.custid and
  so.orderdate >= '2015-01-01' and so.orderdate < '2016-01-01')
  and not exists
(select so1.custid from sales.orders so1 where 
  c.custid = so1.custid and
so1.orderdate >= '2016-01-01' and so1.orderdate < '2017-01-01');