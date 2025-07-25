-- 1. Total Number of Sales 
select count(*) from sales_data;

-- 2. Analyze how sales change year by year
select 
Extract(year from order_date) as year,
round(sum(sales)::numeric,2) as total_sale
from sales_data
group by 
year;


-- 3. Analyze total sales by month for each year and identified the top-performing sales month
    select 
    to_char(order_date,'Month') as month_name,
    extract(month from order_date) as month_number,
    extract(year from order_date) as year,
    round(sum(sales)::numeric,2) as total_sale
    from sales_data
    group by 
    year,month_number,month_name
    order by
    year,total_sale desc;

-- 4. the most profitable month and year.
select distinct on (year)
extract(year from order_date) as year,
to_char(order_date,'FMMonth') as month,
round(sum(profit)::numeric,2) as total_profit
from sales_data
group by year,month
order by year,total_profit desc;

-- 5. Compare monthly profit and sales trends also find cost.
select 
to_char(order_date,'FMMonth') as months,
extract(month from order_date) as months_number,
extract(year from order_date) as year,
round(sum(sales)::numeric,2) as total_sales,
round(sum(profit)::numeric,2) as total_profit,
round((sum(sales)-sum(profit))::numeric,2) as cost
from sales_data
group by months,year,months_number
order by year,months_number;

-- 6. Check if there's a peak sales season.
SELECT 
  TO_CHAR(order_date, 'Month') AS month_name,
  EXTRACT(MONTH FROM order_date) AS month_number,
  ROUND(SUM(sales)::NUMERIC, 2) AS total_sales
FROM sales_data
GROUP BY month_name, month_number
ORDER BY total_sales
limit 5;

-- 7. Top 5 top-performing States and cities by sales
select
state,
city,
round(sum(sales)::numeric,2) as total_sale
from sales_data
group by state,city
order by total_sale desc
limit 5;

-- 8. Find the least profitable regions.
select
region,
round(sum(profit)::numeric,2) as total_profit
from
sales_data
group by region
order by total_profit
limit 1;

-- 9. Compare sales by region and profit by region.
select
region,
round(sum(sales)::numeric,2) as total_sales,
round(sum(profit)::numeric,2) as total_profit
from
sales_data
group by region
order by total_sales desc;

-- 10. Find the top 5 selling categories and subcategories.
select 
category,
subcategory,
round(sum(sales)::numeric,2) as total_sale
from 
sales_data
group by category,subcategory
order by total_sale desc
limit 5;

-- 11. Discover most profitable products.
select subcategory,
round(sum(profit)::numeric,2) as total_profit
from sales_data
group by subcategory
order by total_profit desc;

-- 12. List the products that are sold a lot but make very little profit.
select subcategory,
round(sum(sales)::numeric,2) as total_sale,
round(sum(profit)::numeric,2) as total_profit,
ROUND((SUM(profit)::numeric / NULLIF(SUM(sales), 0)::numeric) * 100, 2) AS percentage
from sales_data
group by subcategory
HAVING SUM(sales) > 10000 AND SUM(profit) < 500
order by total_sale desc;

-- 13. Identify products with negative profits.
select
subcategory,
round(sum(sales)::numeric,2) as total_sales,
round(sum(profit)::numeric,2) as total_profit
from
sales_data
group by
subcategory
having sum(profit) < 0
order by total_profit desc;

-- 14. List the top 10 customers by sales.
select 
customer_name,
round(sum(sales)::numeric,2) as total_sale
from sales_data
group by customer_name
order by total_sale desc
limit 10;

-- 15. Group customers by segment  and compare performance.
select
segment,
count(distinct customer_id) as total_customers,
round(sum(sales)::numeric,2) as total_sale
from sales_data
group by segment order by total_sale desc;

-- 16. Analyze average order size per customer.
select 
customer_name, 
count(distinct order_id) as total_order,
round(sum(sales)::numeric,2) as total_sales,
round(sum(sales)::numeric / count(distinct order_id),2) as avg_order_value
from sales_data
group by customer_name
order by avg_order_value desc;

-- 17. the average shipping time.
select round(avg(ship_date::date - order_date::date),2) from sales_data;

-- 18. Identify orders with the longest shipping delays.
select order_id,order_date,ship_date,
round(max(ship_date::date - order_date::date),2) as maximum_delay
from sales_data
group by order_id,order_date,ship_date
order by maximum_delay desc
limit 1;

-- 19. Group sales by ship_mode to find the most used method.
select ship_mode,
count(*) as total_orders,
round(sum(sales)::numeric,2) as total_sale
from sales_data group by ship_mode
order by total_sale desc;

-- 20. Count the number of returned orders.
select subcategory,count(returns) as total_returns 
from sales_data
where returns = 1
group by
subcategory
order by total_returns desc; 

-- 21. Find the top 5 products or categories with the most returns.
select category,subcategory,
count(returns) as total_returns 
from sales_data
where returns = 1
group by
category,subcategory
order by total_returns desc
limit 5;

-- 22. Compare return rate per category.
select category,
count(case when returns = 1 then 1 end) as total_returns,
count(*) as total_orders,
round(count(case when returns = 1 then 1 end)::numeric / count(*)::numeric,2)*100 as return_rate
from sales_data
group by category,returns
order by return_rate desc;

-- 23. Check which payment modes are used most frequently.
select payment_mode,count(*) as total_payment_mode from sales_data group by payment_mode order by total_payment_mode desc;

-- 24. See if any payment mode is linked with more returns.
select 
payment_mode,
count(*) as total_payment_mode,
sum(case when returns = 1 then 1 else 0 end) total_returns
from sales_data
group by payment_mode
order by total_payment_mode desc;

-- 25. Calculate the profit margin (profit/sales) per order or product.
select category,
round(sum(sales)::numeric,2) as total_sale,
round(sum(profit)::numeric,2) as total_profit,
round((sum(profit)::numeric / sum(sales)::numeric)*100,2) as profit_margin
from sales_data
group by category
order by profit_margin desc;

-- 26. Find the best customer in each region.
select distinct on (region)
customer_name,
region,
round(sum(sales)::numeric,2) as highest_sale from sales_data
group by customer_name,region order by region,highest_sale desc;


