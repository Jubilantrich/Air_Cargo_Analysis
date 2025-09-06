
#------------------------------------------------------------------------

# Create a DATABASE air_cargo_db
CREATE DATABASE air_cargo_db; 
USE air_cargo_db; 
#------------------------------------------------------------------------
# Create route table with contraints

CREATE TABLE route_details (
    route_id INT NOT NULL,
    flight_num VARCHAR(10) NOT NULL,
    origin_airport VARCHAR(25) NOT NULL,
    destination_airport VARCHAR(25) NOT NULL,
    aircraft_id VARCHAR(25) NOT NULL,
    distance_miles INT NOT NULL,
    CONSTRAINT route_unique UNIQUE (route_id),
    CONSTRAINT distance_check CHECK (distance_miles > 0),
    CONSTRAINT flightnum_check CHECK (flight_num REGEXP '^[0-9]{1,6}$')
)ENGINE=INNODB;
#------------------------------------------------------------------------
# create Customer table
CREATE TABLE IF NOT EXISTS customer(
	customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth VARCHAR(10) NOT NULL,
    gender ENUM('M','F') NOT NULL
)ENGINE=INNODB;
#------------------------------------------------------------------------

# create Passengers on Flights table
	
CREATE TABLE IF NOT EXISTS passengers_on_flights(
	PID INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    aircraft_id VARCHAR(25) NOT NULL,
    route_id INT NOT NULL,
    depart VARCHAR(25) NOT NULL,
    arrival VARCHAR(25) NOT NULL,
    seat_num VARCHAR (10) NOT NULL,
    class_id VARCHAR(25) NOT NULL,
    travel_date VARCHAR(10) NOT NULL,
    flight_num VARCHAR(10) NOT NULL,
    CONSTRAINT customer_fpassenger FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	CONSTRAINT route_fpassenger FOREIGN KEY (route_id) REFERENCES route_details(route_id)
)ENGINE=INNODB;
#------------------------------------------------------------------------

# create the ticket detals table

CREATE TABLE IF NOT EXISTS ticket_details(
	td_id INT AUTO_INCREMENT PRIMARY KEY,
    p_date VARCHAR(10) NOT NULL,
    customer_id INT NOT NULL,
    aircraft_id VARCHAR(25) NOT NULL,
    class_id VARCHAR(25) NOT NULL,
    no_of_tickets INT NOT NULL CHECK (no_of_tickets <> 0),
    a_code VARCHAR(10) NOT NULL,
    Price_per_ticket DECIMAL(25,2) NOT NULL,
    brand VARCHAR(45) NOT NULL,
    CONSTRAINT customer_ticketDetails FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
)ENGINE=INNODB;
#------------------------------------------------------------------------

/*Write a query to display all the passengers (customers) who have 
travelled in routes 01 to 25. Take data from the passengers_on_flights 
table.*/

SELECT *
FROM customer c INNER JOIN  passengers_on_flights p
WHERE c.customer_id = p.customer_id AND route_id BETWEEN 1 AND 25;

#------------------------------------------------------------------------
/*Write a query to identify the number of passengers and total revenue in 
business class from the ticket_details table.*/
SELECT 
    SUM(no_of_tickets) AS total_passengers,
    SUM(no_of_tickets * Price_per_ticket) AS total_revenue
FROM ticket_details
WHERE class_id = 'Bussiness';

-- 5. Write a query to display the full name of the customer by extracting the 
-- first name and last name from the customer table. 

SELECT customer_id, CONCAT(first_name, ' ', last_name) AS full_name
FROM customer;

-- 6. Write a query to extract the customers who have registered and booked a 
-- ticket. Use data from the customer and ticket_details tables. 

SELECT DISTINCT c.customer_id, c.first_name, c.last_name
FROM customer c
JOIN ticket_details t ON c.customer_id = t.customer_id;

-- 7. Write a query to identify the customer’s first name and last name based 
-- on their customer ID and brand (Emirates) from the ticket_details table. 
SELECT DISTINCT c.customer_id, c.first_name, c.last_name
FROM ticket_details t
JOIN customer c ON c.customer_id = t.customer_id
WHERE t.brand = 'Emirates';

/*-- 8. Write a query to identify the customers who have travelled by Economy 
-- Plus class using Group By and Having clause on the passengers_on_flights table. */
SELECT 
	c.customer_id, c.first_name
FROM 
	passengers_on_flights p JOIN customer c ON c.customer_id = p.customer_id
WHERE 
	class_id = 'Economy Plus'
GROUP BY customer_id
HAVING COUNT(*) > 0;

-- 9. Write a query to identify whether the revenue has crossed 10000 using 
-- the IF clause on the ticket_details table. 

SELECT 
    SUM(no_of_tickets * price_per_ticket) AS revenue,
    IF(SUM(no_of_tickets * price_per_ticket) > 10000, 'Above 10000', 'Below 10000') AS Revenue_Level
FROM ticket_details;


-- 10. Write a query to create and grant access to a new user to perform 
-- operations on a database. 

CREATE USER 'user_dataanalyst'@'%' IDENTIFIED BY 'Data_P@$$w0rd';
GRANT SELECT, INSERT, UPDATE, DELETE ON air_cargo_db.* TO 'user_dataanalyst'@'%';
FLUSH PRIVILEGES;

