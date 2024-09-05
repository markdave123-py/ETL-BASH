#!/bin/bash


# Run SQL queries using psql
psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -f "queries.sql"
