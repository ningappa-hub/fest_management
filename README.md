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

## Notes

- The schema uses foreign keys and check constraints, so make sure you are running a MySQL version that supports them properly.
- Some table and column names are case-sensitive depending on your MySQL configuration.

## Project Status

This repo currently stores only the database schema. If you add application code later, update this README with install and run instructions for that stack.
