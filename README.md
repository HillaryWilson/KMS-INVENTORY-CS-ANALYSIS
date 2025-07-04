# KMS-INVENTORY-CS-ANALYSIS
This is an Sql-based analysis of Kultra Mega Stores (KMS), which specialises in office supplies and furniture. This is a Capstone project, organised by DSA, Incubator hub. 
---
##  Project Overview

Kultra Mega Stores (KMS) is a Lagos-based retail company specializing in office supplies, furniture, and technology. The company operates across various customer segments, including individual consumers, small businesses, and corporate clients.

As a Business Intelligence Analyst, I was tasked with analyzing order data (2009–2012) for the Abuja division of KMS. The goal was to answer business-critical questions using SQL, generate insights from the data, and recommend strategies for increasing profitability, reducing costs, and improving customer experience.

---

##  Tools Used

- **Microsoft SQL Server 2022** – Querying and analysis
- **GitHub** – Project documentation and sharing
- **Notepad** – SQL script editing

---

##  Dataset Description

The project was based on two main CSV files:

| File Name                | Description                                |
|--------------------------|--------------------------------------------|
| `KMS_Sql_Case_Study.csv` | Contains all sales orders and details      |
| `Order_Status.csv`       | Contains orders marked as "Returned" only  |

These files were imported into a SQL Server database and structured into two tables:

`[KMS-ORDERS]` – Main transaction data
- *TOTAL ROWS: 8399*
- *TOTAL COLUMNS: 21*

`ORDER_STATUS` – Returned order data
- *TOTAL ROWS: 572*
---

##  Case Study Questions & Answers
 -**TOTAL ORDERS**: 8399

###  **Case Scenario 1: Business Performance**


1. **Which product category had the highest sales?**  

```sql
SELECT Product_Category, 
       SUM(Sales) AS TotalSales
FROM [KMS-ORDERS]
GROUP BY Product_Category
ORDER BY TotalSales DESC;
```
   → *Technology* led in sales across all years.

   ***Insight***: Top category = most valuable for revenue. Management should invest more in this.


2. **What are the Top 3 and Bottom 3 regions in terms of sales?**  

   → *Top:* West (3597549), Ontario (3063212), Prarie (2837304)

   → *Bottom:* Nunavut (116376), Northwest Territories (800847), Yukon (975867)
 
  ***Insight***: Boost marketing and operations in bottom regions.


3. **What were the total sales of appliances in Ontario?**  

   → Total sales of appliances in Ontario = 202346.8 


4. **Advise management on increasing revenue from the bottom 10 customers.** 

   → I Recommend loyalty incentives, personalized product bundles, and promotions to encourage repeat purchases.Offer bundle discounts or loyalty programs, Recommend products frequently bought by high-value customers, Personalized email promotions.


5. **KMS incurred the most shipping cost using which shipping method?** 

   → Surprisingly, *Delivery Truck* had the highest total shipping cost of 51971.9.

---

###  **Case Scenario 2: Customer Behavior**

6. **Who are the most valuable customers, and what do they typically purchase?**  
 
   → Top customers were mostly large-scale buyers of Furniture, Technology and Office Supplies.

They include; Emily Phan (117124.4), Deborah Brumfield (97433.1), Roy Skaria(92542.2), Sylvia Foulston(88875.8), Grant Carroll (88417). this analysis Helps target repeat buyers with personalized offers.

7. **Which small business customer had the highest sales?**  

   → *Dennis Kane* was the highest spender among Small Business clients with total sales of 75967.6.

8. **Which corporate customer placed the most orders from 2009 to 2012?**

   → *Adam Hart* had the highest order count in the Corporate segment, with 27 total orders.

9. **Which consumer customer was the most profitable?**  

```sql
SELECT top 1 [CUSTOMER_NAME], SUM (PROFIT) AS TOTALPROFIT
FROM [KMS-ORDERS]
WHERE [CUSTOMER_SEGMENT] = 'Consumer'
GROUP BY [CUSTOMER_NAME]
ORDER BY TOTALPROFIT DESC;
```
   → *Emily Phan* yielded the highest profit in the Consumer segment, with a Total profit of 34005.4.

10. **Which customers returned items, and what segments do they belong to?**  
```sql
SELECT DISTINCT o.[Customer_Name], o.[CUSTOMER_Segment]
FROM [KMS-ORDERS] o
JOIN ORDER_STATUS r ON o.[Order_ID] = r.[Order_ID];
```

   → Returned items were recorded across all segments, notably Corporate and Small Business and a few from Home Office and Consumer.


11. **Is shipping cost aligned with order priority?**  

   → Contuary to the question, after analysis, the Shipping mode with the most shipping cost was **Delivery Truck** and the Shipping mode with the least was **Express Air**.
 
**BUT** if the Delivery Truck was the least expensive, then *No.* Most of the orders, regardless of priority made use of methods like Delivery Truck, which definetly took a lot of time, especially for the Critical and high priority orders. Therefore, there was no significant correlation of the shipping cost or mode with Order priority, indicating a mismatch between cost and urgency. 

*ALTHOUGH* as Express air was the shipping mode with the least shipping cost, the answer is still NO, the company most definetly spent the shipping cost appropriately IN.

***Insight***: I Suggest aligning shipping mode with order priority to save costs.

---

##  Key Recommendations

-  **Double down on top categories** like Technology, which consistently drive revenue.
-  **Target low-value customers** with discounts, personalized offers, and engagement campaigns.
-  **Review shipping strategies** to ensure low-priority orders use more economical methods.
-  **Invest in underperforming regions** through localized marketing and product adaptation.
-  **Track returned items per segment** to identify quality or satisfaction issues.

---

## 🧱 Project Structure

```
Kultra-Mega-Stores-Inventory-Case-Study/
|
├── 📄 README.md ← This project summary and insights
├── 📁 SQL_Scripts/
│ └── KMS_Case_Study_Queries.sql ← All SQL queries for Q1–Q11
│
├── 📁 Data/
│ ├── KMS_Sql_Case_Study.csv ← Main sales dataset
│ └── Order_Status.csv ← Returned orders
```

---

##  How to Use

1. Open `SQL_Scripts/KMS_Case_Study_Queries.sql` in SSMS
2. Run each query after connecting to the database with imported tables
3. Review insights per question to support business decision-making

---

##  Author

*WILSON, Hillary*  
📧 willhillary20@gmail.com  
🔗 [LinKedIn Profile](www.linkedin.com/in/wilson-hillary-597748342)
🔗 [GitHub Profile](https://github.com/HillaryWilson)

---
