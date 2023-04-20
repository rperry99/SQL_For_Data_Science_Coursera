Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

This is a 2-part assignment. In the first part, you are asked a series of questions that will help you profile and understand the data just like a data scientist would. For this first part of the assignment, you will be assessed both on the correctness of your findings, as well as the code you used to arrive at your answer. You will be graded on how easy your code is to read, so remember to use proper formatting and comments where necessary.

In the second part of the assignment, you are asked to come up with your own inferences and analysis of the data for a particular research question you want to answer. You will be required to prepare the dataset for the analysis you choose to do. As with the first part, you will be graded, in part, on how easy your code is to read, so use proper formatting and comments to illustrate and communicate your intent as required.

For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked, and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your peers can review your work. You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) to copy and paste your answers. If you are going to use Word or some other page layout application, just be careful to make sure your answers and code are lined appropriately.
In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.



Part 1: Yelp Dataset Profiling and Understanding

1. Profile the data by finding the total number of records for each of the tables below:
	
i. Attribute table = 10,000
ii. Business table = 10,000
iii. Category table = 10,000
iv. Checkin table = 10,000
v. elite_years table = 10,000
vi. friend table = 10,000
vii. hours table = 10,000
viii. photo table = 10,000
ix. review table = 10,000
x. tip table = 10,000
xi. user table = 10,000
	


2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

i. Business = id: 10,000 
ii. Hours = business_id: 1,562 
iii. Category = business_id: 2,643 
iv. Attribute = business_id: 1,115
v. Review = id: 10,000 | business_id: 8,090 | user_id: 9,581
vi. Checkin = business_id: 493
vii. Photo = id: 10,000 | business_id: 6,493
viii. Tip = business_id: 3,979 | user_id: 537
ix. User = id: 10,000
x. Friend = user_id: 11
xi. Elite_years = user_id; 2,780

Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	



3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer: No <br>
	
	
	SQL code used to arrive at answer: <br>
	```SQL

	SELECT * 
		FROM user
		WHERE ID IS NULL OR
    	name IS NULL OR
    	review_count IS NULL OR
    	yelping_since IS NULL OR
    	Useful IS NULL OR
    	Cool IS NULL OR
    	Fans IS NULL OR
    	average_stars IS NULL OR
    	compliment_hot IS NULL OR
    	Compliment_more IS NULL OR
    	compliment_profile IS NULL OR
    	compliment_cute IS NULL OR
    	compliment_list IS NULL OR
    	compliment_note IS NULL OR
    	compliment_plain IS NULL OR
    	compliment_cool IS NULL OR
    	compliment_funny IS NULL OR
    	compliment_writer IS NULL OR
    	compliment_photos IS NULL
	```
	

	
4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

	i. Table: Review, Column: Stars<br>
	
		min: 1		max: 5		avg: 3.7082
		
	
	ii. Table: Business, Column: Stars<br>
	
		min: 1.0		max: 5.0		avg: 3.6549
		
	
	iii. Table: Tip, Column: Likes<br>
	
		min: 0		max: 2		avg: 0.0144
		
	
	iv. Table: Checkin, Column: Count<br>
	
		min: 1		max: 53	 	avg: 1.9414
		
	
	v. Table: User, Column: Review_count<br>
	
		min: 0		max: 2,000		avg: 24.2995
		


5. List the cities with the most reviews in descending order:<br>

	SQL code used to arrive at answer:<br>
	```SQL
	SELECT city, SUM(Review_count) AS TotalReviews
	FROM business
	GROUP BY city
	ORDER BY TotalReviews DESC
	```
	
	
	Copy and Paste the Result Below:<br>
	+-----------------+--------------+
	| city            | TotalReviews |
	+-----------------+--------------+
	| Las Vegas       |        82854 |
	| Phoenix         |        34503 |
	| Toronto         |        24113 |
	| Scottsdale      |        20614 |
	| Charlotte       |        12523 |
	| Henderson       |        10871 |
	| Tempe           |        10504 |
	| Pittsburgh      |         9798 |
	| Montréal        |         9448 |
	| Chandler        |         8112 |
	| Mesa            |         6875 |
	| Gilbert         |         6380 |
	| Cleveland       |         5593 |
	| Madison         |         5265 |
	| Glendale        |         4406 |
	| Mississauga     |         3814 |
	| Edinburgh       |         2792 |
	| Peoria          |         2624 |
	| North Las Vegas |         2438 |
	| Markham         |         2352 |
	| Champaign       |         2029 |
	| Stuttgart       |         1849 |
	| Surprise        |         1520 |
	| Lakewood        |         1465 |
	| Goodyear        |         1155 |
	+-----------------+--------------+
	(Output limit exceeded, 25 of 362 total rows shown)

	
6. Find the distribution of star ratings to the business in the following cities:

i. Avon<br>

