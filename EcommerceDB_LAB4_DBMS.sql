create database Ecommercedb;
use Ecommercedb;

CREATE TABLE category (
    CAT_ID INT PRIMARY KEY,
    CAT_NAME VARCHAR(20) NOT NULL
);

INSERT INTO category (CAT_ID, CAT_NAME) VALUES
(1, 'BOOKS'),
(2, 'GAMES'),
(3, 'GROCERIES'),
(4, 'ELECTRONICS'),
(5, 'CLOTHES');

CREATE TABLE product (
    PRO_ID INT PRIMARY KEY,
    PRO_NAME VARCHAR(20) NOT NULL DEFAULT 'Dummy',
    PRO_DESC VARCHAR(60),
    CAT_ID INT,
    FOREIGN KEY (CAT_ID) REFERENCES category(CAT_ID)
);

INSERT INTO product (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) VALUES
(1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2),
(2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5),
(3, 'ROG LAPTOP', 'Windows 10 with 15-inch screen, i7 processor, 1TB SSD', 4),
(4, 'OATS', 'Highly Nutritious from Nestle', 3),
(5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1),
(6, 'MILK', '1L Toned Milk', 3),
(7, 'Boat Earphones', '1.5 Meter long Dolby Atmos', 4),
(8, 'Jeans', 'Stretchable Denim Jeans with various sizes and color', 5),
(9, 'Project IGI', 'compatible with Windows 7 and above', 2),
(10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5),
(11, 'Rich Dad Poor Dad', 'Written by Robert Kiyosaki', 1),
(12, 'Train Your Brain', 'By Shireen Stephen', 1);

CREATE TABLE supplier (
    SUPP_ID INT PRIMARY KEY,
    SUPP_NAME VARCHAR(50) NOT NULL,
    SUPP_CITY VARCHAR(50) NOT NULL,
    SUPP_PHONE VARCHAR(50) NOT NULL
);

INSERT INTO supplier (SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE) VALUES
(1, 'Rajesh Retails', 'Delhi', '1234567890'),
(2, 'Appario Ltd.', 'Mumbai', '2589631470'),
(3, 'Knome products', 'Bangalore', '9785462315'),
(4, 'Bansal Retails', 'Kochi', '8975463285'),
(5, 'Mittal Ltd.', 'Lucknow', '7898456532');

CREATE TABLE supplier_pricing (
    PRICING_ID INT PRIMARY KEY,
    PRO_ID INT,
    SUPP_ID INT,
    SUPP_PRICE INT DEFAULT 0,
    FOREIGN KEY (PRO_ID) REFERENCES product(PRO_ID),
    FOREIGN KEY (SUPP_ID) REFERENCES supplier(SUPP_ID)
);

INSERT INTO supplier_pricing (PRICING_ID, PRO_ID, SUPP_ID, SUPP_PRICE) VALUES
(1, 1, 2, 1500),
(2, 3, 5, 30000),
(3, 5, 1, 3000),
(4, 2, 3, 2500),
(5, 4, 1, 1000),
(6, 12, 2, 780),
(7, 12, 4, 789),
(8, 3, 1, 31000),
(9, 1, 5, 1450),
(10, 4, 2, 999),
(11, 7, 3, 549),
(12, 7, 4, 529),
(13, 6, 2, 105),
(14, 6, 1, 99),
(15, 2, 5, 2999),
(16, 5, 2, 2999);

CREATE TABLE customer (
    CUS_ID INT PRIMARY KEY,
    CUS_NAME VARCHAR(20) NOT NULL,
    CUS_PHONE VARCHAR(10) NOT NULL,
    CUS_CITY VARCHAR(30) NOT NULL,
    CUS_GENDER CHAR
);

INSERT INTO customer (CUS_ID, CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER) VALUES
(1, 'AAKASH', '9999999999', 'DELHI', 'M'),
(2, 'AMAN', '9785463215', 'NOIDA', 'M'),
(3, 'NEHA', '9999999999', 'MUMBAI', 'F'),
(4, 'MEGHA', '9994562399', 'KOLKATA', 'F'),
(5, 'PULKIT', '7895999999', 'LUCKNOW', 'M');

