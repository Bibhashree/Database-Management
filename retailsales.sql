CREATE TABLE RetailSales (
    SaleID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50),
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    SaleDate DATE
);

INSERT INTO RetailSales VALUES
(1, 'Amit Sharma', 'Kathmandu', 'Laptop', 'Electronics', 1, 80000, '2025-01-10'),
(2, 'Amit Sharma', 'Kathmandu', 'Mobile Phone', 'Electronics', 2, 40000, '2025-01-12'),
(3, 'Rina Thapa', 'Pokhara', 'Mobile Phone', 'Electronics', 1, 40000, '2025-01-15'),
(4, 'Suman Karki', 'Kathmandu', 'Office Chair', 'Furniture', 4, 15000, '2025-01-20'),
(5, 'Suman Karki', 'Kathmandu', 'Table', 'Furniture', 1, 20000, '2025-01-22'),
(6, 'Anil Gurung', 'Butwal', 'Laptop', 'Electronics', 2, 80000, '2025-01-25'),
(7, 'Rina Thapa', 'Pokhara', 'Table', 'Furniture', 3, 20000, '2025-01-26');

INSERT INTO RetailSales VALUES
(8,  'Amit Sharma',  'Kathmandu', 'Mouse',        'Electronics', 3, 1200,  '2025-02-01'),
(9,  'Rina Thapa',   'Pokhara',   'Keyboard',     'Electronics', 2, 2500,  '2025-02-02'),
(10, 'Anil Gurung',  'Butwal',    'Office Chair', 'Furniture',   1, 15000, '2025-02-03'),
(11, 'Suman Karki',  'Kathmandu', 'Laptop',       'Electronics', 1, 80000, '2025-02-04'),
(12, 'Bikash Rana',  'Biratnagar','Mobile Phone', 'Electronics', 2, 40000, '2025-02-05'),
(13, 'Bikash Rana',  'Biratnagar','Table',        'Furniture',   1, 20000, '2025-02-06'),
(14, 'Nisha Adhikari','Kathmandu','Keyboard',     'Electronics', 3, 2500,  '2025-02-07'),
(15, 'Nisha Adhikari','Kathmandu','Mouse',        'Electronics', 5, 1200,  '2025-02-07'),
(16, 'Anil Gurung',  'Butwal',    'Table',        'Furniture',   2, 20000, '2025-02-08'),
(17, 'Rina Thapa',   'Pokhara',   'Office Chair', 'Furniture',   2, 15000, '2025-02-09'),
(18, 'Amit Sharma',  'Kathmandu', 'Table',        'Furniture',   1, 20000, '2025-02-10'),
(19, 'Bikash Rana',  'Biratnagar','Laptop',       'Electronics', 1, 80000, '2025-02-11'),
(20, 'Suman Karki',  'Kathmandu', 'Mouse',        'Electronics', 4, 1200,  '2025-02-12');

select * from RetailSales

select City,count(*) as no_of_records from RetailSales group by city

select distinct productname, customername from retailsales
where customername like '%s' order by customername

select Customername, productname from RetailSales where unitprice > 5000

select category, sum(quantity) as total_qty, sum(unitprice) from RetailSales group by category

select max(quantity) from RetailSales

select category, max(quantity) as max_value, min(quantity) as min_value
from retailsales
group by category

--display total quantity sold for each ProductName
select productname, sum(quantity) as unit_sold 
from retailsales
group by productname

--Show total sales amount (Quantity * UnitPrice) for each ProductName.
select productname, sum(quantity* unitprice) as Total_sales
from retailsales 
group by productname

--find total no. of sales recored for each city.
select City,count(*) as no_of_records
from RetailSales
group by city

--display the total quantity sold by each CustomerName
select CustomerName, sum(quantity) as unit_sold
from retailsales 
group by CustomerName

--how many times this productname was sold
select productname, count(*) as products_sold 
from RetailSales
group by ProductName 

--find customers whose total purchase amount exceeds 100,000
select customername, sum(quantity* unitprice) as T_sales
from retailsales 
group by customername
having sum(quantity* unitprice) > 100000
order by T_sales  desc

--category-wise total quantity sold
select category, sum(quantity) as t_qty 
from RetailSales 
group by category

--minimum unit price for each category 
select Category, min(UnitPrice) as minprice
from RetailSales
group by category

--Maximum unit price for each product
Select Productname, max(Unitprice) as maxprice
from RetailSales
group by Productname

