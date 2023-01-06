create database Ecommerce1;
use Ecommerce1;

create table Supplier(
                Supp_id int primary key,
                Supp_name varchar(50) not null,
                Supp_city varchar(50) not null,
                Supp_phone varchar(50) not null);
                
create table customer(
                 cus_id int primary key,
                 cus_name varchar(50) not null,
                 cus_phone varchar(50) not null,
                 cus_city varchar(50) not null,
                 cus_hender char);
                 
create table catagory(
                  cat_id int primary key,
                  cat_name varchar(50) not null);
                  
drop table if exists product;                 
create table product(
                  pro_id int primary key,
                  pro_name varchar (50) not null,
                  pro_desc varchar(200),
                  cat_id int,
                  foreign key (cat_id) references catagory(cat_id));
                  
create table supplier_pricing(
               pricing_id int primary key,
               pro_id int,
               foreign key(pro_id) references product(pro_id),
               Supp_id int,
               foreign key(Supp_id) references Supplier(Supp_id),
               Supp_price int default 0);
               
create table OrderTable(
           ord_id int primary key,
           ord_amount int not null,
           ord_date date not null,
           cus_id int,
           foreign key(cus_id) references customer(cus_id),
           pricing_id int,
           foreign key(pricing_id) references supplier_pricing(pricing_id));
           
create table rating(
            rat_id int primary key,
            ord_id int,
            foreign key(ord_id) references OrderTable(ord_id),
            rat_ratstars int not null);
            
            
Insert into Supplier values(1,"Rajesh Retails","Delhi", 1234567890);
Insert into Supplier values(2,"Appario Ltd","Mumbai", 2234567890);
Insert into Supplier values(3,"Knome products","Bangalore", 3234567890);
Insert into Supplier values(4,"Bansal Retails","Kochi", 5234567890);
Insert into Supplier values(5,"Mittal Ltd.","Lucknow", 9234567890);

INSERT INTO customer VALUES(1,"AAKASH",'9999999999',"DELHI",'M');
INSERT INTO customer VALUES(2,"AMAN",'9785463215',"NOIDA",'M');
INSERT INTO customer VALUES(3,"NEHA",'9999999999',"MUMBAI",'F');
INSERT INTO customer VALUES(4,"MEGHA",'9994562399',"KOLKATA",'F');
INSERT INTO customer VALUES(5,"PULKIT",'7895999999',"LUCKNOW",'M');

INSERT INTO catagory VALUES( 1,"BOOKS");
INSERT INTO catagory VALUES(2,"GAMES");
INSERT INTO catagory VALUES(3,"GROCERIES");
INSERT INTO catagory VALUES (4,"ELECTRONICS");
INSERT INTO catagory VALUES(5,"CLOTHES");

INSERT INTO product VALUES(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
INSERT INTO product VALUES(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
INSERT INTO product VALUES(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
INSERT INTO product VALUES(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO product VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO product VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO product VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO product VALUES(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO product VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO product VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO product VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO product VALUES(12,"Train Your Brain","By Shireen Stephen",1);


INSERT INTO SUPPLIER_PRICING VALUES(1,1,2,1500);
INSERT INTO SUPPLIER_PRICING VALUES(2,3,5,30000);
INSERT INTO SUPPLIER_PRICING VALUES(3,5,1,3000);
INSERT INTO SUPPLIER_PRICING VALUES(4,2,3,2500);
INSERT INTO SUPPLIER_PRICING VALUES(5,4,1,1000);
INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780);
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789);
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,31000);
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450);
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999);
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549);
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529);
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105);
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99);
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999);
INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999);

INSERT INTO OrderTable VALUES (101,1500,"2021-10-06",2,1);
INSERT INTO OrderTable VALUES(102,1000,"2021-10-12",3,5);
INSERT INTO OrderTable  VALUES(103,30000,"2021-09-16",5,2);
INSERT INTO OrderTable  VALUES(104,1500,"2021-10-05",1,1);
INSERT INTO OrderTable  VALUES(105,3000,"2021-08-16",4,3);
INSERT INTO OrderTable  VALUES(106,1450,"2021-08-18",1,9);
INSERT INTO OrderTable  VALUES(107,789,"2021-09-01",3,7);
INSERT INTO OrderTable  VALUES(108,780,"2021-09-07",5,6);
INSERT INTO OrderTable  VALUES(109,3000,"2021-09-10",5,3);
INSERT INTO OrderTable  VALUES(110,2500,"2021-09-10",2,4);
INSERT INTO OrderTable  VALUES(111,1000,"2021-09-15",4,5);
INSERT INTO OrderTable  VALUES(112,789,"2021-09-16",4,7);
INSERT INTO OrderTable  VALUES(113,31000,"2021-09-16",1,8);
INSERT INTO OrderTable  VALUES(114,1000,"2021-09-16",3,5);
INSERT INTO OrderTable  VALUES(115,3000,"2021-09-16",5,3);
INSERT INTO OrderTable  VALUES(116,99,"2021-09-17",2,14);


