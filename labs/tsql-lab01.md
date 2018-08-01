# T-SQL Lab 01
### MSSA, Fort Benning, Georgia
##### August 1, 2018

# Essential Dot Commands

1. .exit (.quit)
1. .help
1. .echo on | off
1. .headers on | off
1. .once   
1. .tables
1. .schema < tablename > 
1. .fullschema

# Useful Dot Commands

1. .dump < tablename >
1. .dump < tablename >
1. .mode MODE < tablename >
1. .output < filename >
1. .show

# Exercise

The following script will create a table, insert data, and run queries. You will need to run this script with:

    .\sqlite3 family.db -init tsql-lab01.sql > family.txt

in PowerShell, or with DOS like this:

    sqlite3 family.db < tsql-lab01.sql > family.txt

We will develop this script incrementally. The database name is *family.db*. The script name is *family.sql*. the output file name is *family.txt*. Yes, all three file have the same name --- only the extensions are different.


    .echo on
    .headers on
    
    -- Name: family.sql
    -- Author: Charles Carter
    -- Date: August 1, 2018
    -- Purpose: introduction to building a database and running queries
    
    drop table if exists family;
    
    create table family (
        id integer,
        name text,
        sex integer,
        role text
    );
    
    insert into family values (1, 'Charles', 1, 'parent');
    insert into family values (2, 'Bonnie', 0, 'parent');
    insert into family values (3, 'Casie', 0, 'child');
    insert into family values (4, 'Jackson', 1, 'child');
    insert into family values (4, 'Max', 1, 'pet');
    insert into family values (4, 'Midnight', 0, 'pet');
    
    .print ''
    select * from family;
    select name, role from family where sex = 1;
    select id, sex from family where role like 'pet';
    select * from family where sex = 0;
    
    .exit


