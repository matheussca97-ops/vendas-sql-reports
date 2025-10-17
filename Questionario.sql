-- Nível Básico (SELECT, WHERE, ORDER BY)

-- 1 - Quais são os nomes dos clientes (CustomerName) e os contatos (ContactName) localizados no país 'Germany'?
SELECT CustomerName, ContactName
FROM Customers
WHERE Country = 'Germany';


-- 2 - Liste o nome do produto (ProductName) e o preço (Price) de todos os produtos que pertencem à categoria 'Beverages'
-- (CategoryID 1). Ordene a lista pelo preço, do mais caro para o mais barato.
SELECT ProductName, Price
FROM products
WHERE CategoryID = 1;


-- 3 - Qual é o sobrenome (LastName), primeiro nome (FirstName) e data de nascimento (BirthDate) do funcionário com o EmployeeID 4?
-- Inclua também as notas (Notes) sobre a formação dele.
SELECT LastName, FirstName, BirthDate , Notes
FROM employees
WHERE EmployeeID = 4;


-- Nível Intermediário (Agregação, GROUP BY, JOINs Simples) 

-- 4 - Liste todos os países (Country) e o número total de clientes em cada país. Apresente a contagem em ordem decrescente

SELECT Country, COUNT(CustomerID) AS TotalCustomers
FROM customers
GROUP BY Country
ORDER BY TotalCustomers DESC;


-- 5 - Quais são os nomes dos fornecedores (SupplierName) que fornecem produtos classificados como 'Seafood' (CategoryID 8)?
SELECT DISTINCT T2.SupplierName
FROM Products AS T1
JOIN Suppliers AS T2
ON T1.SupplierID = T2.SupplierID
WHERE T1.CategoryID = 8;


-- 6 - Qual é o nome do produto (ProductName) e o preço (Price) do produto mais caro e do produto mais barato no banco de dados?
(SELECT ProductName, Price
FROM Products
ORDER BY Price DESC
LIMIT 1)
UNION ALL
(SELECT ProductName, Price
FROM Products
ORDER BY Price ASC
LIMIT 1);

 
-- 7 - Calcule o número total de pedidos (OrderID) processados por cada transportadora (ShipperName).
SELECT T2.ShipperName, COUNT(T1.OrderID) AS TotalOrders
FROM Orders AS T1
INNER JOIN Shippers AS T2
  ON T1.ShipperID = T2.ShipperID
GROUP BY T2.ShipperName
ORDER BY TotalOrders DESC;


-- 8 - Calcule a quantidade média (Quantity) de produtos vendidos por pedido (OrderID).
SELECT AVG(TotalQuantity) AS AverageQuantityPerOrder
FROM (
    SELECT SUM(Quantity) AS TotalQuantity
    FROM OrderDetails
    GROUP BY OrderID
) AS OrderSummary;


-- 9 - Liste o nome completo do funcionário (FirstName, LastName) e o número total de pedidos que cada um processou.
SELECT T1.FirstName, T1.LastName, COUNT(T2.OrderID) AS TotalOrdersProcessed
FROM Employees AS T1
INNER JOIN Orders AS T2
  ON T1.EmployeeID = T2.EmployeeID
GROUP BY T1.EmployeeID, T1.FirstName, T1.LastName
ORDER BY TotalOrdersProcessed DESC;


-- 10 - Quantos pedidos foram realizados no mês de julho de 1996? (Dica: Use a coluna OrderDate).
SELECT COUNT(OrderID) AS TotalOrders
FROM Orders
WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31';


-- Nível Avançado (Múltiplas Junções, HAVING, Cálculos Complexos)

-- 11 - Identifique os nomes dos clientes (CustomerName) que fizeram mais de 3 pedidos em dezembro de 1997.
SELECT T2.CustomerName, COUNT(T1.OrderID) AS TotalOrders
FROM Orders AS T1
INNER JOIN Customers AS T2
  ON T1.CustomerID = T2.CustomerID
WHERE T1.OrderDate BETWEEN '1997-12-01' AND '1997-12-31'
GROUP BY T1.CustomerID, T2.CustomerName
HAVING COUNT(T1.OrderID) > 3
ORDER BY TotalOrders DESC;


-- 12 - Liste os nomes dos produtos (ProductName) onde a quantidade total vendida (Quantity) em todos os pedidos é inferior a 50.
SELECT T1.ProductName
FROM Products AS T1
INNER JOIN (
    SELECT ProductID, SUM(Quantity) AS TotalQuantity
    FROM OrderDetails
    GROUP BY ProductID
    HAVING TotalQuantity < 50
) AS T2
  ON T1.ProductID = T2.ProductID
ORDER BY T2.TotalQuantity ASC;


-- 13 - Quais são os nomes dos fornecedores (SupplierName) localizados no 'Japan' e que fornecem produtos na categoria 'Seafood' (CategoryID 8)?
SELECT DISTINCT T1.SupplierName
FROM Suppliers AS T1
INNER JOIN Products AS T2
  ON T1.SupplierID = T2.SupplierID
WHERE T1.Country = 'Japan' AND T2.CategoryID = 8;


-- 14 - Calcule o valor total da receita (Preço * Quantidade) para o OrderID 10248.
SELECT SUM(T2.Price * T1.Quantity) AS TotalRevenue
FROM OrderDetails AS T1
INNER JOIN Products AS T2
  ON T1.ProductID = T2.ProductID
WHERE T1.OrderID = 10248;


-- 15 - Encontre os nomes dos funcionários (FirstName, LastName) que são fluentes em Francês (conforme registrado nas Notes) e que trabalharam em pedidos que ocorreram em Londres (City do cliente).
SELECT DISTINCT T1.FirstName, T1.LastName
FROM Employees AS T1
INNER JOIN Orders AS T2
  ON T1.EmployeeID = T2.EmployeeID
INNER JOIN Customers AS T3
  ON T2.CustomerID = T3.CustomerID
WHERE (
    T1.Notes LIKE '%fluent in French%' OR
    T1.Notes LIKE '%reads and writes French%' OR
    T1.Notes LIKE '%course in business French%'
)
AND T3.City = 'London';