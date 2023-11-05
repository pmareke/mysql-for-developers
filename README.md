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

### Long Strings

### Enums

### Dates

### JSON

### Unexpected types

### Generated columns

### Schema migrations

## Indexes

## Queries

## Examples

