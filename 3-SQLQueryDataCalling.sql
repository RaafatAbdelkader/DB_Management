
--Ex.1--> Normal Query
USE sales_DB;
SELECT * FROM SALES.staffs
WHERE email LIKE '%@gmail.com' 
Go

--Ex.2-->Join Query
USE sales_DB;
SELECT c.customer_id, first_name+' '+last_name AS customerName,o.order_id, order_date,st.store_id, st.city, oi.list_price,
p.product_name,p.model_year,p.list_price,b.brand_name
FROM sales.customers c join sales.orders o ON c.customer_id=o.customer_id
join sales.stores st ON  o.store_id=st.store_id
join sales.order_items oi ON o.order_id= oi.order_id
join production.products p ON oi.product_id= p.product_id
join production.brands b ON p.brand_id= b.brand_id
WHERE C.customer_id=1
GO


--Ex.3--> nested Query  --> ZB. Der Mitarbieter, der das teuerste Packet verkauft hat.

USE sales_DB;
Select s.staff_id,last_name ,email, oi.list_price
FROM sales.staffs s join sales.orders o on s.staff_id = o.staff_id
join sales.order_items oi on o.order_id =oi.order_id
WHERE list_price >= all (select list_price from sales.order_items)
--where list_price =(select max(list_price)from sales.order_items)
--where list_price in (select list_price from sales.order_items)
--where list_price > any (select list_price from sales.order_items)
Go


--Ex.4--> View
 create view v_customer_orders as
 SELECT customer_id, min(shipped_date) firstOrder, max(shipped_date)as lastOrder, count (*) as 'number of orders'
 FROM sales.orders
 group by customer_id
 Go

 select* from v_customer_orders
 Go