SQL code used to arrive at answer:
```SQL
SELECT Stars, SUM(review_count) AS TotalReviews
FROM business
WHERE city = 'Avon'
GROUP BY Stars
```


Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):<br>
+-------+--------------+
| stars | TotalReviews |
+-------+--------------+
|   1.5 |           10 |
|   2.5 |            6 |
|   3.5 |           88 |
|   4.0 |           21 |
|   4.5 |           31 |
|   5.0 |            3 |
+-------+--------------+


ii. Beachwood

SQL code used to arrive at answer:<br>
```SQL
SELECT Stars, SUM(review_count) AS TotalReviews
FROM business
WHERE city = 'Beachwood'
GROUP BY Stars
```


Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):<br>
+-------+--------------+
| stars | TotalReviews |
+-------+--------------+
|   2.0 |            8 |
|   2.5 |            3 |
|   3.0 |           11 |
|   3.5 |            6 |
|   4.0 |           69 |
|   4.5 |           17 |
|   5.0 |           23 |
+-------+--------------+	


7. Find the top 3 users based on their total number of reviews:<br>
		
	SQL code used to arrive at answer:<br>
	```SQL
	SELECT name, id, review_count
	FROM User
	ORDER BY review_count DESC
	LIMIT 3
	```
	
		
	Copy and Paste the Result Below:<br>
	+--------+------------------------+--------------+
	| name   | id                     | review_count |
	+--------+------------------------+--------------+
	| Gerald | -G7Zkl1wIWBBmD0KRy_sCw |         2000 |
	| Sara   | -3s52C4zL_DHRK0ULG6qtg |         1629 |
	| Yuri   | -8lbUNlXVSoXqaRRiHiSNg |         1339 |
	+--------+------------------------+--------------+


8. Does posing more reviews correlate with more fans?

	Please explain your findings and interpretation of the results:<br>
	
	I would say no. When pulling the Fans and Review Count columns, you can see that some people have posted 1000+ reviews, yet only have 16 fans, while some people post 600 some, and they have 100+ fans. <br>

	```SQL
	SELECT fans, review_count
	FROM User
	ORDER BY review_count DESC
	```

	+------+--------------+
	| fans | review_count |
	+------+--------------+
	|  253 |         2000 |
	|   50 |         1629 |
	|   76 |         1339 |
	|  101 |         1246 |
	|  126 |         1215 |
	|  311 |         1153 |
	|   16 |         1116 |
	|  104 |         1039 |
	|  497 |          968 |
	|  173 |          930 |
	|   38 |          904 |
	|   43 |          864 |
	|  124 |          862 |
	|  115 |          861 |
	|   85 |          842 |
	|   37 |          836 |
	|  120 |          834 |
	|  159 |          813 |
	|   61 |          775 |
	|   78 |          754 |
	|   35 |          702 |
	|   10 |          696 |
	|  101 |          694 |
	|   25 |          676 |
	|   45 |          675 |
	+------+--------------+
	(Output limit exceeded, 25 of 10000 total rows shown)
	

	
9. Are there more reviews with the word "love" or with the word "hate" in them? <br>

	Answer: Love: 1,780 | Hate: 232 <br>

	
	SQL code used to arrive at answer: <br>
	```SQL
	-- Love
	SELECT COUNT(*) AS Love
	FROM review
	WHERE text LIKE '%love%';

	-- Hate
	SELECT COUNT(*) AS Hate
	FROM review
	WHERE text LIKE '%hate%';
	```

	
	
10. Find the top 10 users with the most fans: <br>

	SQL code used to arrive at answer:
	```SQL
	SELECT Name, Fans, id
	FROM User
	ORDER BY Fans DESC
	LIMIT 10;
	```
	
	
	Copy and Paste the Result Below: <br>
	+-----------+------+------------------------+
	| name      | fans | id                     |
	+-----------+------+------------------------+
	| Amy       |  503 | -9I98YbNQnLdAmcYfb324Q |
	| Mimi      |  497 | -8EnCioUmDygAbsYZmTeRQ |
	| Harald    |  311 | --2vR0DIsmQ6WfcSzKWigw |
	| Gerald    |  253 | -G7Zkl1wIWBBmD0KRy_sCw |
	| Christine |  173 | -0IiMAZI2SsQ7VmyzJjokQ |
	| Lisa      |  159 | -g3XIcCb2b-BD0QBCcq2Sw |
	| Cat       |  133 | -9bbDysuiWeo2VShFJJtcw |
	| William   |  126 | -FZBTkAZEXoP7CYvRV2ZwQ |
	| Fran      |  124 | -9da1xk7zgnnfO1uTVYGkA |
	| Lissa     |  120 | -lh59ko3dxChBSZ9U7LfUw |
	+-----------+------+------------------------+
	
		

Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.
	
i. Do the two groups you chose to analyze have a different distribution of hours?
Its a pretty small sample size, but it seems like there are fewer 4 to 5 star reviews on sundays.

ii. Do the two groups you chose to analyze have a different number of reviews? <br>
They have vastly different number of reviews. There are way more 4-5 star reviews than 2-3 stars. 
         
