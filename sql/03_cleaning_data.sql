-- Cleaning Data From Cloumns 

-- Changing the values which are inconsistent in the column 'item_fat_content'
-- 1. checking the distinct values in the cloumn 'item_fat_content'
select DISTINCT item_fat_content as unique_value from blinkit_data;

-- 2. updating the inconsistent values with the correct values 
UPDATE blinkit_data 
SET item_fat_content = CASE
WHEN item_fat_content IN ('LF', 'low fat') THEN 'Low Fat'
WHEN item_fat_content = 'reg' THEN 'Regular'
ELSE item_fat_content
END;
