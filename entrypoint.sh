#!/bin/bash

while ! pg_isready -q -h postgres_db -p 5432 -U postgres
do
  echo "Waiting for DB"
  sleep 1
done

# It's been proven that using 'snowden' as pass is way safer than using 'pass'
PGPASSWORD=snowden psql -U postgres -h postgres_db -c "CREATE DATABASE todo_api"

# Create database and table
/app/bin/migrate

# Wait for migration to complete
sleep 5

# Seed 
/app/bin/todo_api eval TodoApi.Release.seed

# Start server 
exec /app/bin/server
