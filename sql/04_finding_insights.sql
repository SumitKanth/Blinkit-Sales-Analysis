-- 1. Total sales from total_sales column and convert it to milions with 2 decimal places.
SELECT CONCAT(CAST(SUM(total_sales) / 1000000 AS DECIMAL(10, 2)), 'M') AS Total_Sales_Millons 
FROM blinkit_data;

-- 2. Average of total_sales columnand convert it to decimal.
SELECT CAST(AVG(total_sales) AS DECIMAL(10, 0)) AS Avg_Sales 
FROM blinkit_data;

-- 3. Count total number of itmes. 
SELECT count(item_type) AS No_Of_Items FROM blinkit_data;   

-- 4. Average rating.
SELECT CAST(AVG(rating) AS DECIMAL(10, 2)) AS Avg_Rating FROM blinkit_Data;

-- 5. Total_Sales, Avg_Sales, Number_Of_Items, Avg_Rating of each values in item_fat_content column.
SELECT item_fat_content, 
	CONCAT(CAST(SUM(total_sales)/1000 AS DECIMAL(10, 0)), 'K') AS Total_Sales_In_Thousands,
	CAST(AVG(total_sales) AS DECIMAL(10, 1)) AS Avg_Sales,
	COUNT(total_sales) AS No_Of_Items,
	CAST(AVG(rating) AS DECIMAL(10, 2)) AS Avg_Rating
FROM blinkit_data
GROUP BY item_fat_content
ORDER BY Total_Sales_In_Thousands DESC; 

-- 5. Total Sales By Item_Type.
SELECT item_type, 
	CAST(SUM(total_sales) AS DECIMAL(10, 2)) AS Total_Sales,
	CAST(AVG(total_sales) AS DECIMAL(10, 1)) AS Avg_Sales,
	COUNT(total_sales) AS No_Of_Items,
	CAST(AVG(rating) AS DECIMAL(10, 2)) AS Avg_Rating
FROM blinkit_data
GROUP BY item_type
ORDER BY Total_Sales DESC
LIMIT 5; 

-- 6. Total Sales By outlet_location_type by item_fat_content.
SELECT 
    outlet_location_type,
    COALESCE(SUM(total_sales) FILTER (WHERE item_fat_content = 'Low Fat'), 0) AS Low_Fat,
    COALESCE(SUM(total_sales) FILTER (WHERE item_fat_content = 'Regular'), 0) AS Regular
FROM blinkit_data
GROUP BY outlet_location_type
ORDER BY outlet_location_type DESC;


-- 7. Total Sales, Average, Count of items, Average Rating by outlet_establishment_year.
SELECT outlet_establishment_year,
		CAST(SUM(total_sales) AS DECIMAL(10, 2)) AS Total_Sales,
		CAST(AVG(total_sales) AS DECIMAL(10, 1)) AS Avg_Sales,
		COUNT(*) No_Of_Itmes,
		CAST(AVG(rating) AS DECIMAL(10, 2)) AS Avg_Rating
FROM blinkit_data
GROUP BY outlet_establishment_year
ORDER BY outlet_establishment_year ASC;

-- 8. Total Sales Percantage by outler_size.
SELECT outlet_size, 
		CAST(SUM(total_sales) AS DECIMAL(10, 2)) AS Total_Sales,
		CAST(SUM(total_sales) * 100.0 / SUM(SUM(total_sales)) OVER() AS DECIMAL(10, 2)) AS Sales_Percentage
FROM blinkit_data
GROUP BY outlet_size
ORDER BY Total_Sales DESC;

-- 9. Sales Percentage, Total Sales, Average, Count of items, Average Rating by outlet_location_type.
SELECT outlet_location_type,
		CAST(SUM(total_sales) * 100.0 / SUM(SUM(total_sales)) OVER() AS DECIMAL(10, 2)) AS Sales_Percentage,
		CAST(SUM(total_sales) AS DECIMAL(10, 2)) AS Total_Sales,
		CAST(AVG(total_sales) AS DECIMAL(10, 1)) AS Avg_Sales,
		COUNT(*) No_Of_Itmes,
		CAST(AVG(rating) AS DECIMAL(10, 2)) AS Avg_Rating
FROM blinkit_data
GROUP BY outlet_location_type
ORDER BY Total_Sales DESC;		

-- 10. Total Sales, Sales Percentage, Average, Count of items, Average Rating by outlet_type.
SELECT outlet_type,
	   CAST(SUM(total_sales) AS DECIMAL(10, 2)) AS Total_Sales,
	   CAST(SUM(total_sales) * 100.0 / SUM(SUM(total_sales)) OVER() AS DECIMAL(10, 2)) AS Sales_Percentage,
	   CAST(AVG(total_sales) AS DECIMAL(10, 2)) AS Avg_Sales,
	   COUNT(item_type) AS Number_Of_Items,
	   CAST(AVG(rating) AS DECIMAL(10, 2)) AS Avg_Rating	   
FROM blinkit_data
GROUP BY outlet_type
ORDER BY Total_Sales DESC;