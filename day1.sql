select * from Products

create view Items as

select productname as itemName, price as SalesPrice from products

select * from Items;

create view OrderSummaryv as
select
    o.OrderID,
    c.FullName,
    p.ProductName,
    od.Quantity
FROM Orders o
inner JOIN Customers c ON o.CustomerID = c.CustomerID
inner JOIN OrderDetails od ON o.OrderID = od.OrderID
inner JOIN Products p ON od.ProductID = p.ProductID;

SELECT * FROM OrderSummaryv;

CREATE VIEW CustomerView AS
SELECT CustomerID, FullName, Phone, City
FROM Customers;

select * from CustomerView

insert into CustomerView
values (101, 'Bibhashree Pradhan', '77346874', 'Ktm');

update CustomerView
set FullName = 'Vanillbee Star'
where CustomerID = 101;

delete from CustomerView
where CustomerID = 101;