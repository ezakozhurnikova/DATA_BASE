1.Вывести название и стоимость в USD одного самого дорогого проданного товара

SELECT
ProductName,
Price*1.1 AS Price_usd
FROM [OrderDetails]
JOIN Products ON OrderDetails.ProductID=Products.ProductID
ORDER BY Price DESC



2. Вывести два самых дорогих товара из категории Beverages из USA
SELECT
*
FROM [Products]
JOIN Categories ON Products.CategoryID=Categories.CategoryID
JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID
WHERE Categories.CategoryName='Beverages'
AND Suppliers.Country='USA'
ORDER BY Price DESC
LIMIT 2

3. Удалить товары с ценой менее 5 EUR
DELETE FROM Products
WHERE Price <= 5

4. Вывести список стран, которые поставляют морепродукты
SELECT DISTINCT
Suppliers.Country
FROM [Suppliers]
JOIN Products ON Suppliers.SupplierID=Products.SupplierID
JOIN Categories ON Products.CategoryID=Categories.CategoryID
WHERE
Categories.CategoryName='Seafood'

5. Очистить поле ContactName у всех клиентов не из China
UPDATE Customers
SET ContactName=''
WHERE NOT Country = 'China'