CREATE TABLE orders (
    ORD_ID INT PRIMARY KEY,
    ORD_AMOUNT INT NOT NULL,
    ORD_DATE DATE NOT NULL,
    CUS_ID INT,
    PRICING_ID INT,
    FOREIGN KEY (CUS_ID) REFERENCES customer(CUS_ID),
    FOREIGN KEY (PRICING_ID) REFERENCES supplier_pricing(PRICING_ID)
);

INSERT INTO orders (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID) VALUES
(101, 1500, '2021-10-06', 2, 1),
(102, 1000, '2021-10-12', 3, 5),
(103, 30000, '2021-09-16', 5, 2),
(104, 1500, '2021-10-05', 1, 1),
(105, 3000, '2021-08-16', 4, 3),
(106, 1450, '2021-08-18', 1, 9),
(107, 789, '2021-09-01', 3, 7),
(108, 780, '2021-09-07', 5, 6),
(109, 3000, '2021-10-10', 5, 3),
(110, 2500, '2021-09-10', 2, 4),
(111, 1000, '2021-09-15', 4, 5),
(112, 789, '2021-09-16', 4, 7),
(113, 31000, '2021-09-16', 1, 8),
(114, 1000, '2021-09-16', 3, 5),
(115, 3000, '2021-09-16', 5, 3),
(116, 99, '2021-09-17', 2, 14);

CREATE TABLE rating (
    RAT_ID INT PRIMARY KEY,
    ORD_ID INT,
    RAT_RATSTARS INT NOT NULL,
    FOREIGN KEY (ORD_ID) REFERENCES orders(ORD_ID)
);

INSERT INTO rating (RAT_ID, ORD_ID, RAT_RATSTARS) VALUES
(1, 101, 4),
(2, 102, 3),
(3, 103, 1),
(4, 104, 2),
(5, 105, 4),
(6, 106, 3),
(7, 107, 4),
(8, 108, 4),
(9, 109, 3),
(10, 110, 5),
(11, 111, 3),
(12, 112, 4),
(13, 113, 2),
(14, 114, 1),
(15, 115, 1),
(16, 116, 0);

SELECT CUS_GENDER, COUNT(*) AS TotalCustomers
FROM orders O
JOIN customer C 
USING (CUS_ID)
WHERE
O.ORD_AMOUNT >= 3000
GROUP BY
CUS_GENDER;

SELECT ord_id,pro_name,pro_desc
FROM customer
JOIN orders
USING ( cus_id )
JOIN supplier_pricing
USING ( pricing_id )
JOIN product
USING ( pro_id )
WHERE CUS_ID=2;

SELECT supp_name, COUNT( * ) as 'Products Supplied'
FROM supplier
JOIN supplier_pricing
USING ( supp_id )
JOIN product
USING ( pro_id )
GROUP BY supp_name
having COUNT( * ) > 1;

SELECT cat_id, cat_name, pro_name, MIN( supp_price ) as min_price
FROM category
JOIN product
USING ( cat_id )
JOIN supplier_pricing
USING ( pro_id )
GROUP BY  cat_id, cat_name, pro_name;

SELECT pro_name
FROM product
JOIN supplier_pricing
USING ( pro_id )
JOIN orders
USING ( pricing_id )
WHERE ord_date > "2021-10-05"; 

select cus_name, cus_gender
from customer
where cus_name like 'A%' or cus_name like '%A';

DELIMITER &&  
CREATE PROCEDURE supplierCategory()
BEGIN
SELECT supp_name, AVG(RAT_RATSTARS),
Case
when AVG( RAT_RATSTARS )=5 then 'Excellent Service'
when AVG( RAT_RATSTARS )>4 then 'Good Service'
when AVG( RAT_RATSTARS )>2 then 'Average Service'
else 'Poor Service'
end as 'Supplier Category'
FROM supplier
JOIN supplier_pricing
USING ( supp_id )
JOIN orders
USING ( pricing_id )
JOIN rating
USING ( ord_id )
GROUP BY supp_name;
END &&  
DELIMITER ;

call supplierCategory();




















