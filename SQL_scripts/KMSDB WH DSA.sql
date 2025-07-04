CREATE DATABASE KMSDB;
GO
USE KMSDB;
GO


----TO CHECK THAT THE WHOLE TABLE WAS TRASFERRED SUCCESSFULLY---
SELECT COUNT(*) FROM [KMS-ORDERS];
SELECT COUNT(*) FROM [Order_Status];


--CHECKING THE NAMES OF EACH COLUMN--
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'KMS-ORDERS';



------CASE SCENARIO 1--

--Q1: CATEGORY WITH HIGHEST SALES-----
SELECT Product_Category, 
       SUM(Sales) AS TotalSales
FROM [KMS-ORDERS]
GROUP BY Product_Category
ORDER BY TotalSales DESC;


----Q2: TOP 3 AND BOTTOM 3 IN SALES---
-- Top 3
SELECT TOP 3 Region, SUM(Sales) AS TotalSales
FROM [KMS-ORDERS]
GROUP BY Region
ORDER BY TotalSales DESC;
-- Bottom 3
SELECT TOP 3 REGION, SUM(SALES) AS TOTALSALES
FROM [KMS-ORDERS]
GROUP BY Region
ORDER BY TOTALSALES ASC;


-----Q3: TOTAL SALES OF APPLIANCES IN ONTARIO---
SELECT SUM(SALES) AS [TOTAL-APPLIANCESALES]
FROM [KMS-ORDERS]
WHERE [PRODUCT_SUB_CATEGORY] ='APPLIANCES'
AND Province = 'ONTARIO'


-----Q4: REVENUE FROM BOTTOM 10 CUSTOMERS---
SELECT TOP 10[Customer_Name], SUM(Sales) AS TotalSales, COUNT(*) AS Orders
FROM [KMS-ORDERS]
GROUP BY [Customer_Name]
ORDER BY TotalSales ASC;


----Q5: MOST EXPENSIVE SHIPPING METHOD---
SELECT [Ship_Mode], SUM([Shipping_Cost]) AS [TotalShippingCost]
FROM [KMS-ORDERS]
GROUP BY [Ship_Mode]
ORDER BY TotalShippingCost DESC;


----CASE SCENARIO 2----

---Q6: VALUABLE CUSTOMERS AND PRODUCTS THEY PURCHASE----
SELECT TOP 5 
    [Customer_Name],
    SUM(Sales) AS TotalSales
FROM [KMS-ORDERS]
GROUP BY [Customer_Name]
ORDER BY TotalSales DESC;

SELECT DISTINCT [Customer_Name], [Product_Category]
FROM [KMS-ORDERS]
WHERE [Customer_Name] = 'Emily Phan';

SELECT DISTINCT [Customer_Name], [Product_Category]
FROM [KMS-ORDERS]
WHERE [Customer_Name] = 'Deborah Brumfield';

SELECT DISTINCT [Customer_Name], [Product_Category]
FROM [KMS-ORDERS]
WHERE [Customer_Name] = 'Roy Skaria';

SELECT DISTINCT [Customer_Name], [Product_Category]
FROM [KMS-ORDERS]
WHERE [Customer_Name] = 'Sylvia Foulston';

SELECT DISTINCT [Customer_Name], [Product_Category]
FROM [KMS-ORDERS]
WHERE [Customer_Name] = 'Grant Carroll';

-- AN ALTERNATIVE FOR Q6---

SELECT [Customer_Name], [product_Category], SUM(Sales) AS CategorySales
FROM [KMS-ORDERS]
WHERE [Customer_Name] IN (
    SELECT TOP 5 [Customer_Name]
    FROM [KMS-ORDERS]
    GROUP BY [Customer_Name]
    ORDER BY SUM(Sales) DESC
)
GROUP BY [Customer_Name], [product_Category]
ORDER BY [Customer_Name], CategorySales DESC;



----Q7: SMALL BUSNIESS CUSTOMER WITH THE HIGHEST SALES---

SELECT top 1 [Customer_Name], SUM(Sales) AS TotalSales
FROM [KMS-ORDERS]
WHERE [Customer_Segment] = 'Small Business'
GROUP BY [Customer_Name]
ORDER BY TotalSales DESC;


---Q8: CORPRATE CUSTOMER WITH MOST ORDERS-----

select top 1 [customer_name], count (*) as totalorders
from [KMS-ORDERS]
where [customer_segment] = 'Corporate'
group by [customer_name]
order by totalorders desc;


----Q9: MOST PROFITABLE CONSUMER CUSTOMER---

SELECT Top 1 [CUSTOMER_NAME], SUM (PROFIT) AS TOTALPROFIT
FROM [KMS-ORDERS]
WHERE [CUSTOMER_SEGMENT] = 'Consumer'
GROUP BY [CUSTOMER_NAME]
ORDER BY TOTALPROFIT DESC;


---Q10: CUSTOMERS THAT RETURNED ITEMS AND THEIR SEGMNETS

SELECT DISTINCT o.[Customer_Name], o.[CUSTOMER_Segment]
FROM [KMS-ORDERS] o
JOIN ORDER_STATUS r ON o.[Order_ID] = r.[Order_ID];


-----Q11: SHIPPING COSTS VS ORDER PRIORITY---

SELECT [Order_Priority], [Ship_Mode],
       COUNT(*) AS TOTALOrders,
       SUM([Shipping_Cost]) AS TotalCost,
       AVG([Shipping_Cost]) AS AvgCost
FROM [KMS-ORDERS]
GROUP BY [Order_Priority], [Ship_Mode]
ORDER BY [Order_Priority], [Ship_Mode];



