# [SQL for Developers](https://planetscale.com/learn/courses/mysql-for-developers/introduction/course-introduction)

## Pre-requirements

- You need to have [Docker](https://www.docker.com/get-started/) installed in your computer.
- In order to have the MySQL database running you should run `make up` 
in the terminal.
- In order to stop the MySQL database you should run `make up` 
in the terminal.

## Schema

### Introduction

- Schema refers to the structure of your database tables, including column types, sizes, and attributes. 
- Three guiding principles in mind when choosing a data type:
    - Pick the **smallest** data type that will hold all of your data.
    - Pick the **simplest** column type that accurately reflects your data.
    - Ensure your schema accurately **reflects the reality** of your data.
- The most common data types in MySQL:
    - `INT`: Used for integer values.
    - `FLOAT` and `DOUBLE`: Used for decimal or floating point values.
    - `VARCHAR`: Used for variable-length character strings.
    - `DATE`, `DATETIME` and `TIMESTAMP`: Used for date and time values.

### Integers

- There are five data types that can be used to store integers:
    - `TINYINT`: Occupies one byte and can store values from 0 to 255 (or -128 to 127, if negative numbers are supported).
    - `SMALLINT`: Occupies two bytes and can store values from 0 to 65,535 (if negative numbers aren't supported).
    - `MEDIUMNINT`: Occupies three bytes and can store values from 0 to 16,777,215 (if negative numbers aren't supported).
    - `INT`: Occupies four bytes and can store values from 0 to 4,294,967,295 (if negative numbers aren't supported).
    - `BIGINT`: Occupies eight bytes and can store values from 0 to 18,446,744,073,709,551,615 (if negative numbers aren't supported).

### Decimals

- There are four different types of data types in MySQL that can store decimal values:
    `DECIMAL`: a fixed-precision data type that stores exact values.
    `NUMERIC`: an alias for DECIMAL, the two are the same thing in MySQL.
    `FLOAT`: a floating-point data type that stores approximate values.
    `DOUBLE`: a floating-point data type that stores larger and more precise values than FLOAT.
- If you need to store values that require absolute precision, such as currency or other financial data, you should use the **DECIMAL** data type.
    - You can specify the maximum number of digits and how many digits should occur after the decimal point.
    - `DECIMAL(10, 2)`: 10 digits in total, 2 of them are the decimals.
- If you don't require precise decimal values, you can use either **FLOAT** or **DOUBLE**.
    - Both of these data types store approximate values

### Strings

- There are many different types to choose from. Here's a list of the different types:
    - `CHAR`
    - `VARCHAR`
    - `TINYTEXT`
    - `TEXT`
    - `MEDIUMTEXT`
    - `LONGTEXT`
    - `BINARY`
    - `VARBINARY`
    - `TINYBLOB`
    - `BLOB`
    - `MEDIUMBLOB`
    - `LONGBLOB`
    - `ENUM`
    - `SET`
- Fixed-length columns are declared using the `CHAR` data type and require you to specify the column size.
- Variable-length columns are declared using the `VARCHAR` data type, and you have to specify the maximum column size.

### Binary Strings

- The `BINARY` and `VARBINARY` columns store bytes only.
- There is no character set or collation to be concerned about; it is just raw binary data.
- The `BINARY` column is a fixed length column, while the `VARBINARY` column is a variable length column.
- `BINARY` and `VARBINARY` columns in MySQL provide an efficient way to store binary data that may not have a valid string representation.
- You can store `hash` and `UUID` data more compactly on disk, without the need for character sets and collations.

### Long Strings

- `TEXT` and `BLOB` are used to store large amounts of text and binary data, respectively.
- `TEXT` columns are used to store character data, such as strings of text.
    - Text columns are **not indexable**.
    - There are four types of text columns in MySQL: `TINYTEXT`, `TEXT`, `MEDIUMTEXT`, and `LONGTEXT`.
    - As the name suggests, each type has a cap for the amount of data it can hold.
- `BLOB` columns are used to store binary data.
    - `BLOB` columns do not have a character set or a collation like `TEXT` columns do.
    - There are four types of blob columns: `TINYBLOB`, `BLOB`, `MEDIUMBLOB`, and `LONGBLOB`.
    - While `BLOB` columns can hold binary data such as images or audio files, it's not recommended to store them.
- Best practices:
    - Only select the columns that you need.
    - Don't index or sort entire columns.
    - Use `VARCHAR` columns for smaller amounts of data

### Enums

- Enums are a special data type that allows you to specify a predefined list of allowable values for a column.
- Enums look like strings, but under the hood, they're stored as integers.
- An enum column has a predefined list of allowable values, and any attempt to enter a value outside this list will result in an error.
- Using enums in MySQL has several benefits:
    - Data validation: When attempting to enter an invalid value, an error is thrown.
    - Readability.
    - Compact data type.
- There are some downsides too:
    - Changes to the schema: To add another option to the allowable values, you'll have to alter the schema.
    - Ordering: When sorting data using enums, MySQL sorts by the underlying integer value rather than the actual string.
    - Using integer enums.

### Dates

- There are five different types you can use to store time-related data in MySQL:
    - `DATE`: If you only need to store the date.
    - `DATETIME`: If you need to store both the date and time (eight-byte data type).
    - `TIMESTAMP`: Same as `DATETIME` but with only four bytes.
        - It can store only from the year 1970 to 2038-01-19.
    - `YEAR`: If you need to store a year between 1901 and 2155.
    - `TIME`: Data type is used to store hours, minutes, and seconds.
- `DATETIME` does not handle time zones at all.
- `TIMESTAMP` tries to convert values to UTC when added to the database and back to your time zone when retrieved.

### JSON

- MySQL has proper first-party support for `JSON`.
- When working with JSON data, MySQL is much more strict than with other text data types.
- The `->>` operator is used to extract a JSON object at a specific path.
- `JSON` columns cannot be directly indexed.
- You can create an index on a specific key within a JSON object, but not on the entire object itself.
- `JSON` column might make sense when you're storing payloads.
- One caveat when using `JSON` columns is that they can be quite heavy.

### Unexpected types

- Booleans:
    - MySQL doesn't actually have a native `BOOLEAN` type.
    - Instead, MySQL uses a `TINYINT` column to simulate a boolean value.
- IP addresses:
    - MySQL has a built-in function `INET_ATON()` that converts an IPv4 address to an integer.
    - `INET_NTOA()` to convert an integer back to an IP address.

### Generated columns

- Generated columns are a way to make MySQL do more work on your behalf.
- Created columns are based on other columns in your table.
- They're computed by an expression, rather than being explicitly stored in the table.
- Generated columns can be either virtual or stored.
    - A virtual column is calculated at runtime.
    - A stored column, on the other hand, is calculated during data insertion or update.
- Use cases for generated columns:
    - Extracting data from JSON objects.
    - Performing calculations.
    - Normalizing data.

### Schema migrations

- Migrations are a folder full of SQL statements that help keep track of changes to your database schema.
- Best practices for migrations:
    - Always include explicit SQL statements to show how the database will move from one state to another.
    - Avoid using down migrations.
    - Utilize version control to keep track of changes to your schema over time.

## Indexes

### Introduction

- Indexing is the best way to ensure that your queries perform well.
- Indexes are an entirely separate data structure that maintain a copy of part of your data.
- When you create an index, it creates a second data structure, which is different from your primary data structure.
- Each index maintains a copy of part of your data.
- You should also create as few as you can get away with because creating too many indexes can impact the performance.
- You have to examine your queries to determine which indexes will perform the best.
- Indexing should be driven by access patterns.

### Primary Keys

- A primary key is a unique identifier for each row in the table.
- A secondary key is any index that is not the primary key.
- The primary key determines how your data is stored on disk.

### Secondary Keys

- A secondary key is simply any index that is not the primary key of a table.
- Every MySQL table has one primary key and can have multiple secondary keys.
- Every secondary key has the primary key appended to it, as each leaf node in the secondary key contains a pointer back to the row.

### Primary Key Data types

- The recommended practice for primary keys is to use unsigned big integers.
- Unsigned big integers provide virtually infinite room to grow.
- Auto-incrementing preserves a natural order for the records.
- Choosing a string data type, such as a `UUID` or a `GUID`, as a primary key can be tempting, but it has potential pitfalls.

### Where to add indexes

- Your queries should drive your indexes.
- Do not create an index on every column.
- The most basic use of an index is for direct access (`where`).
- Indexes can also be used for unbounded and bounded ranges (`<=>`, `between`).
- Indexes can also be used to sort rows instead of having MySQL do a full table scan (`sort`).
- Indexes can also be used to group rows together for an aggregate function (`group by`).

### Indexes Selectivity

- **Cardinality** refers to the number of distinct values in a particular column that an index covers.
- **Selectivity**, on the other hand, refers to how unique the values in a column are.

### Prefix indexes

- By indexing just a part of a string column, you can make the index much smaller and faster.
- Prefix indexing is especially suitable for long, evenly distributed, and unique strings, such as UUIDs and hashes.
- To determine the prefix length of a column to index, we have to calculate the overall selectivity of the column and compare it to the selectivity of the prefix.
    - As you increase the prefix length of columns values, we'll notice that the selectivity will also increase.
- Prefix indexes are not suitable for ordering or grouping.
    - The index does not contain the full string value, and therefore cannot be used.

### Composite indexes

- Composite indexes cover multiple columns instead of having individual indexes on each column.
- There are two main rules for using composite indexes:
    - **Left-to-right**, no skipping.
    - **Stops at the first range**.
- Tips for defining composite indexes:
    - Equality conditions that are commonly used would be good candidates for being first in a composite index.
    - Range conditions or less frequently used columns would be better candidates for ordering later in the composite index.

### Covering indexes

- A covering index is a regular index that provides all the data required for a query without having to access the actual table.
- They eliminate the need for the engine to access the actual table, saving a secondary traversal to gather the rest of the data.
- For an index to be considered a covering index, it must have all the data needed for a particular query.
    - The columns being selected.
    - The columns being filtered on.
    - The columns being used for sorting.

### Functional indexes

- Function-based indexes are used in cases where you need to create an index on a function rather than a column.
- A function-based index is created by applying a function to one or more columns of a table, and then creating an index on the results of that function.
- Function-based indexes are particularly useful in scenarios where the thing that you're trying to index is not a column, but rather the result of some set of operations or functions.

### Indexing JSON columns

- MySQL provides two viable methods to index specific keys out of a JSON blob:
    - Generating a column.
    - Creating a function-based index.
- You can't just index a JSON blob because MySQL doesn't support indexing JSON blobs.

### Indexing for wildcard searches

- MySQL can only use an index up until it reaches a wildcard character, such as %.
- MySQL cannot use an index when a wildcard character is at the beginning of a search string.
- While B-tree indexes work well for wildcard searches at the end of a search string, they may not be sufficient for more complex text searches.
    - In these cases, we can use a full text index.
- Full text indexes allow us to search for specific words or phrases within a larger text column with much greater efficiency than using a simple wildcard search.

### Fulltext indexes

- To add a full-text index to a table in MySQL, you can use an ALTER TABLE statement.
- The use of the `FULLTEXT` keyword to create a full-text index instead of a regular B-tree index.
- By default, full-text searches in MySQL are done in natural language mode.
- For more advanced full-text searches, you can switch to boolean mode.
    - Boolean mode allows you to use modifiers, like `+, -, >, <` and parentheses in your search query
- When using natural language mode, MySQL automatically orders the results by their relevancy score.
- MySQL returns the relevancy score as part of the search query results.

### Invisible indexes

- Making an index invisible allows you to monitor how your queries perform without the index without having to rebuild it.
    - If everything goes well, you can drop the index.
- Making an index invisible reduces the risks and potential complications of dropping an index.
- Making an index invisible enables you to test your queries without risking data loss or any adverse impact on system performance. 

### Duplicate indexes

- It's important to note that removing a redundant index can have unintended consequences, especially if you depend on the ordering of the rows in that index.
- To prevent duplicate indexes from occurring in the first place, it's important to keep an eye out for indexes that have overlapping leftmost prefixes.

### Foreign Keys

- A foreign key is a column or set of columns in a table that references the primary key of another table.
- A foreign key constraint is a condition that ensures the referential integrity of the data by enforcing a relationship between the foreign key and the referenced primary key.
- Constraints also require additional computation to maintain.
- Foreign keys are an important tool for maintaining relationships and ensuring the integrity of data in a relational database.
- By linking tables together and enforcing referential integrity, foreign keys help ensure consistency and accuracy in data management.

## Queries

## Examples

