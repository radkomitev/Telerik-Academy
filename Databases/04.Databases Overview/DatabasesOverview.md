# Database Systems - Overview
#### 1. What database models do you know?
A database model is a type of data model that determines the logical structure of a database

  - Hierarchical
  - Network
  - Relational
  - Object-oriented
##### Relational
Relational Database Management Systems (RDBMS) manage data stored in tables.
Popular RDBMS servers:
 - Microsoft SQL Server
 - Oracle Database
 - MySQL
 - IBM DB2
 - PostgreSQL
 - SQLite

#### 2. Which are the main functions performed by a Relational Database Management System (RDBMS)?
 - Creating, altering or deleting tables and relationships between them (database schema)
 - Adding, changing, deleting, searching and retrieving of data stored in the tables
 - Support for the SQL language
 - Transaction management (optional)

#### 3. Define what is "table" in database terms?
A table is a collection of related data held in a structured format within a database. It consists of fields (columns), and rows. In relational databases and flat file databases, a table is a set of data elements (values) using a model of vertical columns (identifiable by name) and horizontal rows, the cell being the unit where a row and column intersect. A table has a specified number of columns, but can have any number of rows.

#### 4. Explain the difference between a primary and a foreign key?
| Primary Key 	| Foreign Key 	|  	|  	|  	|
|---------------------------------------------------------------------------------------------------------------------------------------	|--------------------------------------------------------------------------------------------------------------------------------	|---	|---	|---	|
| Primary key uniquely identify a record in the table. 	| Foreign key is a field in the table that is primary key in another table. 	|  	|  	|  	|
| Primary Key can't accept null values. 	| Foreign key can accept multiple null value. 	|  	|  	|  	|
| By default, Primary key is clustered index and data in the database table is physically organized in the sequence of clustered index. 	| Foreign key do not automatically create an index, clustered or non-clustered. You can manually create an index on foreign key. 	|  	|  	|  	|

#### 5. Explain the different kinds of relationships between tables in relational databases?
Relationships have multiplicity:
 - One-to-many – Example -> country / towns
 
A single record in the first table has many corresponding records in the second table
 - Many-to-many – Example -> student / course

Records in the first table have many correspon-ding records in the second one and vice versa. Implemented through additional table.
 - One-to-one – Example -> example human / student

A single record in a table corresponds to a single record in the other table.
Used to model inheritance between tables.

#### 6. When is a certain database schema normalized?
Normalization of the relational schema removes repeating data
Non-normalized schemas can contain many data repetitions.

#### 7. What are database integrity constraints and when are they used?

Integrity constraints ensure data integrity in the database tables
Enforce data rules which cannot be violated
 - Primary key constraint
 
Ensures that the primary key of a table has unique value for each table row.
 - Unique key constraint
 
Ensures that all values in a certain column (or a group of columns) are unique.

 - Foreign key constraint
 
Ensures that the value in given column is a key from another table.
 - Check constraint

Ensures that values in a certain column meet some predefined condition.

#### 8. Point out the pros and cons of using indexes in a database?
 - Indices speed up searching of values in a certain column or group of columns
Usually implemented as B-trees.
 - Indices can be built-in the table (clustered) or stored externally (non-clustered).
Adding and deleting records in indexed tables is slower!
 - Indices should be used for big tables only (e.g. 50 000 rows)
 
#### 9. What's the main purpose of the SQL language?
Standardized declarative language for manipulation of relational databases.
 
#### 10. What are transactions used for?
Transactions are a sequence of database operations which are executed as a single unit:
 - Either all of them execute successfully
 - Or none of them is executed at all

Example:
 - A bank transfer from one account into another (withdrawal + deposit)
 - If either the withdrawal or the deposit fails the entire operation should be cancelled
 - 
#### 11. What is a NoSQL database?
NoSQL == “No SQL” or “Not Only SQL”?
 - Use document-based model (non-relational)
 - Schema-free document storage
 - Still support CRUD operations: Create, Read, Update, Delete
 - Still support indexing and querying
 - Still supports concurrency and transactions
 - Highly optimized for append / retrieve
 - Great performance and scalability

#### 12. Explain the classical non-relational data models?
 - Document model -> Set of documents, e.g. JSON strings
 - Key-value model (e.g. Redis) -> Set of key-value pairs
 - Hierarchical key-value -> Hierarchy of key-value pairs
 - Wide-column model (e.g. Cassandra) -> Key-value model with schema
 - Object model (e.g. Cache) -> Set of OOP-style objects
 
#### 13. Give few examples of NoSQL databases and their pros and cons?
 - Redis

Ultra-fast in-memory data structures server
 - MongoDB

Mature and powerful JSON-document database
 - CouchDB

JSON-based document database with REST API
 - Cassandra

Distributed wide-column database






