-- Name: Charles Carter
-- File: lab-chapter06.sql
-- Date: September 4, 2018

use tsqlv4;

--3
select custid, empid, orderdate from sales.Orders
  where orderdate >= '2016-01-01' and orderdate < '2016-02-01'
    except
select custid, empid, orderdate from sales.Orders
  where orderdate >= '2016-02-01' and orderdate < '2016-03-01';

--4
select custid, empid from sales.Orders
  where orderdate >= '2016-01-01' and orderdate < '2016-02-01'
    intersect
select custid, empid from sales.Orders
  where orderdate >= '2016-02-01' and orderdate < '2016-03-01';

--5
(select custid, empid from sales.Orders
  where orderdate >= '2016-01-01' and orderdate < '2016-02-01'
    intersect
select custid, empid from sales.Orders
  where orderdate >= '2016-02-01' and orderdate < '2016-03-01')
    except
select custid, empid  from sales.Orders
  where orderdate >= '2015-01-01' and orderdate < '2016-01-01';


