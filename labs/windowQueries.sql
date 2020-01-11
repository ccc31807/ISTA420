use tsqlv4;


-- write a report stating for every order the products ordered in that order

select o.orderid, p.productname from sales.orders o 
  join sales.OrderDetails od on o.orderid = od.orderid
  join Production.products p on p.productid = od.productid
  order by o.orderid;

  -- back team
-- report freight per month and freight by year

select datepart(month, o.shippeddate) as theMonth, 
  o.freight, 
  sum(o.freight) over (partition by datepart(month, o.orderdate)) as moFreight,
  sum(o.freight) over (partition by datepart(year, o.orderdate)) as yrFreight
  from sales.Orders o
  where datepart(year, o.orderdate) = 2015;
  -- 2238.98

-- student solution

select 
month(shippeddate) as shipMonth,
sum(freight) over (partition by month(shippeddate) order by month(shippeddate)) as FreightperMonth,
sum(freight) over () as FreightperYear
from sales.orders
where year(orderdate) = 2015
order by month(shippeddate);
-- 2697.14

-- front team
-- What percentage of orders against orders of all employees 
-- were placed by an employee for each year?

select o.empid,
  count(o.orderid) over (partition by o.empid, datepart(year, o.orderdate)) as yearordercount, 
  datepart(year, o.orderdate) as year,
  count(o.orderid) over() as totalordercount,
  (100.0 * count(o.orderid) over (partition by o.empid, datepart(year, o.orderdate))) / count(o.orderid) over() as pct
  from sales.orders o;
  -- emp 1, year 2014, orders 123

-- student solution

WITH T1 AS (
SELECT EMPID, COUNT(ORDERID)AS NUMORDER,
YEAR(ORDERDATE) AS OYEAR
FROM sales.orders
GROUP BY EMPID, YEAR(ORDERDATE))
SELECT empid, numorder, OYEAR,
100. * NUMORDER  / sum(numorder) OVER() AS PERCT
FROM T1 GROUP BY empid, OYEAR, NUMORDER order by empid;
-- emp 1, year 2014, orders 26