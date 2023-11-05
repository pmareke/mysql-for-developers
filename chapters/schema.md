# Schema

## Introduction

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

## Integers

- There are five data types that can be used to store integers:
    - `TINYINT`: Occupies one byte and can store values from 0 to 255 (or -128 to 127, if negative numbers are supported).
    - `SMALLINT`: Occupies two bytes and can store values from 0 to 65,535 (if negative numbers aren't supported).
    - `MEDIUMNINT`: Occupies three bytes and can store values from 0 to 16,777,215 (if negative numbers aren't supported).
    - `INT`: Occupies four bytes and can store values from 0 to 4,294,967,295 (if negative numbers aren't supported).
    - `BIGINT`: Occupies eight bytes and can store values from 0 to 18,446,744,073,709,551,615 (if negative numbers aren't supported).

## Decimals

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

## Strings

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

## Binary Strings

- The `BINARY` and `VARBINARY` columns store bytes only.
- There is no character set or collation to be concerned about; it is just raw binary data.
- The `BINARY` column is a fixed length column, while the `VARBINARY` column is a variable length column.
- `BINARY` and `VARBINARY` columns in MySQL provide an efficient way to store binary data that may not have a valid string representation.
- You can store `hash` and `UUID` data more compactly on disk, without the need for character sets and collations.

## Long Strings

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

## Enums

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

## Dates

- There are five different types you can use to store time-related data in MySQL:
    - `DATE`: If you only need to store the date.
    - `DATETIME`: If you need to store both the date and time (eight-byte data type).
    - `TIMESTAMP`: Same as `DATETIME` but with only four bytes.
        - It can store only from the year 1970 to 2038-01-19.
    - `YEAR`: If you need to store a year between 1901 and 2155.
    - `TIME`: Data type is used to store hours, minutes, and seconds.
- `DATETIME` does not handle time zones at all.
- `TIMESTAMP` tries to convert values to UTC when added to the database and back to your time zone when retrieved.

## JSON

- MySQL has proper first-party support for `JSON`.
- When working with JSON data, MySQL is much more strict than with other text data types.
- The `->>` operator is used to extract a JSON object at a specific path.
- `JSON` columns cannot be directly indexed.
- You can create an index on a specific key within a JSON object, but not on the entire object itself.
- `JSON` column might make sense when you're storing payloads.
- One caveat when using `JSON` columns is that they can be quite heavy.

## Unexpected types

- Booleans:
    - MySQL doesn't actually have a native `BOOLEAN` type.
    - Instead, MySQL uses a `TINYINT` column to simulate a boolean value.
- IP addresses:
    - MySQL has a built-in function `INET_ATON()` that converts an IPv4 address to an integer.
    - `INET_NTOA()` to convert an integer back to an IP address.

## Generated columns

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

## Schema migrations

- Migrations are a folder full of SQL statements that help keep track of changes to your database schema.
- Best practices for migrations:
    - Always include explicit SQL statements to show how the database will move from one state to another.
    - Avoid using down migrations.
    - Utilize version control to keep track of changes to your schema over time.