-- 11. Write a query to find the maximum ticket price for each class using 
-- window functions on the ticket_details table.
  
  SELECT 
    class_id,
    price_per_ticket,
    MAX(price_per_ticket) OVER (PARTITION BY class_id) AS max_price_in_class
FROM ticket_details;

  
-- 12. Write a query to extract the passengers whose route ID is 4 by improving 
-- the speed and performance of the passengers_on_flights table. 

CREATE INDEX route_index ON passengers_on_flights(route_id);

SELECT *
FROM passengers_on_flights
WHERE route_id = 4;

-- 13.  For the route ID 4, write a query to view the execution plan of the 
-- passengers_on_flights table. 

EXPLAIN SELECT *
FROM passengers_on_flights
WHERE route_id = 4;


-- 14. Write a query to calculate the total price of all tickets booked by a 
-- customer across different aircraft IDs using rollup function.  
 
 SELECT 
    customer_id,
    aircraft_id,
    SUM(no_of_tickets * price_per_ticket) AS total_price
FROM ticket_details
GROUP BY customer_id, aircraft_id WITH ROLLUP;
                                                                  
 
-- 15. Write a query to create a view with only business class customers along 
-- with the brand of airlines. 
 
CREATE OR REPLACE VIEW business_class_customers AS
SELECT DISTINCT c.customer_id, c.first_name, c.last_name, t.brand
FROM ticket_details t
JOIN customer c ON c.customer_id = t.customer_id
WHERE t.class_id = 'Bussiness';
 
-- 16. Write a query to create a stored procedure to get the details of all 
-- passengers flying between a range of routes defined in run time. Also, 
-- return an error message if the table doesn't exist.
 DELIMITER $$

CREATE PROCEDURE GetPassengersByRouteRange(IN routeFrom INT, IN routeTo INT)
BEGIN
    IF (SELECT COUNT(*) FROM information_schema.tables 
        WHERE table_schema = DATABASE() AND table_name = 'passengers_on_flights') = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Table passengers_on_flights does not exist';
    ELSE
        SELECT *
        FROM passengers_on_flights
        WHERE route_id BETWEEN routeFrom AND routeTo;
    END IF;
END $$

DELIMITER ;

-- 17. Write a query to create a stored procedure that extracts all the details 
-- from the routes table where the travelled distance is more than 2000 
-- miles. 
DELIMITER $$

CREATE PROCEDURE RoutesOver2000()
BEGIN
    SELECT * 
    FROM route_details
    WHERE distance_miles > 2000;
END $$

DELIMITER ;

-- 18. Write a query to create a stored procedure that groups the distance 
-- travelled by each flight into three categories. The categories are, short 
-- distance travel (SDT) for >=0 AND <= 2000 miles, intermediate distance 
-- travel (IDT) for >2000 AND <=6500, and long-distance travel (LDT) for 
-- >6500. 

DELIMITER $$

CREATE PROCEDURE RouteDistances_Categorization()
BEGIN
    SELECT 
        route_id,
        flight_num,
        distance_miles,
        CASE
            WHEN distance_miles BETWEEN 0 AND 2000 THEN 'SDT'
            WHEN distance_miles > 2000 AND distance_miles <= 6500 THEN 'IDT'
            WHEN distance_miles > 6500 THEN 'LDT'
            ELSE 'DISTANCE UNKNOWN'
        END AS distance_category
    FROM route_details;
END $$

DELIMITER ;

-- 19. Write a query to extract ticket purchase date, customer ID, class ID and 
-- specify if the complimentary services are provided for the specific class 
-- using a stored function in stored procedure on the ticket_details table.  
-- Condition:  
-- ● If the class is Business and Economy Plus, then complimentary services 
-- are given as Yes, else it is No 

DELIMITER $$

CREATE FUNCTION Complimentary_Services(class_id VARCHAR(25))
RETURNS VARCHAR(3)
DETERMINISTIC
BEGIN
    RETURN (CASE 
        WHEN class_id IN ('Bussiness', 'Economy Plus') THEN 'Yes'
        ELSE 'No'
    END);
END $$

DELIMITER ;
# prodedure 
DELIMITER $$

CREATE PROCEDURE TicketComplimentary()
BEGIN
    SELECT 
        p_date,
        customer_id,
        class_id,
        Complimentary_Services(class_id) AS complimentary
    FROM ticket_details;
END $$

DELIMITER ;

-- 20. Write a query to extract the first record of the customer whose last name 
-- ends with Scott using a cursor from the customer table.

DELIMITER $$

CREATE PROCEDURE lasnameCustomer()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE customerid INT;
    DECLARE firstname VARCHAR(25);
    DECLARE lastname VARCHAR(25);

    DECLARE cur CURSOR FOR
        SELECT customer_id, first_name, last_name
        FROM customer
        WHERE last_name LIKE '%Scott'
        ORDER BY customer_id
        LIMIT 1;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    FETCH cur INTO customerid, firstname, lastname;

    IF done = 0 THEN
        SELECT customerid AS customer_id, firstname AS first_name, lastname AS last_name;
    ELSE
        SELECT 'No matching customer' AS message;
    END IF;

    CLOSE cur;
END $$

DELIMITER ;
