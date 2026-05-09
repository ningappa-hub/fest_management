# Fest Management

This repository contains the MySQL schema for a festival management system.

## Contents

- `Schema.sql` - database creation and table definitions for festivals, teams, members, events, registrations, stalls, items, purchases, participants, and visitors.

## Prerequisites

- MySQL Server installed locally or available remotely
- A MySQL client such as MySQL Workbench or the `mysql` command-line tool

## Setup

1. Open `Schema.sql`.
2. Run the script in MySQL.
3. If needed, update the database name in the script before running it.

The script creates the `fest_management` database and then creates all required tables.

## Use From VS Code Terminal

If you want to work with the database directly from the VS Code terminal on Windows, use MySQL CLI commands:

1. Open the integrated terminal in VS Code.
2. Connect to MySQL:

```powershell
mysql -u root -p
```

3. Create the schema and load the data:

```powershell
mysql -u root -p < "D:\personal_projects\fest_management\Schema.sql"
mysql -u root -p < "D:\personal_projects\fest_management\fest_management_data.sql"
```

4. Verify the database:

```powershell
mysql -u root -p
USE fest_management;
SHOW TABLES;
SELECT * FROM Fest;
```

If your MySQL server uses a different username, host, or port, adjust the command accordingly, for example `mysql -h 127.0.0.1 -P 3306 -u your_user -p`.

## Notes

- The schema uses foreign keys and check constraints, so make sure you are running a MySQL version that supports them properly.
- Some table and column names are case-sensitive depending on your MySQL configuration.

## Project Status

This repo currently stores only the database schema. If you add application code later, update this README with install and run instructions for that stack.
