CREATE DATABASE IF NOT EXISTS books_db;
USE books_db;
-- Overall Summary Statistics
-- Gives a quick snapshot of total books, average rating, price, and number of reviews.
SELECT 
    COUNT(*) AS total_books,
    AVG(Rating_out_of_5) AS avg_rating,
    AVG(Price) AS avg_price,
    AVG(No_of_Ratings) AS avg_num_reviews
FROM books;

-- Average Price and Rating by Cover Type

-- Identifies popular cover types and their average price/rating.

SELECT 
    Cover_Type, 
    COUNT(*) AS num_books,
    ROUND(AVG(Price), 2) AS avg_price, 
    ROUND(AVG(Rating_out_of_5), 2) AS avg_rating
FROM books
GROUP BY Cover_Type
ORDER BY num_books DESC;


-- Create age_group_view properly with full SELECT
-- shows which age groups have the most books and their engagement stats.

CREATE OR REPLACE VIEW age_group_view AS
SELECT
  CASE
    WHEN Min_Age BETWEEN 0 AND 2 THEN '0–2'
    WHEN Min_Age BETWEEN 3 AND 5 THEN '3–5'
    WHEN Min_Age BETWEEN 6 AND 8 THEN '6–8'
    WHEN Min_Age BETWEEN 9 AND 12 THEN '9–12'
    ELSE 'Unknown'
  END AS age_group,
  COUNT(*) AS num_books,
  ROUND(AVG(Rating_out_of_5), 2) AS avg_rating
FROM books
WHERE Min_Age BETWEEN 0 AND 12
GROUP BY age_group
ORDER BY age_group;

SELECT * FROM age_group_view;


-- Top 5 Most Reviewed Books
-- Reveals the most popular books by number of ratings.
SELECT 
    Name, 
    Author, 
    No_of_Ratings, 
    Rating_out_of_5, 
    Price
FROM books
ORDER BY No_of_Ratings DESC
LIMIT 5;

-- Top 5 Bestseller Categories
-- Finds the most frequent bestseller labels/categories.
SELECT 
    TRIM(REPLACE(Best_Seller, 'in ', '')) AS Bestseller_Category,
    COUNT(*) AS num_books
FROM books
WHERE Best_Seller IS NOT NULL
GROUP BY Bestseller_Category
ORDER BY num_books DESC
LIMIT 5;


-- Revised SQL Query: Discounted vs Non-Discounted

DESCRIBE books;
SELECT 
    CASE 
        WHEN CAST(Price AS DECIMAL(10,2)) < CAST(Price_Befor AS DECIMAL(10,2)) THEN 'Yes'
        ELSE 'No'
    END AS Is_Discounted,
    COUNT(*) AS num_books,
    ROUND(AVG(No_of_Ratings), 0) AS avg_reviews,
    ROUND(AVG(Rating_out_of_5), 2) AS avg_rating
FROM books
WHERE 
    Price IS NOT NULL AND 
    Price_Befor IS NOT NULL AND 
    Price != '' AND 
    Price_Befor != ''
GROUP BY Is_Discounted;


-- Handle Currency Symbols + Compare Discounts

-- Compares how discounts affect ratings and popularity.
SELECT 
    CASE 
        WHEN CAST(REPLACE(Price, '$', '') AS DECIMAL(10,2)) 
             < CAST(REPLACE(Price_Befor, '$', '') AS DECIMAL(10,2)) THEN 'Yes'
        ELSE 'No'
    END AS Is_Discounted,
    COUNT(*) AS num_books,
    ROUND(AVG(No_of_Ratings), 0) AS avg_reviews,
    ROUND(AVG(Rating_out_of_5), 2) AS avg_rating
FROM books
WHERE 
    Price IS NOT NULL AND 
    Price_Befor IS NOT NULL AND 
    Price != '' AND 
    Price_Befor != ''
GROUP BY Is_Discounted;

-- Time-Based Analysis (Publication Trends)
-- Shows publishing trends and quality over the years. Good for line or bar charts.
SELECT 
  LEFT(Publication_Date, 4) AS pub_year,
  COUNT(*) AS books_published,
  ROUND(AVG(Rating_out_of_5), 2) AS avg_rating
FROM books
WHERE Publication_Date IS NOT NULL
GROUP BY pub_year
ORDER BY pub_year;

-- Series vs. Standalone Books
-- Highlights whether series books get better ratings or are more popular

SELECT 
  CASE 
    WHEN Series IS NOT NULL AND Series != '' THEN 'Series' 
    ELSE 'Standalone' 
  END AS book_type,
  COUNT(*) AS num_books,
  ROUND(AVG(Rating_out_of_5), 2) AS avg_rating,
  ROUND(AVG(No_of_Ratings), 0) AS avg_reviews
FROM books
GROUP BY book_type;

-- Most Common Authors
-- Useful for top author analysis or to show who dominates certain age groups.

SELECT 
  Author, 
  COUNT(*) AS num_books,
  ROUND(AVG(Rating_out_of_5), 2) AS avg_rating
FROM books
WHERE Author IS NOT NULL AND Author != ''
GROUP BY Author
ORDER BY num_books DESC
LIMIT 10;


SELECT 
  Author, 
  COUNT(*) AS num_books,
  ROUND(AVG(Rating_out_of_5), 2) AS avg_rating
FROM books
WHERE Author IS NOT NULL AND Author != ''
GROUP BY Author
ORDER BY num_books DESC
LIMIT 10;

