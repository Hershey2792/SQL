--Assignment: HW1 Chapter 1&2 Exercises
--Course: CMSC246
--Student: Quentin Jefferies 
--Professor Koroosh
--Due 2/14/21:
--Chapter 1-2 Exercises 6, 7, 9, 10, 12, 14, 20, 22, 23, 24, 25, 26, 29, 31





--6. SELECT vendor_name FROM vendors;
ASC Signs
AT&T
Abbey Office Furnishings
American Booksellers Assoc
American Express
Ascom Hasler Mailing Systems
Aztek Label
Baker & Taylor Books
Bertelsmann Industry Svcs. Inc
Bill Jones
Blanchard & Johnson Associates
Blue Cross

12 Rows Selected





7. SELECT vendor_name, vendor_address1, vendor_city, vendor_state,
    vendor_zip_code
FROM vendors
ORDER BY vendor_name

VENDOR_NAME                       VENDOR_ADDRESS          VENDOR_CITY        VENDOR_STATE      VENDOR_ZIP_CODE                       
ASC Signs                         1528 N Sierra Vista     Fresno            CA                 93703
AT&T                              PO Box 78225            Phoenix           AZ                 93722
Abbey Office Furnishings          4150 W Shaw Ave         Fresno            CA                 93722
American Booksellers Assoc        828 S Broadway          Tarrytown         NY                 10591
American Express                  Box 0001                Los Angeles       CA                 90096
Ascom Hasler Mailing Systems      Po Box 895              Shelton           CT                 06484                
Aztek Label                       Accounts Payable        Anaheim           CA                 92807
Baker & Taylor Books     Five Lakepointe Plaza, Ste 500   Charlotte         NC                 28217
Bertelsmann Industry Svcs. Inc    28210 N Avenue Stanford Valencia          CA                 91335           
Bill Jones                        Secretary Of State      Sacramento        CA                 94244

10 rows selected





9. SELECT vendor_name, vendor_address1, vendor_city, vendor_state,
    vendor_zip_cod
FROM vendors
ORDER BY vendor_name


ORA-00904: "VENDOR_ZIP_COD": invalid identifier
00904. 00000 -  "%s: invalid identifier"
*Cause:    
*Action:
Error at Line: 2 Column: 5





10. SELECT COUNT(*) AS number_of_invoices,
    SUM(invoice_total) AS grand_invoice_total
FROM invoices

    NUMBER_OF_INVOICES     GRAND_INVOICE_TOTAL
1   114 	               214290.51





12. 
SELECT vendor_name, vendor_city, vendor_state
FROM vendors
ORDER BY vendor_name

VENDOR_NAME                         VENDOR_CITY             VENDOR_STATE
BFI Industries                      Fresno                  CA
California Chamber Of Commerce      Sacramento              CA
Jobtrak                             Los Angeles             CA
National Information Data Ctr       Washington              DC
Newbrige Book Clubs                 Washington              NJ
Pacific Gas & Electric              San Francisco           CA
Register of Copyrights              Washington              DC
Robbins Mobile Lock And Key         Fresno                  CA
Towne Advertisers Mailing Svcs     Santa Ana               CA              
US Postal Service                   Madison                 WI

10 Rows Selected





14. 
SELECT COUNT(*) AS number_of_invoices,
    SUM(invoice_total - payment_total - credit_total) AS total_due
FROM invoices
WHERE invoice_total - payment_total - credit_total > 0

        NUMBER_OF_INVOICES         TOTAL_DUE
1.                      40          66796.24





20. 
SELECT product_name FROM products

PRODUDCT_NAME 

Fender Stratocaster
Gibson Les Paul
Gibson SG
Yamaha FG700S
Washburn D10S
Rodriguez Caballero 11
Fender Precision
Hofner Icon
Ludwig 5-piece Drum Set with Cymbals
Tama 5-Piece Drum Set with Cymbals



22. 
SELECT COUNT(*) AS number_of_products
FROM products

        NUMBER_OF_PRODUCTS
1                       10






23. 
SELECT product_name, list_price, date_added
FROM products
ORDER BY product_name
    
    PRODUCT_NAME                       LIST_PRICE    DATE_ADDED
1   Fender Precision	               799.99	     01-JUN-12
2   Fender Stratocaster	               699	         30-OCT-11
3   Gibson Les Paul	                   1199	         05-DEC-11
4   Gibson SG	                       2517	         04-FEB-12
5   Hofner Icon	                       499.99	     30-JUL-12
6   Ludwig 5-piece Drum Set with Cymbals	699.99	 30-JUL-12
7   Rodriguez Caballero 11             415	         30-JUL-12
8   Tama 5-Piece Drum Set with Cymbals 799.99	     30-JUL-12
9   Washburn D10S	                   299	         30-JUL-12
10  Yamaha FG700S	                   489.99	     01-JUN-12





24.	Open the script named product_summary.sql that’s in the mgs_ex_starts directory (see attachments). Note that this opens another SQL Worksheet.

25.	Open the script named product_statements.sql that’s in the mgs_ex_starts directory (see attachments). Notice that this script contains two SQL statements that end with semicolons.



26. 
SELECT product_name, list_price, date_added
FROM products
ORDER BY product_name;

SELECT COUNT(*) AS number_of_products,
       MAX(list_price) AS most_expensive_product,
       MIN(date_added) AS oldest_product
FROM products;                                                                                                                                                                                                PRODUCT_NAME                                                  LIST_PRICE    DATE_ADDED
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------- ---------
Fender Precision                                                                                                                                                                                                                                                    799.99       01-JUN-12
Fender Stratocaster                                                                                                                                                                                                                                                   699       30-OCT-11
Gibson Les Paul                                                                                                                                                                                                                                                       1199      05-DEC-11
Gibson SG                                                                                                                                                                                                                                                             2517      04-FEB-12
Hofner Icon                                                                                                                                                                                                                                                         499.99      30-JUL-12
Ludwig 5-piece Drum Set with Cymbals                                                                                                                                                                                                                                699.99       30-JUL-12
Rodriguez Caballero 11                                                                                                                                                                                                                                                 415       30-JUL-12
Tama 5-Piece Drum Set with Cymbals                                                                                                                                                                                                                                  799.99       30-JUL-12
Washburn D10S                                                                                                                                                                                                                                                          299      30-JUL-12
Yamaha FG700S                                                                                                                                                                                                                                                       489.99      01-JUN-12

10 rows selected. 


NUMBER_OF_PRODUCTS MOST_EXPENSIVE_PRODUCT OLDEST_PR
------------------ ---------------------- ---------
                10                   2517 30-OCT-11




29. CLOSE DOWN SQL DEVELOPER




31. REOPEN AND RUN 
SELECT COUNT(*) AS number_of_invoices,
    SUM(invoice_total) AS grand_invoice_total
FROM invoices

        NUMBER_OF_INVOICES          GRAND_INVOICE_TOTAL
1       114	                        214290.51