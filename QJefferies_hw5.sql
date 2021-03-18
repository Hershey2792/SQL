-Assingment: Hw5
-Course: CMSC 246
-Student: Quentin Jefferies
-Professor: Koroosh
-Date: 3/6/21



1.	Write a SELECT statement that returns these columns:
The count of the number of orders in the Orders table
The sum of the tax_amount columns in the Orders table


SELECT 
    COUNT(order_id) AS Order_Count, SUM(tax_amount) AS Tax_Amount_Sum
FROM Orders 

Order_Count           Tax_Amount_Sum
          9	                  122.24
          
          


2.	Write a SELECT statement that returns one row for each category that has products with these columns:
The category_name column from the Categories table
The count of the products in the Products table
The list price of the most expensive product in the Products table
Sort the result set so the category with the most products appears first.


SELECT 
    category_name, count(*) AS Product_Count, Max(list_price) As 
        Most_Expensive_Product
FROM Categories c JOIN Products p
ON c.category_id = p.category_id
GROUP BY c.category_name
Order BY Product_Count DESC

Category_Name       Product_Count           List_Price
Guitars	                        6	              2517
Drums	                        2	            799.99
Basses	                        2	            799.99





3.	Write a SELECT statement that returns one row for each customer that has orders with these columns:
The email_address column from the Customers table
The sum of the item price in the Order_Items table multiplied by the quantity in the Order_Items table
The sum of the discount amount column in the Order_Items table multiplied by the quantity in the Order_Items table
Sort the result set in descending sequence by the item price total for each customer.



SELECT 
    email_address, SUM(item_price * quantity) AS Total_Item_Price, 
        SUM(discount_amount * quantity) AS Total_Discount_Amount
FROM Customers c 
    JOIN Orders o ON c.customer_id = o.customer_id
    JOIN Order_items oi ON o.order_id = oi.order_id
GROUP BY email_address
ORDER BY Total_Item_Price DESC


Email_Address                Total_Item_Price        Total_Discount_Amount
allan.sherwood@yahoo.com	             4131	                   1830.39
christineb@solarone.com	                 2398	                     719.4
frankwilson@sbcglobal.net	          2198.98	                     659.7
david.goldstein@hotmail.com	              998	                     209.7
gary_hernandez@yahoo.com	           799.99	                       120
barryz@gmail.com	                   489.99	                     186.2
erinv@gmail.com	                          299	                         0






4.	Write a SELECT statement that returns one row for each customer that has orders with these columns:
The email_address from the Customers table
A count of the number of orders
The total amount for each order (Hint: First, subtract the discount amount from the price. Then, multiply by the quantity.)
Return only those rows where the customer has more than 1 order.
Sort the result set in descending sequence by the sum of the line item amounts.


SELECT 
    email_address, count(quantity) AS Number_Of_Orders,
        SUM((item_price - discount_amount) * quantity) 
        AS Total_Amount
FROM Customers c
    JOIN Orders o ON c.customer_id = o.customer_id
    JOIN Order_Items oi ON oi.order_id = o.order_id
GROUP BY email_address
HAVING COUNT(o.order_id) > 1
ORDER BY TOTAL_Amount DESC

            
Email_Address                  Number_Of_Orders         TOTAL_AMOUNT
allan.sherwood@yahoo.com	         3	                2300.61
frankwilson@sbcglobal.net	         3	                1539.28
david.goldstein@hotmail.com	         2	                  788.3




5.	Modify the solution to exercise 4 so it only counts and totals line items that have an item_price value that’s greater than 400.


SELECT 
    email_address, count(quantity) AS Number_Of_Orders,
        SUM((item_price - discount_amount) * quantity) 
        AS Total_Amount
FROM Customers c
    JOIN Orders o ON c.customer_id = o.customer_id
    JOIN Order_Items oi ON oi.order_id = o.order_id
WHERE item_price > 400
GROUP BY email_address
HAVING COUNT(o.order_id) > 1
ORDER BY TOTAL_Amount DESC
    
Email_Address              Number_Of_Orders    Total_Amount
allan.sherwood@yahoo.com	   3	              2300.61
frankwilson@sbcglobal.net	   3	              1539.28




6.	Write a SELECT statement that answers this question: What is the total amount ordered for each product? Return these columns:
The product name from the Products table
The total amount for each product in the Order_Items (Hint: You can calculate the total amount by subtracting the discount amount from the item price and then multiplying it by the quantity)
Use the ROLLUP operator to include a row that gives the grand total.



SELECT 
   product_name, SUM((item_price - discount_amount) * quantity) AS 
    Grand_Total
FROM Products p JOIN Order_Items oi
    ON p.product_id = oi.product_id
GROUP BY ROLLUP (product_name)

Product_name                                Grand_Total
Fender Precision	                           559.99
Fender Stratocaster	                            978.6
Gibson Les Paul	                               2517.9
Gibson SG	                                  1208.16
Ludwig 5-piece Drum Set with Cymbals	       489.99
Rodriguez Caballero 11	                       253.15
Tama 5-Piece Drum Set with Cymbals	           679.99
Washburn D10S	                                  598
Yamaha FG700S	                               303.79
(null)	                                      7589.57
    
    
    
    
7.	Write a SELECT statement that answers this question: Which customers have ordered more than one product? Return these columns:
The email address from the Customers table
The count of distinct products from the customer’s order


SELECT 
   email_address, COUNT(DISTINCT product_id) AS Products_Ordered
FROM Customers c 
    JOIN Orders o ON c.customer_id = o.customer_id
    JOIN Order_Items oi ON oi.order_id = o.order_id
GROUP BY email_address
HAVING COUNT(DISTINCT product_id) > 1
ORDER BY email_address

Email_Address                               Products_Ordered
allan.sherwood@yahoo.com	                               3
david.goldstein@hotmail.com	                               2
frankwilson@sbcglobal.net	                               3
    