#✈️ Air Cargo Database Project – Implementation Write-Up
Project Overview
Air Cargo, an aviation company, required a relational database system to manage customer information, ticket sales, and flight passenger data. The project aimed to identify regular customers, analyze the busiest routes, and generate ticket sales insights to improve service delivery and operational efficiency.
________________________________________
Implementation Steps
1. Requirement Analysis
The problem statement and dataset description were studied to identify the core entities and relationships. Key business needs included:
•	Tracking customers and their personal details.
•	Recording passengers on flights for route, class, and travel details.
•	Storing ticket purchase details for revenue and sales reporting.
•	Supporting advanced queries such as busiest routes, regular passengers, and class-specific revenue.
________________________________________
2. Database Design
•	An Entity-Relationship (ER) diagram was prepared to show connections between customer, passengers_on_flights, ticket_details, and supporting tables like routes.
•	Relationships:
o	One customer can book multiple tickets.
o	Each ticket can be linked to specific aircraft and class IDs.
o	Passengers are associated with routes and flights.
________________________________________
3. Table Creation
Tables were created in MySQL with appropriate data types, constraints, and primary/foreign keys:
•	Customer: Stores personal information with customer_id as the primary key.
•	Passengers_on_flights: Records flight-specific travel details linked to customer_id.
•	Ticket_details: Captures ticket purchase data, price, and brand with foreign key reference to customer_id.
Constraints were applied for:
•	Data integrity (e.g., CHECK for positive ticket numbers and prices).
•	Referential integrity (foreign keys linking customers to tickets and flight records).
________________________________________
4. Sample Data Insertion
Sample records were inserted into the tables to simulate realistic operations:
•	Customers with different age groups and genders.
•	Passengers traveling across various routes in different classes (Business, Economy, Economy Plus).
•	Ticket purchases across brands (e.g., Emirates, Qatar Airways).
________________________________________
5. Query Development
SQL queries and stored procedures were implemented to answer business questions:
•	Identify regular customers by counting travel frequency.
•	Find busiest routes using aggregation and GROUP BY.
•	Calculate ticket sales revenue and breakdown by class.
•	Create views for business-class customers and use window functions for maximum ticket price per class.
•	Implement ROLLUP for multi-level revenue summaries.
•	Write stored procedures and functions to automate recurring queries (e.g., categorizing routes by distance, checking complimentary services).
________________________________________
6. Optimization & Testing
•	Indexes were created on frequently queried columns (route_id, customer_id) to improve performance.
•	Execution plans were reviewed using EXPLAIN in MySQL to ensure queries were optimized.
•	All procedures and queries were tested with sample data to confirm accuracy.
________________________________________
7. Security & User Management
•	A new database user was created with SELECT, INSERT, UPDATE, DELETE privileges to restrict unnecessary access.
•	User authentication and privilege flushing were applied via GRANT and FLUSH PRIVILEGES.
________________________________________
Outcome
The project successfully delivered a normalized and efficient database for Air Cargo. The solution allows:
•	Tracking of regular customers for targeted promotions.
•	Insights into busiest routes to optimize aircraft allocation.
•	Detailed ticket sales analysis for revenue monitoring.
This implementation ensures Air Cargo can operate in a data-driven, customer-centric manner, supporting strategic decisions and improving overall travel experience.

