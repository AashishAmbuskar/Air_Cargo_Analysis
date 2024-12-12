#  Creating Database aircargo and querying to start using it

create database aircargo;
use aircargo;
show tables;

# 1.Create an ER diagram for the given airlines database.

# 2.Creating Table route

CREATE TABLE route_details (
    route_id INT,
    flight_num INT,
    origin_airport CHAR(3),
    destination_airport CHAR(3),
    aircraft_id VARCHAR(20),
    distance_miles VARCHAR(10)
);
ALTER TABLE route_details ADD UNIQUE (route_id);ALTER TABLE route_details ADD CHECK (flight_num > 0);ALTER TABLE route_details ADD CHECK (distance_miles >0);
  
# 3. Write a query to display all the passengers (customers) who have travelled in routes 01 to 25.Take data  from the passengers_on_flights table.
  
  SELECT * FROM passengers_on_flights WHERE route_id <= 25;
  
# 4. Write a query to identify the number of passengers and total revenue in business class from the ticket_details table.

SELECT * FROM ticket_details WHERE class_id = 'Bussiness';

SELECT SUM(price_per_ticket) FROM ticket_details WHERE class_id = 'Bussiness';

# 5. Write a query to display the full name of the customer by extracting the first name and last name from the customer table.

SELECT first_name, last_name FROM customer;
 
# 6. Write a query to extract the customers who have registered and booked a ticket. Use data from the customer and ticket_details tables.

SELECT * FROM ticket_details;

# 7. Write a query to identify the customer’s first name and last name based on their customer ID andbrand (Emirates) from the ticket_details table.

SELECT * FROM customer INNER JOIN ticket_details ON customer.customer_id = ticket_details.customer_id AND brand = 'emirates';

# 8. Write a query to identify the customers who have travelled by Economy Plus class using Group By and Having clause on the passengers_on_flights table.

SELECT customer_id, class_id FROM passengers_on_flights WHERE class_id = 'economy plus' GROUP BY customer_id HAVING class_id = 'economy plus';

# 9. Write a query to identify whether the revenue has crossed 10000 using the IF clause on the ticket_details table.

SELECT IF(SUM(price_per_ticket) > 10000, 'yes', 'no') FROM ticket_details;

# 10. Write a query to create and grant access to a new user to perform operations on a database.

CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'password';

# 11. Write a query to find the maximum ticket price for each class using window functions on the ticket_details table.

SELECT DISTINCT class_id, MAX(price_per_ticket) OVER (partition by class_id) FROM ticket_details;

# 12. Write a query to extract the passengers whose route ID is 4 by improving the speed and performance of the passengers_on_flights table.

SELECT Customer_id, route_id FROM passengers_on_flights WHERE route_id = 4;

-- For the route ID 4, write a query to view the execution plan of the passengers_on_flights table.

EXPLAIN SELECT route_id FROM passengers_on_flights WHERE route_id = 4;

# 13. Write a query to calculate the total price of all tickets booked by a customer across different aircraft IDs using rollup function.

SELECT customer_id, SUM(price_per_ticket) FROM ticket_details WHERE customer_id = 2 GROUP BY customer_id, price_per_ticket WITH ROLLUP;

# 14. Write a query to create a view with only business class customers along with the brand ofairlines.

CREATE VIEW business_customers AS SELECT customer_id, class_id, brand FROM ticket_details WHERE class_id = 'bussiness';
      SELECT * FROM business_customers;
      
      
# 15. Write a query to create a stored procedure that extracts all the details from the routes table where the travelled distance is more than 2000 miles.

delimiter &&
CREATE PROCEDURE `distance4`() BEGIN  SELECT * FROM route_details  WHERE distance_miles > 2000; END&& 
delimiter 

# 16. Write a query to extract the first record of the customer whose last name ends with Scott using a cursor from the customer table.

SELECT * FROM customer WHERE last_name LIKE '%scott';

