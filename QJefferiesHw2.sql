-Assingment: Hw2
-Course: CMSC 246
-Student: Quentin Jefferies
-Professor: Koroosh
-Date: 2/21/21



1.	
Write a SELECT statement that returns four columns from the Products table: product_code, product_name, list_price, and discount_percent. Then, run this statement to make sure it works correctly.


SELECT product_code, product_name, list_price, discount_percent
FROM Products


Product_Code      Product_Name                          List_Price         Discount_Percent
strat	          Fender Stratocaster	                699	               30
les_paul	      Gibson Les Paul	                    1199               30
sg	              Gibson SG	                            2517               52  
fg700s	          Yamaha FG700S	                        489.99             38
washburn	      Washburn D10S	                        299	               0
rodriguez	      Rodriguez Caballero  11               415	               39
precision	      Fender Precision	                    799.99	           30
hofner	          Hofner Icon	                        499.99	           25
ludwig	          Ludwig 5-piece Drum Set with Cymbals	699.99	           30
tama	          Tama 5-Piece Drum Set with Cymbals	799.99	           15




Add an ORDER BY clause to this statement that sorts the result set by list price in descending sequence. Then, run this statement again to make sure it works correctly.


SELECT product_code, product_name, list_price, discount_percent
FROM Products
ORDER BY list_price DESC


PRODUCT_CO PRODUCT_NAME                                                                                                                                                                                                                                                    LIST_PRICE DISCOUNT_PERCENT
---------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------- ----------------
sg         Gibson SG                                                                                                                                                                                                                                                             2517               52
les_paul   Gibson Les Paul                                                                                                                                                                                                                                                       1199               30
tama       Tama 5-Piece Drum Set with Cymbals                                                                                                                                                                                                                                  799.99               15
precision  Fender Precision                                                                                                                                                                                                                                                    799.99               30
ludwig     Ludwig 5-piece Drum Set with Cymbals                                                                                                                                                                                                                                699.99               30
strat      Fender Stratocaster                                                                                                                                                                                                                                                    699               30
hofner     Hofner Icon                                                                                                                                                                                                                                                         499.99               25
fg700s     Yamaha FG700S                                                                                                                                                                                                                                                       489.99               38
rodriguez  Rodriguez Caballero 11                                                                                                                                                                                                                                                 415               39
washburn   Washburn D10S                                                                                                                                                                                                                                                          299                0

10 rows selected. 








2.
Write a SELECT statement that returns one column from the Customers table named full_name that joins the last_name and first_name columns.
Format this column with the last name, a comma, a space, and the first name like this:
Doe, John
Sort the result set by last name in ascending sequence.
Return only the customers whose last name begins with letters from M to Z.


SELECT last_name || ', ' || first_name || ',' AS full_name
FROM Customers
WHERE last_name >= 'M' 
ORDER BY last_name 

FULL_NAME
1   Sherwood, Allan,
2   Valentino, Erin,
3   Wilson, Frank Lee,
4   Zimmer, Barry,







3.
Write a SELECT statement that returns these columns from the Products table:
product_name	The product_name column
list_price	    The list_price column
date_added	    The date_added column


SELECT product_name, list_price, date_added
FROM Products
WHERE list_price > 500 AND list_price < 2000
ORDER BY date_added DESC


Return only the rows with a list price that’s greater than 500 and less than 2000.
Sort the result set in descending sequence by the date_added column.


PRODUCT_NAME                         LIST_PRICE         DATE_ADDED
Tama 5-Piece Drum Set with Cymbals	     799.99	         30-JUL-12
Ludwig 5-piece Drum Set with Cymbals	 699.99	         30-JUL-12
Fender Precision	                     799.99	         01-JUN-12
Gibson Les Paul	                           1199	         05-DEC-11
Fender Stratocaster	                        699	         30-OCT-11








4.
Write a SELECT statement that returns these column names and data from the Products table:

product_name	    The product_name column
list_price	        The list_price column
discount_percent	The discount_percent column
discount_amount	    A column that’s calculated from the previous two columns
discount_price	    A column that’s calculated from the previous three columns
Use the ROWNUM pseudo column so the result set contains only the first 5 rows.
Sort the result set by discount price in descending sequence.

