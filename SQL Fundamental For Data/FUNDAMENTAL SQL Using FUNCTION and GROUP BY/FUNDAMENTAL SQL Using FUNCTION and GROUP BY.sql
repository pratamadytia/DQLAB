select * from students

--Abs func
SELECT
    studentid,
    firstname,
    lastname,
    semester1,
    semester2,
    ABS(markgrowth) AS markgrowth
FROM
    students;

--Concat Func
select Studentid, Concat(firstname, lastname)as StudentName, semester1, semester2, MarkGrowth
from students;

--substring
SELECT
    studentid,SUBSTRING(Email, 1, 1) as StudentName
FROM
    students

Select StudentID, SUBSTRING(FirstName,2, 3) as initial
From students;

Select studentid, FirstName, LEN(FirstName) as totalCHar
from students;

Select studentid, Email, REPLACE(Email, 'yahoo', 'gmail') as NewEmail
from students;

--tugas praktek
select studentid, upper(FirstName) As Firstname, LOWER(LastName) AS Lastname
from students

select sum(semester1) as total1, sum(semester2) as total2
from students

select count(Firstname) as totalstudent
from students;

select AVG(semester1) as AVG_1, AVG(semester2) as AVG_2
from students;

select min(semester1) as min_1, max(Semester1) as max_1, 
min(semester1) as min_2, max(semester2)
from students;

select * from sales_retail_2019

select province, count(Distinct order_id) as TotalOrder, 
sum(item_price) as TotalPrice
from sales_retail_2019
Group by province;

select province, brand, Count(distinct order_id) as totalorder,
sum(item_price) as totalprice
from sales_retail_2019
Group by province, brand

select province, count(distinct order_id) as total_unique_order,
sum(item_price) as Revenue 
from sales_retail_2019
Group by province;  

select month(order_date) as Order_month, sum(item_price) as total_price, 
case 
WHEN sum(item_price) >= 30000000000 THEN 'Target Achieved'
WHEN sum(item_price) <= 25000000000 THEN 'Less Performed'
ELSE 'Follow Up'
END as remark
FROM sales_retail_2019
GROUP BY MONTH(order_date);

select * from tr_penjualan

--praktek part 1
SELECT SUM(total) as total 
FROM tr_penjualan;

-- 2. Total quantity seluruh produk yang terjual.
SELECT sum(qty) as qty 
FROM tr_penjualan;

-- 3. Total quantity dan total revenue untuk setiap kode produk.
SELECT kode_produk, sum(qty) as qty, sum(total) as total 
FROM tr_penjualan
GROUP BY kode_produk;

-- 4. Rata - Rata total belanja per kode pelanggan.
SELECT kode_pelanggan, avg(total) as avg_total
FROM tr_penjualan
GROUP BY kode_pelanggan;
/* 5. Selain itu, jangan lupa untuk menambahkan kolom baru
dengan nama ‘kategori’ yang mengkategorikan total/revenue ke dalam
3 kategori: High: > 300K; Medium: 100K - 300K; Low: <100K. */
SELECT kode_transaksi,kode_pelanggan,no_urut,kode_produk, nama_produk, qty, total,
CASE
WHEN total > 300000 THEN 'High'
WHEN total < 100000 THEN 'Low'
ELSE 'Medium'
END as kategori
FROM tr_penjualan;