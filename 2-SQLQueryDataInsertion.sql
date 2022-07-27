/**** Data_Erstellung***thats normal*/
USE sales_DB;
GO

INSERT INTO sales.customers(first_name,last_name,email,phone,street,city,state,zip_code)
VALUES 
('Tomas','Schmidt','schmidt@gmail.com','0162552635','Nanostr.','Heidelberg','MG','12536'),
('Max','Müller','Max@outlook.com','017255444','Albertstr.','Frankfurt','GJ','18265'),
('Jak','Friedrich','Jak@gmail.com','016255299','Maxstr.','Freiburg','MG','12245'),
('Anton','Schneider','Anton@gmail.com','0162552656','Müllerstr.','Berlin','MG','12245'),
('Karl','Adam','Karl@gmail.com','0172598657','Manostr.','Heidelberg','MG','12245'),
('Martin','Jak','Martin@yahoo.com','01624815152','karlstr.','Freiburg','BWB','12245'),
('Mano','schneider','Mano@gmail.com','01645152657','Müllerstr.','Frankfurt','BWB','12245')

GO

INSERT INTO sales.stores(store_id,store_name,email,phone,street,city,state,zip_code)
VALUES
('store_1','store 1','store_1@gmail.com','016*******','street_1','Heidelberg','MG','12536'),
('store_2','store 2','store_2@gmail.com','017*******','street_1','Freiburg','MG','18536'),
('store_3','store 3','store_3@gmail.com','016*******','street_1','Berlin','MG','12739'),
('store_4','store 4','store_4@gmail.com','011*******','street_1','Freiburg','MG','12536'),
('store_5','store 5','store_5@gmail.com','016*******','street_1','Berlin','MG','12536'),
('store_6','store 6','store_6@gmail.com','015*******','street_1','Heidelberg','MG','12536'),
('store_7','store 7','store_7@gmail.com','014*******','street_1','Berlin','MG','12536')
GO

INSERT INTO sales.staffs (staff_id,first_name,last_name,phone, email,store_id,manager_id)
VALUES 
('105095','Ahmed','Abdo','010259588','Abdo@gmail.com','store_1','105095'),
('105091','Megm','Nagi','010259588','Megm@gmail.com','store_1','105095'),
('105092','Abdo','samir','010259588','samir@gmail.com','store_1','105095'),
('105093','Ali','sheref','010259588','Ali@gmail.com','store_1','105095'),
('105094','Mans','Ahmed','010259588','Mans@gmail.com','store_1','105095')
GO


INSERT INTO sales.orders (customer_id,order_status,order_date,required_date, shipped_date,store_id,staff_id)
VALUES 
(1,2,'2021-10-15','2021-10-25','2021-10-25','store_1','105091'),
(1,2,'2021-11-15','2021-11-25','2021-11-25','store_1','105091'),
(1,2,'2021-12-15','2021-12-25','2021-12-25','store_1','105091')
GO

INSERT INTO production.categories(category_id,category_name)
VALUES 
('E1','Electronics')
GO

INSERT INTO production.brands(brand_id,brand_name)
VALUES 
('apple','apple')
GO

INSERT INTO production.products(product_id,product_name,brand_id,category_id,model_year,list_price)
VALUES 
('i11','iphone11','apple','E1',2019,700),
('i12','iphone12','apple','E1',2020,800),
('i13','iphone13','apple','E1',2021,900)
GO

INSERT INTO production.stocks(store_id,product_id,quantity)
VALUES 
('store_1','i11',14),
('store_2','i12',85),
('store_1','i13',145)
GO

INSERT INTO sales.order_items(item_id,order_id,product_id,quantity,list_price,discount)
VALUES 
('i1',1,'i11',1,700,0),
('i2',2,'i12',1,800,10),
('i3',3,'i13',1,900,0)
GO
