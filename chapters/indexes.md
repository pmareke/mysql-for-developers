# [Indexes](https://planetscale.com/learn/courses/mysql-for-developers/indexes)

## Introduction

- Indexing is the best way to ensure that your queries perform well.
- Indexes are an entirely separate data structure that maintain a copy of part of your data.
- When you create an index, it creates a second data structure, which is different from your primary data structure.
- Each index maintains a copy of part of your data.
- You should also create as few as you can get away with because creating too many indexes can impact the performance.
- You have to examine your queries to determine which indexes will perform the best.
- Indexing should be driven by access patterns.

## Primary Keys

- A primary key is a unique identifier for each row in the table.
- A secondary key is any index that is not the primary key.
- The primary key determines how your data is stored on disk.

## Secondary Keys

- A secondary key is simply any index that is not the primary key of a table.
- Every MySQL table has one primary key and can have multiple secondary keys.
- Every secondary key has the primary key appended to it, as each leaf node in the secondary key contains a pointer back to the row.

## Primary Key Data types

- The recommended practice for primary keys is to use unsigned big integers.
- Unsigned big integers provide virtually infinite room to grow.
- Auto-incrementing preserves a natural order for the records.
- Choosing a string data type, such as a `UUID` or a `GUID`, as a primary key can be tempting, but it has potential pitfalls.

## Where to add indexes

- Your queries should drive your indexes.
- Do not create an index on every column.
- The most basic use of an index is for direct access (`where`).
- Indexes can also be used for unbounded and bounded ranges (`<=>`, `between`).
- Indexes can also be used to sort rows instead of having MySQL do a full table scan (`sort`).
- Indexes can also be used to group rows together for an aggregate function (`group by`).

## Indexes Selectivity

- **Cardinality** refers to the number of distinct values in a particular column that an index covers.
- **Selectivity**, on the other hand, refers to how unique the values in a column are.

## Prefix indexes

- By indexing just a part of a string column, you can make the index much smaller and faster.
- Prefix indexing is especially suitable for long, evenly distributed, and unique strings, such as UUIDs and hashes.
- To determine the prefix length of a column to index, we have to calculate the overall selectivity of the column and compare it to the selectivity of the prefix.
    - As you increase the prefix length of columns values, we'll notice that the selectivity will also increase.
- Prefix indexes are not suitable for ordering or grouping.
    - The index does not contain the full string value, and therefore cannot be used.

## Composite indexes

- Composite indexes cover multiple columns instead of having individual indexes on each column.
- There are two main rules for using composite indexes:
    - **Left-to-right**, no skipping.
    - **Stops at the first range**.
- Tips for defining composite indexes:
    - Equality conditions that are commonly used would be good candidates for being first in a composite index.
    - Range conditions or less frequently used columns would be better candidates for ordering later in the composite index.

## Covering indexes

- A covering index is a regular index that provides all the data required for a query without having to access the actual table.
- They eliminate the need for the engine to access the actual table, saving a secondary traversal to gather the rest of the data.
- For an index to be considered a covering index, it must have all the data needed for a particular query.
    - The columns being selected.
    - The columns being filtered on.
    - The columns being used for sorting.

## Functional indexes

- Function-based indexes are used in cases where you need to create an index on a function rather than a column.
- A function-based index is created by applying a function to one or more columns of a table, and then creating an index on the results of that function.
- Function-based indexes are particularly useful in scenarios where the thing that you're trying to index is not a column, but rather the result of some set of operations or functions.

## Indexing JSON columns

- MySQL provides two viable methods to index specific keys out of a JSON blob:
    - Generating a column.
    - Creating a function-based index.
- You can't just index a JSON blob because MySQL doesn't support indexing JSON blobs.

## Indexing for wildcard searches

- MySQL can only use an index up until it reaches a wildcard character, such as %.
- MySQL cannot use an index when a wildcard character is at the beginning of a search string.
- While B-tree indexes work well for wildcard searches at the end of a search string, they may not be sufficient for more complex text searches.
    - In these cases, we can use a full text index.
- Full text indexes allow us to search for specific words or phrases within a larger text column with much greater efficiency than using a simple wildcard search.

## Fulltext indexes

- To add a full-text index to a table in MySQL, you can use an ALTER TABLE statement.
- The use of the `FULLTEXT` keyword to create a full-text index instead of a regular B-tree index.
- By default, full-text searches in MySQL are done in natural language mode.
- For more advanced full-text searches, you can switch to boolean mode.
    - Boolean mode allows you to use modifiers, like `+, -, >, <` and parentheses in your search query
- When using natural language mode, MySQL automatically orders the results by their relevancy score.
- MySQL returns the relevancy score as part of the search query results.

## Invisible indexes

- Making an index invisible allows you to monitor how your queries perform without the index without having to rebuild it.
    - If everything goes well, you can drop the index.
- Making an index invisible reduces the risks and potential complications of dropping an index.
- Making an index invisible enables you to test your queries without risking data loss or any adverse impact on system performance. 

## Duplicate indexes

- It's important to note that removing a redundant index can have unintended consequences, especially if you depend on the ordering of the rows in that index.
- To prevent duplicate indexes from occurring in the first place, it's important to keep an eye out for indexes that have overlapping leftmost prefixes.

## Foreign Keys

- A foreign key is a column or set of columns in a table that references the primary key of another table.
- A foreign key constraint is a condition that ensures the referential integrity of the data by enforcing a relationship between the foreign key and the referenced primary key.
- Constraints also require additional computation to maintain.
- Foreign keys are an important tool for maintaining relationships and ensuring the integrity of data in a relational database.
- By linking tables together and enforcing referential integrity, foreign keys help ensure consistency and accuracy in data management.

