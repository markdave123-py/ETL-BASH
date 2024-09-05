# ETL Pipeline for Competitor Data Analysis

## Project Overview

This repository contains scripts and SQL queries for an ETL (Extract, Transform, Load) pipeline designed to analyze competitor data from Parch and Posey. The data is processed from CSV files into a PostgreSQL database and analyzed using SQL queries. The folder structure is organized to include both Bash and SQL scripts for different stages of the ETL pipeline.

## Folder Structure

- **bash-queries**
  - **ass1-etl**
    - `extract.sh` - Extracts data from CSV files.
    - `load.sh` - Loads CSV data into PostgreSQL tables.
    - `transform.sh` - Transforms data as required.
  - **ass2**
    - `crontab.sh` - Sets up a cron job to schedule the ETL pipeline.
  - **ass3**
    - `movefile.sh` - Moves files from one directory to another.
  - **ass4**
    - `createdb.sh` - Creates the PostgreSQL database and tables.
    - `exeSql.sh` - Executes SQL queries for data analysis.
- **sql-scripts**
  - `queries.sql` - Contains SQL queries to answer specific business questions.
- **readme.md** - This file.

## Setup Instructions

1. **Database Configuration**

   Make sure you have PostgreSQL installed and running. Configure the database credentials in an environment variable or update the scripts as needed.

2. **Create Database and Tables**

   Run `createdb.sh` to create the PostgreSQL database named `posey` and define the necessary tables.

   ```bash
   bash ass4/createdb.sh

