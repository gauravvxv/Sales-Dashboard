-- 1. Total Number of Sales 
select count(*) from sales_data;

-- 2. Analyze how sales change year by year
select 
Extract(year from order_date) as year,
round(sum(sales)::numeric,2) as total_sale
from sales_data
group by 
year;


-- 3. Analyze total sales by month for the year and identified the top-performing sales month
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





