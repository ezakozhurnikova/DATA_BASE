1. Вывести ко-во заказов, которое компания Speedy Express доставила в Brazil

SELECT COUNT(*) AS orders_from_brazil FROM Orders
    JOIN Shippers ON Orders.ShipperID=Shippers.ShipperID
    JOIN Customers ON Orders.CustomerID=Customers.CustomerID
WHERE
Shippers.ShipperName='Speedy Express'
AND Customers.Country='Brazil'

2. Вывести среднюю стоимость проданного в Germany товара

SELECT AVG(Price) AS avg_price FROM [OrderDetails]
    JOIN Products ON OrderDetails.ProductID=Products.ProductID
    JOIN Orders ON OrderDetails.OrderID=Orders.OrderID
    JOIN Customers ON Orders.CustomerID=Customers.CustomerID
WHERE Country = 'Germany'

3. Вывести ко-во и сред/стоимость товаров из USA

SELECT
    COUNT(*) AS count_products_usa,
    AVG(Price) AS avg_price
FROM Products
         JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID
WHERE Country = 'USA'

4. Вывести стоимость и название двух самых дешевых товаров из Germany

SELECT Price,
       ProductName
FROM Products
         JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID
WHERE Country = 'Germany'
ORDER BY Products.Price ASC
LIMIT 2

5. Применить наценку в 15% ко всем товарам из категории 4

SELECT
        Price * 1.15 AS price_plus
FROM Products
WHERE CategoryID = 4