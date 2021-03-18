1.	Write a SELECT statement that returns the same result set as this SELECT statement, but don’t use a join. Instead, use a subquery in a WHERE clause that uses the IN keyword.
SELECT DISTINCT category_name
FROM categories c JOIN products p
  ON c.category_id = p.category_id
ORDER BY category_name


SELECT DISTINCT category_name
FROM categories
WHERE category_id IN 
(
    SELECT category_id
    FROM products
)
ORDER BY category_name


Category_Name
Basses
Drums
Guitars





2.	Write a SELECT statement that answers this question: Which products have a list price that’s greater than the average list price for all products?
Return the product_name and list_price columns for each product.
Sort the results by the list_price column in descending sequence.

SELECT product_name, list_price
FROM Products
WHERE list_price >  
(
    SELECT AVG(list_price) AS avg
    FROM Products
    WHERE list_price > 0
)
ORDER BY list_price DESC



PRODUCT_NAME            LIST_PRICE
Gibson SG	              2517
Gibson Les Paul	          1199







3.	Write a SELECT statement that returns the category_name column from the Categories table.
Return one row for each category that has never been assigned to any product in the Products table. To do that, use a subquery introduced with the NOT EXISTS operator.


SELECT category_name
FROM categories c
WHERE NOT EXISTS
(
    SELECT product_name
    FROM products 
    WHERE c.category_id = p.category_id
)

    CATEGORY_NAME
1   Keyboards



4.	Write a SELECT statement that returns three columns: email_address, order_id, and the order total for each customer. To do this, you can group the result set by the email_address and order_id columns. In addition, you must calculate the order total from the columns in the Order_Items table.
Write a second SELECT statement that uses the first SELECT statement in its FROM clause. The main query should return two columns: the customer’s email address and the largest order for that customer. To do this, you can group the result set by the email_address.



SELECT c.email_address, oi.order_id, sum((item_price - discount_amount)
    * quantity) AS Order_Total
FROM Order_Items oi JOIN Orders o
    ON oi.order_id =  o.order_id JOIN
    Customers c 
    ON o.customer_id = c.customer_id 
GROUP BY email_address, oi.order_id
    
EMAIL_ADDRESS           Order_ID        Order_Total
erinv@gmail.com	            6	            299
allan.sherwood@yahoo.com	3	        1461.31
gary_hernandez@yahoo.com	8	         679.99
allan.sherwood@yahoo.com	1	          839.3
frankwilson@sbcglobal.net	7      	    1539.28
david.goldstein@hotmail.com	9   	      489.3
barryz@gmail.com	        2            303.79
christineb@solarone.com	    4	          839.3
david.goldstein@hotmail.com	5	            299


SELECT email_address, MAX(Order_Total)
FROM
(
    SELECT c.email_address, oi.order_id, sum((item_price - discount_amount) * quantity) AS Largest_Order
        AS Order_Total
    FROM Order_Items oi JOIN Orders o
        ON oi.order_id =  o.order_id JOIN Customers c 
        ON o.customer_id = c.customer_id 
        GROUP BY c.email_address, oi.order_id) 
GROUP BY email_address

    
EMAIL_ADDRESS                   Largest_Order
david.goldstein@hotmail.com	        489.3
gary_hernandez@yahoo.com	        679.99
erinv@gmail.com	                    299
barryz@gmail.com	                303.79
allan.sherwood@yahoo.com	        1461.31
christineb@solarone.com	            1678.6
frankwilson@sbcglobal.net	        1539.28





5.	Write a SELECT statement that returns the name and discount percent of each product that has a unique discount percent. In other words, don’t include products that have the same discount percent as another product.
Sort the results by the product_name column.


SELECT product_name, discount_percent
FROM Products p
WHERE NOT EXISTS 
(
    SELECT *
    FROM Products p1
    WHERE p.product_name = p1.product_name
        AND p.discount_percent != p.discount_percent
)
ORDER BY product_name


Product_Name                    Discount_Percent
Fender Precision	                  30
Fender Stratocaster	                  30
Gibson Les Paul	                      30
Gibson SG	                          52
Hofner Icon	                          25
Ludwig 5-piece Drum Set with Cymbals  30
Rodriguez Caballero 11	              39
Tama 5-Piece Drum Set with Cymbals	  15
Washburn D10S	                       0
Yamaha FG700S	                      38






6.	Use a correlated subquery to return one row per customer, representing the customer’s oldest order (the one with the earliest date). Each row should include these three columns: email_address, order_id, and order_date.


SELECT email_address, order_id, order_date 
FROM customers c JOIN Orders o
    ON c.customer_id = o.customer_id
WHERE o.order_date = 
(
    SELECT MIN(order_date)
    FROM Orders o1
    WHERE c.customer_id = o1.customer_id
)
    
EMAIL_ADDRESS               ORDER_ID       ORDER_DATE
allan.sherwood@yahoo.com	   1	        28-MAR-12
barryz@gmail.com	           2	        28-MAR-12
christineb@solarone.com	       4	        30-MAR-12
david.goldstein@hotmail.com	   5	        31-MAR-12
erinv@gmail.com	               6	        31-MAR-12
frankwilson@sbcglobal.net	   7	        01-APR-12
gary_hernandez@yahoo.com	   8	        02-APR-12


