select * from sales;
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)




-- RETRIEVE ALL columns for sales made on '2022-11-05'
-- select * from sales where sale_date = '2022-11-05';



-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022

-- select * from sales where category='Clothing' and date_format(sale_date,'%M-%Y') ='November-2022' and quantiy>=4 ;


-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.


-- select category,sum(total_sale) from sales group by category;


-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

-- select category,avg(age) from  sales where category='Beauty' group by category



-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.

-- select * from sales where total_sale>=10001



-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.


-- select gender,count(*) from sales group by gender



-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year



-- with cte as (select date_format(sale_date,'%Y') as selling_year,date_format(sale_date,'%M') as selling_month ,round(avg(total_sale),2) as avg_sale,
-- row_number () over(partition by date_format(sale_date,'%Y') order by avg(total_sale) desc ) as rnk
--  from sales group by date_format(sale_date,'%M'),date_format(sale_date,'%Y') ) 
--  select * from cte where rnk=1
 
 
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- select customer_id,sum(total_sale) as total_sale from sales group by  customer_id order by sum(total_sale) desc limit 5



-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- select category,count(distinct customer_id) as unique_customer from sales group by category



-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
select 
case when sale_time<='12:00:00' then 'Morning' 
when sale_time>'12:00:00' and sale_time<='17:00:00'  then 'Afternoon'
when sale_time>'17:00:00' then 'Evening' end as shift,
count(*) as numbers_of_orders
from sales 
group by shift