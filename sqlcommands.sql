create database company;
use company;
select * from sales;
select order_ID from sales where Ship_Mode  = 'Economy' and Total_amount > 25000;

select * from sales where Ship_Mode  = 'Economy' and Total_amount > 25000;

select * from sales where Category = 'Technology' and Country = 'Ireland' and Order_Date > '2020-01-01';

select * from sales  order by Unit_Profit desc limit 10;

select Order_ID,Customer_Name from sales where Customer_Name like 'J%n';

select Order_ID,Product_Name from sales where Product_Name like '%Acco%';

#Get the top 5 cities with the highest total sales amount
select City,sum(Total_amount) as total_sales from sales group by city order by total_sales DESC limit 5;

#Display the second set of 10 records for customers_nmae and total_amount in decreasing order
select Customer_Name,Total_Amount from sales order by Total_Amount DESC limit 10,10;

#find the total revenue ,  average unit cost , and total number of orders;
select sum(Total_Amount) as `TOTAL_REVENUE`,avg(Unit_Cost),count(Order_ID) from sales;

#count unique number of regions
select count(distinct(Region)) as Uni_Reg from sales ;

#find the number of orders palced by each customer
select Customer_Name,count(order_ID) as total_orders from sales group by Customer_Name order by total_Orders DESC;

#Rank 5 products based on total sales using RANK()
select Product_Name,sum(Total_Amount) as Total_Sales, rank() over (order by sum(Total_Amount) DESC) as Sales_Rank from sales group by Product_Name limit 5;