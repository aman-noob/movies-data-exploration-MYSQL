-- Looking at the Movies Data

SELECT 
    *
FROM
    movies
ORDER BY score;

-- Deleting Null values 

DELETE FROM movies 
WHERE
    name IS NULL;

-- Looking at Top grossing Movies

SELECT 
    Name, Star, Country, Budget, Gross
FROM
    movies
WHERE
    gross AND budget IS NOT NULL
ORDER BY 5 DESC;

-- Heighest Grossing Country

SELECT 
    Name, Star, Country, company, Budget, Gross
FROM
    movies
WHERE
    gross AND budget IS NOT NULL
ORDER BY country DESC;

-- Top Budgeting movies compared to Gross Revenue generated (%)
-- percentgrossing = Least Budget but max profit 
-- (Movie- Paranormal Activity	country- United States	Company-Solana Films	budget-15000	Gross-193355800	 %Gross-1289039)
SELECT 
    Name,
    Star,
    Country,
    company,
    Budget,
    Gross,
    ROUND(MAX(gross / budget), 2) * 100 AS PercentGrossing
FROM
    movies
WHERE
    gross AND budget IS NOT NULL
GROUP BY country , company
ORDER BY PercentGrossing DESC;

-- Least Budgeting movies compared to Gross Revenue generated (%)
-- percentgrossing = max Budget but least profit 
-- (Movie-Madadayo	Country-Japan	Company- DENTSU Music And Entertainment	BUdget - 11900000	gross- 596)
SELECT 
    Name,
    Star,
    Country,
    company,
    Budget,
    Gross,
    ROUND(MAX(budget / gross), 2) * 100 AS PercentGrossing
FROM
    movies
WHERE
    gross AND budget IS NOT NULL
GROUP BY country , company
ORDER BY PercentGrossing DESC;
-- Looking at Best Rated Movies (Star Wars: Episode V - The Empire Strikes Back- 8.7)

SELECT 
    Name, score, company, Budget, Gross
FROM
    movies
WHERE
    gross AND budget IS NOT NULL
GROUP BY country , company
ORDER BY 2 DESC;

-- Oldest/Latest movie in the data set (The Shining: 1980)/(Tee em el: 2020)

SELECT 
    Name, Country, company, year, Budget, Gross
FROM
    movies
ORDER BY 4 DESC;

-- Top Grossing Company 

SELECT 
    Name, Country, company, year, Budget, Gross
FROM
    movies
WHERE
    budget AND gross IS NOT NULL
GROUP BY company , country
ORDER BY 6 DESC;

-- creating View for data vizualisation

CREATE VIEW data_viz_movies as
SELECT 
  Name, Rating, year,score, company, Budget, Gross
FROM
	movies
WHERE 
	name is not null
ORDER BY 2 desc;

SELECT 
    *
FROM
    data_viz_movies
WHERE
    budget IS NOT NULL;






