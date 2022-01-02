 --Start by getting a feel for the met table:
 SELECT * 
 FROM met 
 LIMIT 10;
 -- The column names are id, department, category, title, artist, date, medium, country

--How many pieces are in the American Decorative Art collection?
SELECT COUNT (*)
FROM met; 

SELECT COUNT(DISTINCT (title))
 FROM met;
 -- There are 3948 total items, but there 720 distinct items 

 -- Count the number of pieces where the category includes ‘celery’.
 SELECT COUNT (*) 
 FROM met
 WHERE category LIKE '%celery%';
 -- There are 31 total categories that includes celery 

-- Find the title and medium of the oldest piece(s) in the collection.
 SELECT title, medium, date 
 FROM met
 ORDER BY date ASC;
 -- The oldest pieces in the collect are Betty Lamp, Candlestick, and Casement Window

-- Find the top 10 countries with the most pieces in the collection.
 SELECT COUNT(id) AS 'total', country
 FROM met 
 WHERE country IS NOT NULL
 GROUP BY country
 ORDER BY 1 DESC
 LIMIT 10;
 -- The top 10 countries with the most pieces are: US, England, China, France, Mexico, England|France, US|England, France, and Germany

-- Find the categories HAVING more than 100 pieces.
SELECT category, COUNT(*) AS 'Total'
FROM met
GROUP BY 1
HAVING COUNT(*) > 100;
-- The categories having more than 100 pieces are Bowl, Candlestick, Cream pot, Dish, Furniture Hardware, and Side Chair

-- Count the number of pieces where the medium contains ‘gold’ or ‘silver’.And sort in descending order.
SELECT medium, COUNT(*)
FROM met 
WHERE medium LIKE '%gold%' 
  OR medium LIKE '%silver%'
GROUP BY 1
ORDER BY 2 DESC;

-- Count the total number of pieces where the medium contains ‘gold’ or ‘silver’. 
SELECT CASE
   WHEN medium LIKE '%gold%'   THEN 'Gold'
   WHEN medium LIKE '%silver%' THEN 'Silver'
   ELSE NULL
  END AS 'Bling',
  COUNT(*)
FROM met
WHERE Bling IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC;
-- There are 293 silver medium pieces and 41 gold medium pieces