--Average unit price for each category
select category, avg(unitprice) as avgprice
from RetailSales
group by Category

--count how many times each product was sold
select productname, count(*) as timessold
from RetailSales
group by productname

select productname, count(*) as products_sold 
from RetailSales
group by ProductName 
having count(*) > 3

--Products whose total quantity > 3
select productname, sum(quantity) as products_qty 
from RetailSales
group by ProductName 
having sum(quantity) > 3

--Cities where total sales amount > 150000
select city, sum(quantity * unitprice) as totalsales
from RetailSales
group by city
having sum(quantity * unitprice) > 150000

--Categories having more than 5 items sold
select category, sum(quantity) as total_qty
from RetailSales
group by category
having sum(quantity) > 5

--Products sold more than 2 times
select productname, count(*) as products_sold
from RetailSales
group by productname
having count(*) > 2

--Customers who purchased more than 3 times
select customername, count(*) as customer_repeat
from RetailSales
group by customername
having count(*) > 3

--Customers who purchased more than 5 items
select customername, sum(quantity) as customer_repeat
from RetailSales
group by customername
having sum(quantity) > 5

--Categories whose average unit price > 20000
select category,avg(unitprice) as avgprice
from RetailSales
group by category
having avg(unitPrice) > 20000

--Cities having more than 3 sales records
select city, count(*) as salescount
from RetailSales
group by city
having count(*) > 3

--Products whose total sales amount > 50000
select productname, sum(quantity * unitprice) as totalsales
from retailsales
group by productname
having sum(quantity * unitprice) > 50000

--Customers who made more than one purchase
select customername, count(*) as purchases
from RetailSales
group by customername
having count(*) > 1

--find top 3 products based on total sales amt
select top 3 productname, sum(quantity * unitprice) as totalsales
from RetailSales
group by productname
order by 2 asc

--display customers whose total electronics spending is greater than furniture spending
select customername,
sum(case when category = 'Electronics' then quantity * unitprice  else 0 end)as electronics_spending,
sum(case when category = 'Furniture' then quantity * unitprice  else 0 end) as furniture_spending
from RetailSales
group by customername
having 
sum(case when category = 'Electronics' then quantity * unitprice  else 0 end) > 
sum(case when category = 'Furniture' then quantity * unitprice  else 0 end)

--display top 2 customers whose total electronics spending is greater than furniture spending
select top 2 customername,
sum(case when category = 'Electronics' then quantity * unitprice  else 0 end)as electronics_spending,
sum(case when category = 'Furniture' then quantity * unitprice  else 0 end) as furniture_spending
from RetailSales
group by customername
having 
sum(case when category = 'Electronics' then quantity * unitprice  else 0 end) > 
sum(case when category = 'Furniture' then quantity * unitprice  else 0 end)
order by 2 desc;

--display cities whose highest single sale amount is greater than 80,000
select city, max(quantity * unitprice) as singleSale
from RetailSales
group by city
having  max(quantity * unitprice) > 80000;

--display total quantity sold for each productName in each city
select productname, city,  sum(quantity) as totalqty
from RetailSales
group by ProductName, city;

--find customers and categories where total spending exceeds 50,000
select CustomerName, category, sum(quantity * unitprice) as spending
from RetailSales
group by customername, category
having sum(quantity * unitprice) > 50000

--Show cities and products sold on more than one different day
select city, productname
from RetailSales
group by city, productname
having count(distinct SaleDate) > 1;


--Customers who purchased from more than one category
select customername
from RetailSales
group by customername
having count(distinct category) > 1

--products sold in more than one city
select productname
from RetailSales
group by productname
having count(distinct city) > 1

--cities where more than 2 different products were sold
select city
from RetailSales
group by city
having count(distinct productname) > 2

--categories having more than 2 different product sold
select category
from RetailSales
group by category
having count(distinct productname) > 2

--customers whose average purchase amount per sale > 30000
select customername, avg(quantity * unitprice) as average
from RetailSales
group by customername
having avg(quantity * unitprice) > 30000

--products where avg quantity per sale > 2
select Productname
from RetailSales
group by productname
having avg(quantity) > 2

--products sold on more than 3 different days
select productname
from RetailSales
group by productname
having count(distinct saledate)> 3

--cities where both electronics and furniture were purchased
select city
from RetailSales
group by city 
having count(distinct category) = 2

--customers who bought same product more than once
select customername
from RetailSales
group by customername
having count(distinct productname) > 1

