use [Pizza DB]
select * from pizza_sales
select SUM(total_price) as "Total Revenue" from pizza_sales
select SUM(total_price)/COUNT(Distinct order_id) as "Average_order" from pizza_sales
select SUM(quantity) as "Total_pizzas sold" from pizza_sales
select Count(distinct order_id) as "Total_orders_placed" from pizza_sales

select CAST(
CAST(SUM(quantity) as decimal(10,2))/
CAST(Count(distinct order_id) as decimal(10,2)) as decimal(10,2))
as "Avg._pizzas per order" from pizza_sales

select DATENAME(DW,order_date) as "Order days",COUNT(Distinct(order_id)) as "Total Orders" 
from pizza_sales group by DATENAME(DW,order_date)

select DATENAME(MONTH,order_date) as "Order Months",COUNT(Distinct(order_id)) as "Total Orders" 
from pizza_sales 
group by DATENAME(MONTH,order_date) 
order by [Total Orders] desc 

Select pizza_category,sum(total_price) as "Total Sales as per Category",
SUM(total_price)*100 / (Select SUM(total_price) from pizza_sales)
as "Percentage Sales as per Category" from pizza_sales 
group by pizza_category

Select pizza_size,sum(total_price) as "Total Sales as per pizza_size",
SUM(total_price)*100 / (Select SUM(total_price) from pizza_sales)
as "Percentage Sales as per pizza_size" from pizza_sales 
group by pizza_size
order by "Percentage Sales as per pizza_size","Total Sales as per pizza_size"

--top 5 with respect to total price sold
Select Top (5) pizza_name,SUM(total_price) as "Total Revenue" 
from pizza_sales
Group by pizza_name
Order by [Total Revenue] desc

--bottom 5 with respect to total price sold
Select Top (5) pizza_name,SUM(total_price) as "Total Revenue" 
from pizza_sales
Group by pizza_name
Order by [Total Revenue] asc

--top 5 with respect to highest no. pizza sold as per quantity  
Select Top (5) pizza_name,SUM(quantity) as "Total Quantity" 
from pizza_sales
Group by pizza_name
Order by [Total Quantity] desc

--bottom 5 with respect to smallest no. pizza sold as per quantity
Select Top (5) pizza_name,SUM(quantity) as "Total Quantity" 
from pizza_sales
Group by pizza_name
Order by [Total Quantity] asc

--top 5 with respect to highest no. pizzas orderd as per pizza names saperately  
Select Top (5) pizza_name,COUNT(distinct(order_id)) as "Total Orders as per pizza names saperately" 
from pizza_sales
Group by pizza_name
Order by [Total Orders as per pizza names saperately] desc


--bottom 5 with respect to lowest no. pizzas orderd as per pizza names saperately  
Select Top (5) pizza_name,COUNT(distinct(order_id)) as "Total Orders as per pizza names saperately" 
from pizza_sales
Group by pizza_name
Order by [Total Orders as per pizza names saperately] asc
