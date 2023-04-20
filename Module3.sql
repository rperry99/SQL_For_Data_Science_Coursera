-- The following questions use the chinook database: https://www.sqlitetutorial.net/sqlite-sample-database/
-- #1. Using a subquery, find the names of all the tracks for the album "Californication".
SELECT Name, AlbumID
FROM Tracks
WHERE AlbumID IN (SELECT AlbumID
    FROM Albums
    WHERE Title = 'Californication');

-- #2. Find the total number of invoices for each customer along with the customer's full name, city and email.
SELECT FirstName, LastName, City, Email,
    COUNT(I.CustomerId) AS Invoices
FROM Customers C 
INNER JOIN Invoices I ON C.CustomerId = I.CustomerId
GROUP BY C.CustomerId;

-- #3. Retrieve the track name, album, artistID, and trackID for all the albums.
SELECT Tracks.Name, A.Name AS Artist, Albums.Title AS Album, Tracks.TrackID
FROM ((Tracks INNER JOIN Albums ON Tracks.AlbumID = Albums.AlbumID) 
    INNER JOIN Artists A ON A.ArtistID = Albums.ArtistID);

-- #4. Retrieve a list with the managers last name, and the last name of the employees who report to him or her.
SELECT m.lastName AS 'Manager', e.lastName AS 'Direct Report'
From employees e 
INNER JOIN employees m ON m.employeeID = e.reportsto
ORDER BY manager;

-- #5. Find the name and ID of the artists who do not have albums. 
SELECT Name AS Artist, Artists.ArtistID, Albums.Title AS Album
FROM Artists
LEFT JOIN Albums ON artists.ArtistID = Albums.ArtistID
WHERE Album is NULL;

-- #6. Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order.
SELECT FirstName, LastName
FROM Employees
UNION
SELECT FirstName, LastName
FROM Customers
ORDER BY lastName DESC;

-- #7. See if there are any customers who have a different city listed in their billing city versus their customer city.
SELECT C.FirstName, C.LastName, C.City AS Customercity, I.BillingCity
FROM Customers C 
INNER JOIN Invoices I ON C.CustomerId = I.CustomerId
WHERE CustomerCity != BillingCity;