INSERT INTO RATING VALUES(1,101,4);
INSERT INTO RATING VALUES(2,102,3);
INSERT INTO RATING VALUES(3,103,1);
INSERT INTO RATING VALUES(4,104,2);
INSERT INTO RATING VALUES(5,105,4);
INSERT INTO RATING VALUES(6,106,3);
INSERT INTO RATING VALUES(7,107,4);
INSERT INTO RATING VALUES(8,108,4);
INSERT INTO RATING VALUES(9,109,3);
INSERT INTO RATING VALUES(10,110,5);
INSERT INTO RATING VALUES(11,111,3);
INSERT INTO RATING VALUES(12,112,4);
INSERT INTO RATING VALUES(13,113,2);
INSERT INTO RATING VALUES(14,114,1);
INSERT INTO RATING VALUES(15,115,1);
INSERT INTO RATING VALUES(16,116,0);

/*8)	Display customer name and gender whose names start or end with character 'A'. */
select cus_name,cus_hender from customer where cus_name like 'a%' or cus_name like '%a';

/*3)	Display the total number of customers based on gender who have placed orders of worth at least Rs.3000. */
select * from ordertable;
select ord_amount from ordertable where ord_amount >= '3000' ;
select * from customer 
inner join ordertable 
on customer.cus_id = ordertable.cus_id having ordertable.ord_amount>= '3000';
/* --------------------------------------------------------------------- */
select t1.cus_id, t1.cus_name, t1.cus_hender, t1.ord_amount from 
( select * from customer 
inner join ordertable 
on customer.cus_id = ordertable.cus_id having ordertable.ord_amount>= '3000')
as t1 group by t1.cus_id;
  
/*4)	Display all the orders along with product name ordered by a customer having Customer_Id=2*/
select * from ordertable;
select * from product;
select * from supplier_pricing;
select * from customer;
select cus_name, pro_name,ord_id, ord_date
from product as p, supplier_pricing as sp, ordertable as ord, customer as cus
where
cus.cus_id = 2 and 
cus.cus_id = ord.cus_id and 
p.pro_id = sp.pro_id and 
ord.pricing_id = sp.pricing_id;

/*5)	Display the Supplier details who can supply more than one product.*/
select * from supplier;
select * from product;
select * from supplier_pricing;
/*----------------------------------*/
select * from supplier_pricing having count(supp_id)>1;
/*----------------------------------*/
select * from supplier_pricing group by supp_id having count(supp_id)>1;
/*----------------------------------*/
select sup.supp_id, supp_name, supp_city, supp_phone from supplier as sup
inner join
(select * from supplier_pricing group by supp_id having count(supp_id)>1) as sp
on
sup.supp_id = sp.supp_id;

/* 6)	Find the least expensive product from each category and print the table with category id, name, product name and price of the product */
select * from product;
select * from catagory;
select * from supplier_pricing;
/*----------------------------------*/
select pro_id, min(supp_price) from supplier_pricing group by pro_id;
/*----------------------------------*/
select * from product 
inner join 
(select pro_id, min(supp_price) from supplier_pricing group by pro_id)
as t2 
where t2.pro_id = product.pro_id;
/*----------------------------------*/
select product.cat_id, product.pro_name, t2.* from product
inner join 
(select pro_id, min(supp_price) from supplier_pricing group by pro_id)
as t2 
where t2.pro_id = product.pro_id;
/*----------------------------------*/
select * from catagory 
inner join 
(select product.cat_id, product.pro_name, t2.* from product
inner join 
(select pro_id, min(supp_price) from supplier_pricing group by pro_id)
as t2 
where t2.pro_id = product.pro_id)
as t3 
where t3.cat_id = catagory.cat_id;
/*----------------------------------*/
select catagory.cat_id, catagory.cat_name, min(t3.min_price) as min_price from catagory 
inner join 
  (select product.cat_id, product.pro_name, t2.* from product
inner join 
(select pro_id, min(supp_price) as MIN_price from supplier_pricing group by pro_id)
as t2 
where t2.pro_id = product.pro_id)
as t3 
where t3.cat_id = catagory.cat_id 
group by t3.cat_id;

/* 7)	Display the Id and Name of the Product ordered after “2021-10-05”. */

select * from ordertable;
/* ----------------------------------------------------------- */
select * from ordertable where ord_date> '2021-10-05';
select * from product;
select * from supplier_pricing;
/* ----------------------------------------------------------- */
select * from ordertable as ord 
inner join supplier_pricing as sp
on sp.pricing_id = ord.pricing_id;
/* ----------------------------------------------------------- */
select * from ordertable as ord 
inner join supplier_pricing as sp
on sp.pricing_id = ord.pricing_id
inner join product as prod 
on  prod.pro_id = sp.pro_id;
/* ----------------------------------------------------------- */
select prod.pro_id, prod.pro_name from ordertable as ord 
inner join supplier_pricing as sp
on sp.pricing_id = ord.pricing_id
inner join product as prod 
on  prod.pro_id = sp.pro_id where ord.ord_date> '2021-10-05';


/*9)Create a stored procedure to display supplier id, name, rating and Type_of_Service. 
For Type_of_Service, If rating =5, print “Excellent Service”,
If rating >4 print “Good Service”, 
If rating >2 print “Average Service” else print “Poor Service”. */
