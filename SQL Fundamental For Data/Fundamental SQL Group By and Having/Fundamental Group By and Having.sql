select * 
from payment

select * from invoice

select* from subscription

select subscription.customer_id
from subscription 
group by customer_id
having count (customer_id)>1;

SELECT customer_id, product_id, subscription_date
FROM Subscription 
WHERE customer_id IN 
	(SELECT 
    	customer_id 
     FROM Subscription 
     GROUP BY customer_id 
     HAVING COUNT(customer_id) > 1
  	) 
ORDER BY customer_id ASC;

select * from user_customer

select * from subscription

select distinct b.Name, b.address, b.phone, a.product_id, a.subscription_date
from subscription a
join user_customer b on a.customer_id = b.id
where b.id IN (
		SELECT  
    	customer_id 
        FROM Subscription 
    GROUP BY customer_id 
    HAVING COUNT(customer_id) > 1
)

select invoice.product_id, max(total_price) as Total
from invoice 
group by product_id 

select product_id, max(total_price) as Total
from invoice 
group by product_id
having MAX(total_price) > 1000000

SELECT product_id,MAX(pinalty) AS Total
FROM invoice
GROUP BY product_id
Having MAX(pinalty) > 30000; 

ALTER TABLE [invoice] 
ALTER COLUMN [pinalty] int(2,2)

SELECT product_id, MIN(total_price) AS total 
FROM invoice
GROUP BY product_id;

SELECT product_id, MIN(total_price) AS total
FROM invoice
GROUP BY product_id
HAVING MIN(total_price)<500000;

SELECT product_id, MIN(pinalty) AS total
FROM invoice
GROUP BY product_id
HAVING MIN(pinalty)<50000;

SELECT product_id, AVG(total_price) AS total
FROM invoice
GROUP BY product_id;

SELECT product_id, AVG(total_price) AS total 
FROM invoice
GROUP BY product_id
HAVING AVG(total_price)>100000;


SELECT product_id, AVG(pinalty) AS total
FROM invoice
GROUP BY product_id
HAVING AVG(pinalty)>30000;