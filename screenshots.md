Creating of Database and it tables 

Results after running queries
 

1.	Create an ER diagram for the given airlines database.
OutPut:
 <img width="975" height="713" alt="image" src="https://github.com/user-attachments/assets/a287c69d-d1bc-432c-bcbe-96539f319a39" />


2.	Write a query to create a route_details table using suitable data types for the fields, such as route_id, flight_num, origin_airport, destination_airport, aircraft_id, and distance_miles. Implement the check constraint for the flight number and unique constraint for the route_id fields. Also, make sure that the distance miles field is greater than 0. 
 <img width="975" height="473" alt="image" src="https://github.com/user-attachments/assets/130672db-5eae-4294-8e13-a9d0ff8d0ffa" />


3.	Write a query to display all the passengers (customers) who have travelled in routes 01 to 25. Take data from the passengers_on_flights table.

OUTPUT:
 
<img width="996" height="389" alt="image" src="https://github.com/user-attachments/assets/5b867dee-3073-4156-aac7-e4fe5f90f9f8" />

4.	Write a query to identify the number of passengers and total revenue in business class from the ticket_details table.
 <img width="975" height="378" alt="image" src="https://github.com/user-attachments/assets/b5dc140d-db9a-4e0e-9ad9-cbf1e61199fb" />

5.	Write a query to display the full name of the customer by extracting the 
first name and last name from the customer table. 
<img width="975" height="531" alt="image" src="https://github.com/user-attachments/assets/a5e51781-5293-4166-8ff5-c3b44f39847a" />

 

6. Write a query to extract the customers who have registered and booked a 
ticket. Use data from the customer and ticket_details tables. 

 <img width="975" height="498" alt="image" src="https://github.com/user-attachments/assets/9c303585-88af-4595-af5f-179e7dac0e05" />


7. Write a query to identify the customer’s first name and last name based 
on their customer ID and brand (Emirates) from the ticket_details table. 
 <img width="975" height="465" alt="image" src="https://github.com/user-attachments/assets/e82b47b1-56ee-4daf-9604-2a5d8e0e5d1d" />


8. Write a query to identify the customers who have travelled by Economy 
Plus class using Group By and Having clause on the passengers_on_flights 
table.  
 <img width="975" height="548" alt="image" src="https://github.com/user-attachments/assets/14126f35-a033-498d-b4ca-1673b5dce9b2" />


9. Write a query to identify whether the revenue has crossed 10000 using 
the IF clause on the ticket_details table. 

 <img width="975" height="334" alt="image" src="https://github.com/user-attachments/assets/9f961ffd-0377-48cf-8683-9ba357ea6785" />


10. Write a query to create and grant access to a new user to perform 
operations on a database. 

 <img width="975" height="211" alt="image" src="https://github.com/user-attachments/assets/d21fecda-65e7-4c0f-bd07-a5e3c7f376a4" />


11. Write a query to find the maximum ticket price for each class using 
window functions on the ticket_details table.  
 
<img width="975" height="623" alt="image" src="https://github.com/user-attachments/assets/69789e63-1604-4646-86e1-dfd158652fdf" />

12. Write a query to extract the passengers whose route ID is 4 by improving 
the speed and performance of the passengers_on_flights table. 

 <img width="975" height="488" alt="image" src="https://github.com/user-attachments/assets/4046b133-8220-4ed1-8d4c-b446ef6137ec" />


13.  For the route ID 4, write a query to view the execution plan of the 
passengers_on_flights table. 

 <img width="975" height="350" alt="image" src="https://github.com/user-attachments/assets/9ba66613-85f6-4ecb-b1d4-fd98407d6ae5" />


14. Write a query to calculate the total price of all tickets booked by a 
customer across different aircraft IDs using rollup function.  
  
 <img width="975" height="573" alt="image" src="https://github.com/user-attachments/assets/4737ec5c-7e02-4476-bc6c-397111da51ce" />

                                                                  
 
15. Write a query to create a view with only business class customers along 
with the brand of airlines.  

 
 <img width="975" height="285" alt="image" src="https://github.com/user-attachments/assets/1baef137-8a19-459c-8495-bd16089e19a9" />


16. Write a query to create a stored procedure to get the details of all 
passengers flying between a range of routes defined in run time. Also, 
return an error message if the table doesn't exist. 

 <img width="975" height="530" alt="image" src="https://github.com/user-attachments/assets/662c083d-212c-44c8-aad8-6e4d9f6d34a3" />


17. Write a query to create a stored procedure that extracts all the details 
from the routes table where the travelled distance is more than 2000 
miles. 
 

 <img width="975" height="366" alt="image" src="https://github.com/user-attachments/assets/e60f8e89-488c-441d-82e2-84219126e17b" />



18. Write a query to create a stored procedure that groups the distance 
travelled by each flight into three categories. The categories are, short 
distance travel (SDT) for >=0 AND <= 2000 miles, intermediate distance 
travel (IDT) for >2000 AND <=6500, and long-distance travel (LDT) for 
>6500. 

 <img width="975" height="252" alt="image" src="https://github.com/user-attachments/assets/049e8721-e17d-481c-8065-969095c32a27" />

 <img width="975" height="744" alt="image" src="https://github.com/user-attachments/assets/54e36fd4-a475-412d-93ad-74d87669e993" />



19. Write a query to extract ticket purchase date, customer ID, class ID and 
specify if the complimentary services are provided for the specific class 
using a stored function in stored procedure on the ticket_details table.  
Condition:  
● If the class is Business and Economy Plus, then complimentary services 
are given as Yes, else it is No 

<img width="975" height="987" alt="image" src="https://github.com/user-attachments/assets/5795cfb3-3157-4d55-80d6-0e496ef17339" />

<img width="975" height="392" alt="image" src="https://github.com/user-attachments/assets/2420ca4e-2229-4718-bf46-4237d5f21b68" />

 <img width="975" height="769" alt="image" src="https://github.com/user-attachments/assets/38bb293d-ffb4-41cc-8f13-d869357f25bb" />

<img width="975" height="1079" alt="image" src="https://github.com/user-attachments/assets/73651c49-16f4-4b6f-a38f-f1b5240857fc" />





20. Write a query to extract the first record of the customer whose last name 
ends with Scott using a cursor from the customer table.

<img width="975" height="863" alt="image" src="https://github.com/user-attachments/assets/17f1a35d-0efe-4b5e-9aaf-be99d5729700" />
<img width="975" height="449" alt="image" src="https://github.com/user-attachments/assets/ba1960da-d1ec-4281-ab8d-af07a115a3e8" />

 
 

