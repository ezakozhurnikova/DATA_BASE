1. Найти мин/стоимость товаров для каждой категории
SELECT
	CategoryID,
    MIN(Price) AS min_price
FROM Products
GROUP BY CategoryID

2. Вывести ТОП-3 стран по количеству доставленных заказов
SELECT Distinct
Customers.Country

FROM [OrderDetails]
JOIN Orders ON OrderDetails.OrderID=Orders.OrderID
JOIN Customers ON Orders.CustomerID=Customers.CustomerID
GROUP BY OrderDetailID
ORDER BY Quantity DESC
LIMIT 3
3. Вывести названия категорий, в которых более 10 товаров
SELECT
CategoryName,
COUNT(*) AS total_products
FROM [Categories]
JOIN Products ON Categories.CategoryID=Products.CategoryID
GROUP BY CategoryName
HAVING
total_products >= 10
4. Очистить тел/номер поставщикам из USA
UPDATE Suppliers
SET Phone = ''
WHERE Country='USA'

5. Вывести имена и фамилии (и ко-во заказов) менеджеров, у которых ко-во заказов менее 15

SELECT
    COUNT (OrderID) AS count_orders,
    Employees.LastName,
    Employees.FirstName
FROM [Orders]
    JOIN Employees ON Orders.EmployeeID=Employees.EmployeeID
GROUP BY Employees.EmployeeID
HAVING count_orders <=15