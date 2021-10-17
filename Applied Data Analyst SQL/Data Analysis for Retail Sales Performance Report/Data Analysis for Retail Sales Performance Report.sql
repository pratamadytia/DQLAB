--Overall Performance by Year
select * from dqlab_sales_store

Select YEAR(order_date) as year_sales, SUM(sales) as sales, 
count(order_quantity) as number_of_order
from dqlab_sales_store
where order_date BETWEEN '2011' AND '2012'  
AND order_status = 'Order Finished'
Group by order_date;

-- Overall Performance by Product Sub Category
SELECT
    order_date,
    product_sub_category,
    SUM(sales) AS sales
FROM
    dqlab_sales_store
WHERE
    order_date BETWEEN 2011
    AND 2012
    AND order_status LIKE 'Order Finished'
GROUP BY
    order_date,
    product_sub_category
ORDER BY
    order_date,
    sales DESC;

-- Promotion Effectiveness and Efficiency by Years
SELECT
    YEAR(order_date) as Year_sales,
    SUM(sales) AS sales,
    SUM(discount_value) AS promotion_value,
    ROUND(SUM(discount_value) / SUM(sales) * 100, 2) as burn_rate_percentage
FROM
    dqlab_sales_store
WHERE
    YEAR(order_date) BETWEEN 2009
    AND 2012
    AND order_status LIKE 'Order Finished'
GROUP BY
    order_date
ORDER BY
    order_date;

-- Promotion Effectiveness and Efficiency by Product Sub Category
SELECT YEAR(order_date) as Year_sales, product_sub_category, product_category, SUM(sales) AS sales, SUM(discount_value) AS promotion_value,ROUND(SUM(discount_value)/SUM(sales)*100, 2) as burn_rate_percentage
FROM dqlab_sales_store
WHERE YEAR(order_date)=2012 AND order_status like 'Order Finished'
Group By order_date, product_sub_category, product_category
Order By sales DESC;

-- Customers Transactions per Year
SELECT YEAR(order_date) as Years_sales, count(DISTINCT customer) as number_of_customer
FROM dqlab_sales_store
where YEAR(order_date) Between 2009 AND 2012 AND order_status Like 'Order Finished'
Group by order_date;
