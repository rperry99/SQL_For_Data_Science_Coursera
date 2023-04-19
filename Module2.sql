-- The following questions use the chinook database: https://www.sqlitetutorial.net/sqlite-sample-database/

-- #1. Find all the tracks that have a length of 5,000,000 milliseconds or more.
SELECT COUNT(trackID)
FROM Tracks
WHERE Milliseconds >= 5000000;

-- #2. Find all the invoices whose total is between $5 and $15 dollars.
SELECT InvoiceID, total
FROM Invoices
WHERE total BETWEEN 5 AND 15;

-- #3. Find all the customers from the following States: RJ, DF, AB, BC, CA, WA, NY.
SELECT CustomerID, FirstName, LastName, company, State
FROM Customers
WHERE State IN ('RJ', 'DF', 'AB', 'BC', 'CA', 'WA', 'NY');

-- #4 Find all the invoices for customer 56 and 58 where the total was between $1.00 and $5.00.
SELECT InvoiceID, CustomerID, total, InvoiceDate
FROM Invoices
WHERE (total BETWEEN 1 AND 5) AND (CustomerID in (56, 58))
ORDER BY InvoiceId;

-- #5 Find all the tracks whose name starts with 'All'.
SELECT name
FROM Tracks
WHERE name LIKE 'ALL%';

-- #6 Find all the customer emails that start with "J" and are from gmail.com.
SELECT FirstName, LastName, Email
FROM Customers
WHERE Email LIKE 'J%@gmail.com';

-- #7 Find all the invoices from the billing city Brasília, Edmonton, and Vancouver and sort in descending order by invoice ID.
SELECT InvoiceID, BillingCity, Total
FROM Invoices
WHERE BillingCity IN ('Brasília', 'Edmonton', 'Vancouver')
ORDER BY InvoiceID DESC;

-- #8 Show the number of orders placed by each customer (hint: this is found in the invoices table) and sort the result by the number of orders in descending order.
SELECT CustomerID, COUNT(*)
FROM Invoices
GROUP BY CustomerID
ORDER BY COUNT(*) DESC;

-- #9 Find the albums with 12 or more tracks.
SELECT AlbumID, COUNT(*)
FROM Tracks
GROUP BY AlbumID
HAVING COUNT(*) >=12;