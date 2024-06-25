# Bytes-of-China
Bytes of China Code Academy SQL Database Project

# Purpose

    Design a database that shows the menu items, price, reviews and restaurant for a company called Bytes of China. Using PostGres as the sql syntax, this projects showcases the creation of tables, insert data into those tables, and building relationships between the tables.

## Tech Stack

    - PostGres SQL

## Takeaways

    This was an interesting project to attempt building a relational database design. This projects would work well for an on prem type infrustructure but for ca more modern cloud envirnoment I would have gone a One Big Table desgin for the lunch special table. This would have made a compromise on storage costs but speed and optimized query performance as a single object is being sacnned and that object does not have many rows. Even as this system scales a restaurant's item list would not increase exponentially as this would be dynamic to the current offerings of that restaurant. This is ideal in OLTP since we are working to reduce redundancy and we have no transaction entity for sales or anything that might be used for an analytics used cases such as number of times a item is ordered, who did the ordering etc. 
