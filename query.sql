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
ORDER BY month_number;

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
order by total_profit;