SELECT product_name, list_price, discount_percent, (list_price * 
    discount_percent/100) AS discount_amount, 
    list_price - (list_price * discount_percent / 100) AS discount_price
FROM Products
WHERE ROWNUM <= 5

PRODUCT_NAME              LIST_PRICE      DISCOUNT_PERCENT        DISCOUNT_AMOUNT       DISCOUNT_PRICE
Fender Stratocaster	             699	                30	                209.7	             489.3
Gibson Les Paul	                1199	                30	                359.7	             839.3
Gibson SG	                    2517	                52	              1308.84	           1208.16
Yamaha FG700S	              489.99	                38	             186.1962	          303.7938
Washburn D10S	                 299	                 0	                    0	               299







5.
Write a SELECT statement that returns these column names and data from the Order_Items table:
item_id	           The item_id column
item_price	       The item_price column
discount_amount	   The discount_amount column
quantity	       The quantity column
price_total	       A column that’s calculated by multiplying the item price by the quantity
discount_total	   A column that’s calculated by multiplying the discount amount by the quantity
item_total	       A column that’s calculated by subtracting the discount amount from the item price and then multiplying by the quantity
Only return rows where the item_total is greater than 500.
Sort the result set by item total in descending sequence.


SELECT item_id, item_price, discount_amount, quantity, (item_price * quantity) 
    AS price_total, (discount_amount * quantity) AS discount_total, (item_price -
    discount_amount) * quantity AS item_total
FROM Order_Items
WHERE (item_price - discount_amount) * quantity > 500
ORDER BY item_total DESC

ITEM_ID         ITEM_PRICE       DISCOUNT_AMOUNT        QUANTITY     PRICE_TOTAL     DISCOUNT_TOTAL      ITEM_TOTAL
      5	              1199	               359.7	           2	        2398	          719.4	         1678.6
      3	              2517	             1308.84	           1   	        2517	        1308.84	        1208.16
      1	              1199	               359.7	           1	        1199	          359.7	          839.3
     11	            799.99	                 120	           1	      799.99	            120	         679.99
      9	            799.99	                 240	           1	      799.99	            240	         559.99
      
      
      
      
      
      
      
6.	
Write a SELECT statement that returns these columns from the Orders table:
order_id	The order_id column
order_date	The order_date column
ship_date	The ship_date column
Return only the rows where the ship_date column contains a null value.


SELECT order_id, order_date, ship_date
FROM Orders
WHERE ship_date is NULL

6	31-MAR-12	(null)
8	02-APR-12	(null)
9	03-APR-12	(null)







7.	
Write a SELECT statement that uses the SYSDATE function to create a row with these columns:
today_unformatted	The SYSDATE function unformatted
today_formatted	    The SYSDATE function in this format: MM-DD-YYYY
This displays a number for the month, a number for the day, and a four-digit year.
Use a FROM clause that specifies the Dual table.

SELECT SYSDATE AS today_unformatted, to_char(SYSDATE, 'MM-DD-YYYY') AS 
    today_formatted
FROM DUAL

TODAYS_UNFORMATTED          TODAY_FORMATTED
21-FEB-21	                     02-21-2021







8.	
Write a SELECT statement that creates a row with these columns:
price	     100 (dollars)
tax_rate	 .07 (7 percent)
tax_amount	 The price multiplied by the tax
total	     The price plus the tax
To calculate the fourth column, add the expressions you used for the first and third columns.
Use a FROM clause that specifies the Dual table.


I created my own table to extract the proper query for this question


CREATE TABLE prices 
    (price INT NOT NULL , 
        tax_rate INT NOT NULL 
    )
    
INSERT INTO prices
(price, tax_rate)
    
 VALUES   
 (100, 7)



SELECT price, tax_rate/100 AS tax_rate, price * (tax_rate/100) AS tax_amount, price 
    + (price * tax_rate/100) AS total
FROM prices

Price       TAX_RATE    TAX_AMOUNT      TOTAL
  100	        0.07	         7	      107
     
