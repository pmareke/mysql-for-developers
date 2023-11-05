# [Queries](https://planetscale.com/learn/courses/mysql-for-developers/queries)

## EXPLAIN overview

- `EXPLAIN` is a statement provided by MySQL that helps us analyze how queries are executed in a database.
    - It shows the execution plan for a query.
- This statement returns output that shows how MySQL accessed the table:
    - `ID`: A unique identifier for the query being executed.
    - `Select Type`: Tells us the type of select statement is being executed.
        - This can be **simple, primary, union** or a few others.
    - `Table`: The name of the table being accessed.
    - `Partitions`: Displays the partitions being accessed for the query (beyond the scope of this course).
    - `Type`: The kind of access MySQL used to retrieve the data.
        - This is one of the most important column values, and we'll discuss it in more detail later.
    - `Possible Keys`: The possible indexes that MySQL could use.
    - `Key`: The actual index that MySQL uses.
    - `Key Length`: Displays the length of the index used by MySQL.
    - `Ref`: The value being compared to the index.
    - `Rows`: An estimated number of rows that MySQL needs to examine to return the result.
    - `Filtered`: The estimated percentage of rows that match the query criteria.

## EXPLAIN access types

### Const

- The **const** access method is one of the most efficient.
- `Const` access is only used when a primary key or unique index is in place, allowing MySQL to locate the necessary row with a single operation. When you see const in the type column, it's telling you that MySQL knows there is only one match for this query, making the operation as efficient as possible.

### Ref

- The **ref** access method is slightly less efficient than const, but still an excellent choice if the right index is in place. Ref access is used when the query includes an indexed column that is being matched by an equality operator. If MySQL can locate the necessary rows based on the index, it can avoid scanning the entire table, speeding up the query considerably.

### Fulltext

- MySQL provides an option to create full-text indexes on columns intended for text-based search queries.
- The **fulltext** access method is used when a full-text index is in place and the query includes a full-text search. Fulltext access allows MySQL to search the index and return the results quickly.

### Range

- When you use range in the where clause, MySQL knows that it will need to look through a range of values to find the right data. MySQL will use the B-Tree index to traverse from the top of the tree down to the first value of the range. From there, MySQL consults the linked list at the bottom of the tree to find the rows with values in the desired range. It's essential to note that MySQL will examine every element in the range until a mismatch is found, so this can be slower than some of the other methods mentioned so far.

### Index

- The **index** access method indicates that MySQL is scanning the entire index to locate the necessary data.
- `Index` access is the slowest access method listed so far, but it is still faster than scanning the entire table. When MySQL cannot use a primary or unique index, it will use index access if an index is available.

### All

- The **all** access method means that MySQL is scanning the entire table to locate the necessary data.
- `All` is the slowest and least efficient access method, so it's one that you want to avoid as much as possible. MySQL may choose to scan the entire table when there is no suitable index, so this is an excellent opportunity to audit your indexing strategy.

## EXPLAIN ANALYZE

- The explain statement provides several formats that you can use to analyze your queries in more detail.
- Some of the commonly used explain formats are:
    - `tree`: Useful for providing more detail into the execution plan in a nested tree structure.
    - `JSON`: Provides a more detailed view of the same information as provided in the tree format.
    - `EXPLAIN ANALYZE`: Actually runs the query and provides detailed statistics on the query's execution plan.
        -  **It's important to note that this format actually runs the query**.

## Index obfuscation

- Obfuscating your columns made it difficult for MySQL to use indexes.
- Always leave your column alone as much as possible.
- Any changes you make to it make it more difficult to use an index effectively.
- Move everything to the other side of the operator when possible.


