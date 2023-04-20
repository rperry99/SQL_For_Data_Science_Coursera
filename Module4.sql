-- The following questions use the chinook database: https://www.sqlitetutorial.net/sqlite-sample-database/
-- #1. Pull a list of customer ids with the customer’s full name, and address, along with combining their city and country together. Be sure to make a space in between these two and make it UPPER CASE. (e.g. LOS ANGELES USA)
SELECT CustomerID, FirstName || ' ' || LastName, UPPER(City || ' ' || Country)
FROM Customers;

-- #2. Create a new employee user id by combining the first 4 letters of the employee’s first name with the first 2 letters of the employee’s last name. Make the new field lower case and pull each individual step to show your work.
SELECT FirstName AS 'First Name', 
    SUBSTR(FirstName, 1, 4) AS 'Shortened F-Name',
    LastName AS 'Last Name',
    SUBSTR(LastName, 1, 2) AS 'Shortened L-Name',
    LOWER(SUBSTR(FirstName, 1, 4) || SUBSTR(LastName, 1, 2)) AS 'New Employee ID'
FROM Employees;

-- #3. Show a list of employees who have worked for the company for 15 or more years using the current date function. Sort by lastname ascending.
SELECT FirstName, LastName, HireDate, 
    STRFTIME('%Y', 'now') - STRFTIME('%Y', HireDate) AS WorkingYears
FROM Employees
WHERE WorkingYears >= 15
ORDER BY LastName ASC;

-- #4. Profiling the Customers table, answer the following question.
Select * from Customers WHERE /* Column Name */ IS NULL;

-- #5. Find the cities with the most customers and rank in descending order.
SELECT City, 
    COUNT(CustomerID) AS Customers
FROM Customers
GROUP BY City
ORDER BY Customers DESC;

-- #6. Create a new customer invoice id by combining a customer’s invoice id with their first and last name while ordering your query in the following order: firstname, lastname, and invoiceID.
SELECT c.FirstName, c.LastName, i.invoiceID,
    c.FirstName || c.LastName || i.invoiceID AS NewInvoiceID
FROM Customers c 
INNER JOIN Invoices i ON c.CustomerID = i.customerID
ORDER BY FirstName, LastName, InvoiceID;