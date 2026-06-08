-- Sales and profit by year
SELECT year, SUM(sales), SUM(profit)
FROM superstoreorders
GROUP BY year
ORDER BY year ASC;

-- Sales and profit by category
SELECT category, SUM(sales), SUM(profit)
FROM superstoreorders
GROUP BY category
ORDER BY SUM(sales) DESC;

-- Profit margin by sub-category
SELECT sub_category, SUM(sales), SUM(profit),
ROUND(SUM(profit)/SUM(sales)*100, 2) AS margin
FROM superstoreorders
GROUP BY sub_category
ORDER BY margin ASC;

-- Profit margin by region
SELECT region, SUM(sales), SUM(profit),
ROUND(SUM(profit)/SUM(sales)*100, 2) AS margin
FROM superstoreorders
GROUP BY region
ORDER BY margin ASC;

-- Southeast Asia deep dive
SELECT sub_category, SUM(sales), SUM(profit),
ROUND(SUM(profit)/SUM(sales)*100, 2) AS margin
FROM superstoreorders
WHERE region = 'Southeast Asia'
GROUP BY sub_category
HAVING SUM(profit)/SUM(sales)*100 < 0
ORDER BY margin ASC;