-Assingment: Hw3
-Course: CMSC 246
-Student: Quentin Jefferies
-Professor: Koroosh
-Date: 2/28/21





1.	Write a SELECT statement that joins the Categories table to the Products table and returns these columns: category_name, product_name, list_price.
Sort the result set by category_name and then by product_name in ascending sequence.


SELECT category_name, product_name, list_price
FROM Categories JOIN Products
ON categories.category_id = products.product_id
ORDER BY category_name, product_name


CATEGORY_NAME      PRODUCT_NAME         LIST_PRICE
Basses	           Gibson Les Paul	          1199
Drums	           Gibson SG	              2517
Guitars	           Fender Stratocaster         699
Keyboards Yamaha   FG700S	                489.99






2.	Write a SELECT statement that joins the Customers table to the Addresses table and returns these columns: first_name, last_name, line1, city, state, zip_code.
Return one row for each address for the customer with an email address of allan.sherwood@yahoo.com.


SELECT First_Name, Last_Name,
    Line1, City, State, Zip_Code
FROM Customers JOIN Addresses 
    ON customers.customer_id = addresses.customer_id
WHERE Email_Address = 'allan.sherwood@yahoo.com'

Last_Name       first_name         Line_1                           CITY            State     Zip_Code
Allan	          Sherwood	       100 East Ridgewood Ave.	    Paramus	             NJ	         07652
Allan	          Sherwood	       21 Rosewood Rd.	            Woodcliff Lake	     NJ	         07677


3.	Write a SELECT statement that joins the Customers table to the Addresses table and returns these columns: first_name, last_name, line1, city, state, zip_code.
Return one row for each customer, but only return addresses that are the shipping address for a customer.

SELECT First_Name, Last_Name,
    Line1, City, State, Zip_Code
FROM Customers JOIN Addresses 
    ON customers.customer_id = addresses.customer_id
WHERE shipping_address_id = address_id

First_Name  Last_NAME          ADDRESS                 CITY    STATE     ZIP_CODE
Allan	    Sherwood	100    East Ridgewood Ave.	Paramus	      NJ	    07652
Barry	    Zimmer	    16285  Wendell St.	        Omaha	      NE	    68135
Christine	Brown	    19270  NW Cornell Rd.	    Beaverton	  OR	    97006
David	    Goldstein	186    Vermont St.	    San Francisco	  CA	    94110
Erin	    Valentino	6982   Palm Ave.	        Fresno	      CA	    93711
Frank Lee	Wilson	    23     Mountain View St     Denver	      CO	    80208
Gary	    Hernandez	7361   N. 41st St.	        New York	  NY	    10012
Heather	    Esway	    2381   Buena Vista St.	    Los Angeles	  CA	    90023




4.	Write a SELECT statement that joins the Customers, Orders, Order_Items, and Products tables. This statement should return these columns: last_name, first_name, order_date, product_name, item_price, discount_amount, and quantity.
Use aliases for the tables.
Sort the final result set by last_name, order_date, and product_name.

SELECT last_name, first_name, order_date, product_name, item_price,
    discount_amount, quantity
FROM Customers c 
     JOIN Orders orders ON orders.customer_id = c.customer_id
     JOIN Order_Items items ON c.customer_id = items.item_id
     JOIN Products p ON c.customer_id = p.product_id
ORDER BY last_name, order_date, product_name



Last_Name    First_Name     Order_Date  Product_Name       Item_Price  Discount_Amount      Quantity
Brown	      Christine	     30-MAR-12	Gibson SG	             2517	1308.84	               1
Goldstein	  David	         31-MAR-12	Yamaha FG700S	          415	 161.85	               1
Goldstein	  David	         03-APR-12	Yamaha FG700S	          415	 161.85	               1
Hernandez	  Gary	         02-APR-12	Fender Precision	      299	      0                1
Sherwood	  Allan	         28-MAR-12	Fender Stratocaster	     1199	  359.7	               1
Sherwood	  Allan	         29-MAR-12	Fender Stratocaster	     1199	  359.7	               1
Valentino	  Erin	         31-MAR-12	Washburn D10S	         1199	  359.7       	       2
Wilson	      Frank Lee	     01-APR-12	Rodriguez Caballero 11	  299	      0	               1
Zimmer	      Barry	         28-MAR-12	Gibson Les Paul	        489.99    186.2	               1




5.	Write a SELECT statement that returns the product_name and list_price columns from the Products table.
Return one row for each product that has the same list price as another product. 
Hint: Use a self-join to check that the product_id columns aren’t equal but the list_price columns are equal.
Sort the result set by product_name.


SELECT DISTINCT p1.product_name, p1.list_price
FROM Products p1
	JOIN Products p2 ON p1.product_id <> p2.product_id
	AND p1.list_price = p2.list_price
ORDER BY product_name


Product_Name                                List_Price
Fender Precision	                             799.99
Tama 5-Piece Drum Set with Cymbals	             799.99





6.	Write a SELECT statement that returns these two columns: 
category_name	The category_name column from the Categories table
product_id	The product_id column from the Products table
Return one row for each category that has never been used. Hint: Use an outer join and only return rows where the product_id column contains a null value.
 
CATEGORY_NAME   PRODUCT_ID
NULL            NULL




7.	Use the UNION operator to generate a result set consisting of three columns from the Orders table: 
ship_status	A calculated column that contains a value of SHIPPED or NOT SHIPPED
order_id	The order_id column
order_date	The order_date column
If the order has a value in the ship_date column, the ship_status column should contain a value of SHIPPED. Otherwise, it should contain a value of NOT SHIPPED.
Sort the final result set by order_date.

SELECT 'Shipped' AS Status
		, Order_ID AS OrderID
		, Order_Date AS OrderDate
FROM Orders
	WHERE Ship_Date IS NOT NULL
UNION
	SELECT 'Not Shipped' AS Status
		, Order_ID AS OrderID
		, Order_Date AS OrderDate
FROM Orders
	WHERE Ship_Date IS NULL
ORDER BY OrderDate



STATUS      ORDERID       ORDERDATE
Shipped	        1	      28-MAR-12
Shipped	        2	      28-MAR-12
Shipped	        3	      29-MAR-12
Shipped	        4	      30-MAR-12
Shipped	        5	      31-MAR-12
Not Shipped	    6	      31-MAR-12
Shipped	        7	      01-APR-12
Not Shipped	    8	      02-APR-12
Not Shipped	    9	      03-APR-12