iii. Are you able to infer anything from the location data provided between these two groups? Explain.<br>
From what I can see, I don't really see a correlation between area and reviews. There are a lot of area codes in vegas, and it seems like some have more reveiws than others. It does seem like there are some area codes that have a ton of 1 star reviews. 

SQL code used for analysis:
```SQL
-- Looking into hours
SELECT Count(B.Review_count), 
    CASE
        WHEN B.Stars BETWEEN 2 and 3 THEN '2 to 3 Star Reviews'
        WHEN B.Stars BETWEEN 4 AND 5 THEN '4 to 5 Star Reviews'
        ELSE '1 Star reviews'
    END StarReviews,
    CASE
        WHEN H.hours LIKE '%monday%' THEN 'Monday'
        WHEN H.hours LIKE '%tuesday%' THEN 'tuesday'
        WHEN H.hours LIKE '%wednesday%' THEN 'wednesday'
        WHEN H.hours LIKE '%thursday%' THEN 'thursday'
        WHEN H.hours LIKE '%friday%' THEN 'friday'
        WHEN H.hours LIKE '%saturday%' THEN 'saturday'
        WHEN H.hours LIKE '%sunday%' THEN 'sunday'
    END HoursDays
FROM Business B INNER JOIN Hours H ON B.id = H.business_id
WHERE B.City = 'Las Vegas'
GROUP BY HoursDays
ORDER BY HoursDays

-- Looking into Postal Codes
SELECT Count(B.Review_count), 
    CASE
        WHEN B.Stars BETWEEN 2 and 3 THEN '2 to 3 Star Reviews'
        WHEN B.Stars BETWEEN 4 AND 5 THEN '4 to 5 Star Reviews'
        ELSE '1 Star reviews'
    END StarReviews,
    B.postal_code
FROM Business B
WHERE B.City = 'Las Vegas'
GROUP BY B.postal_code
```

		
		
2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.
		
i. Difference 1:
- The ones that are open have significantly more check-ins at the open ones than the closed ones (obviously), but the average number of checkins is incredibly close: Open: 1.65 | Closed: 1.25.
         
         
ii. Difference 2:
- Seems like the average stars of the closed ones are lower than the open ones, which also makes some sense. Open: 3.32 |
Closed: 2.0
         
         
         
SQL code used for analysis:
```SQL
SELECT 
    CASE 
        WHEN B.is_open = 0 THEN 'Closed'
        WHEN B.is_open = 1 THEN 'Open'
    END OpenClosed,
    AVG(B.Stars),
    AVG(CI.count),
    SUM(CI.Count)

FROM Business B 
    INNER JOIN Checkin CI on CI.business_id = B.id
GROUP BY OpenClosed
```
	
	
3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
i. Indicate the type of analysis you chose to do: <br>
What are the most popular categories in Las Vegas currently, and what are their average reviews.
         
         
ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data: <br>
I will need to get the categories, and group them by the number of reviews. That way I can see what the most popular categories are. Then I would like ot see what the average stars are for these as well.                       
                  
iii. Output of your finished dataset:<br>
+------------------------------+-----------+-------------+
| category                     | AVGRating | ReviewCount |
+------------------------------+-----------+-------------+
| Health & Medical             |       4.5 |           4 |
| Restaurants                  |     3.875 |           4 |
| Shopping                     |     3.875 |           4 |
| American (New)               |       3.5 |           2 |
| Beauty & Spas                |      3.75 |           2 |
| Doctors                      |       4.5 |           2 |
| Food                         |      3.25 |           2 |
| Home Services                |       4.5 |           2 |
| Hotels & Travel              |       4.0 |           2 |
| Active Life                  |       4.5 |           1 |
| Apartments                   |       4.0 |           1 |
| Arcades                      |       3.5 |           1 |
| Arts & Entertainment         |       3.5 |           1 |
| Asian Fusion                 |       4.0 |           1 |
| Bakeries                     |       4.0 |           1 |
| Bars                         |       3.5 |           1 |
| Breakfast & Brunch           |       4.0 |           1 |
| Chicken Wings                |       3.0 |           1 |
| Chinese                      |       4.0 |           1 |
| Chiropractors                |       5.0 |           1 |
| Chocolatiers & Shops         |       4.0 |           1 |
| Community Service/Non-Profit |       4.5 |           1 |
| Convenience Stores           |       2.5 |           1 |
| Cosmetics & Beauty Supply    |       2.5 |           1 |
| Dentists                     |       4.0 |           1 |
+------------------------------+-----------+-------------+
(Output limit exceeded, 25 of 63 total rows shown)
         
iv. Provide the SQL code you used to create your final dataset:
```SQL
SELECT C.Category, AVG(B.Stars) AS AVGRating, COUNT(B.Review_Count) AS ReviewCount
FROM Category C INNER JOIN Business B ON B.id = C.business_id
WHERE B.City = 'Las Vegas'
GROUP BY C.Category
ORDER BY ReviewCount desc
```