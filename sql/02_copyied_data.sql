COPY blinkit_data(Item_Fat_Content, Item_Identifier, Item_Type, Outlet_Establishment_Year,
Outlet_Identifier, Outlet_Location_Type, Outlet_Size, Outlet_Type, Item_Visibility, Item_Weight,
Total_Sales, Rating)
FROM 'F:\dataAnalysis\Projects\blinkit\excel_data\blinkIt_grocery_data.csv'
DELIMITER ','
CSV HEADER;