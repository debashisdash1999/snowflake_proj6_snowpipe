--  TASK 1:- Setting Up Database, Table, Stage, and File Format for Snowpipe
-- Use the demo warehouse
USE WAREHOUSE demo;

-- Create the database for Snowpipe
CREATE OR REPLACE DATABASE sales_db_snowpipe;

-- Create a table to store sales data
CREATE OR REPLACE TABLE sales_pipe_table (
    order_id INTEGER,
    customer_id INTEGER,
    customer_name STRING,
    order_date DATE,
    product STRING,
    quantity INTEGER,
    price FLOAT,
    complete_address STRING
);

-- Create an external stage pointing to the S3 bucket
CREATE OR REPLACE STAGE s3_stage_snowpipe
URL = 's3://snowflake-hands-on-data/sample_data_snowpipe/step-1/'
CREDENTIALS = ( 
    AWS_KEY_ID = 88888888888888 
    AWS_SECRET_KEY = 88888888888888
);

-- Create a CSV file format
CREATE OR REPLACE FILE FORMAT csv_format_snowpipe
TYPE = 'CSV'
FIELD_DELIMITER = ','
SKIP_HEADER = 1;




--  TASK 2:- Setting up Snowpipe for Automatic Data Loading
-- Continue using the demo warehouse
USE WAREHOUSE demo;

-- Continue using the existing database for Snowpipe
USE DATABASE sales_db_snowpipe;

-- Create a Snowpipe for automatic data loading from the stage
CREATE OR REPLACE PIPE sales_pipe
AUTO_INGEST = TRUE
AS
COPY INTO sales_pipe_table
FROM @s3_stage_snowpipe
FILE_FORMAT = (FORMAT_NAME = 'csv_format_snowpipe');

-- Describe the Snowpipe configuration to verify setup
DESC PIPE sales_pipe;

-- Ensure there is no data in the table before triggering the pipe
SELECT * FROM sales_pipe_table;




--  TASK 3:- Error Handling in Snowpipe
-- Set the active warehouse to demo for running the queries
USE WAREHOUSE demo;  

-- Switch to the sales database for Snowpipe
USE DATABASE sales_db_snowpipe;  

-- List all the Snowpipes configured in the current database
SHOW PIPES;  

-- Create a new Snowpipe or replace the existing one
CREATE OR REPLACE PIPE sales_pipe
AUTO_INGEST = TRUE
AS
COPY INTO sales_pipe_table
FROM @s3_stage_snowpipe
FILE_FORMAT = (FORMAT_NAME = 'csv_format_snowpipe')
ON_ERROR = 'CONTINUE';

-- Display the configuration of the newly created Snowpipe
DESC PIPE sales_pipe;  

-- Pause the Snowpipe execution
ALTER PIPE sales_pipe SET PIPE_EXECUTION_PAUSED = TRUE;  

-- Check the current status of the Snowpipe
SELECT SYSTEM$PIPE_STATUS('sales_pipe');




--  TASK 4:- Managing Snowpipe Execution
-- Set the active warehouse to demo for running the queries
USE WAREHOUSE demo; 

-- Switch to the sales database for Snowpipe
USE DATABASE sales_db_snowpipe;  

-- List all the Snowpipes configured in the current database
SHOW PIPES;  

-- Resume the execution of the Snowpipe that was previously paused
ALTER PIPE sales_pipe SET PIPE_EXECUTION_PAUSED = FALSE;  

-- Manually trigger the Snowpipe to load data from the external stage
ALTER PIPE sales_pipe REFRESH;  

-- Check the current status of the Snowpipe to monitor its activity
SELECT SYSTEM$PIPE_STATUS('sales_pipe');  

-- Query the sales_pipe_table to confirm the data has been successfully loaded
SELECT * FROM sales_pipe_table;




--  TASK 5:- End-to-End Testing and Cleanup of Snowpipe
-- Set the active warehouse to demo for running the queries
USE WAREHOUSE demo;  

-- Switch to the sales database for Snowpipe
USE DATABASE sales_db_snowpipe;  

-- Create an external stage pointing to the S3 bucket for Snowpipe
CREATE OR REPLACE STAGE s3_stage_snowpipe
URL = 's3://snowflake-hands-on-data/sample_data_snowpipe/step-2/'
CREDENTIALS = ( 
    AWS_KEY_ID = 88888888888888 
    AWS_SECRET_KEY = 8888888888888888
);  

-- Recreate the Snowpipe with error handling for invalid rows
CREATE OR REPLACE PIPE sales_pipe
AUTO_INGEST = TRUE
AS
COPY INTO sales_pipe_table
FROM @s3_stage_snowpipe
FILE_FORMAT = (FORMAT_NAME = 'csv_format_snowpipe')
ON_ERROR = 'CONTINUE';

-- Manually trigger the Snowpipe for loading data from the external stage
ALTER PIPE sales_pipe REFRESH;  

-- Check the current status of the Snowpipe to monitor its activity
SELECT SYSTEM$PIPE_STATUS('sales_pipe');  

-- Query the sales_pipe_table to confirm the data has been successfully loaded
SELECT * FROM sales_pipe_table;

-- Drop the Snowpipe if it exists
DROP PIPE IF EXISTS sales_pipe;  

-- Drop the external stage if it exists
DROP STAGE IF EXISTS s3_stage_snowpipe;  

-- Drop the sales data table if it exists
DROP TABLE IF EXISTS sales_pipe_table;  

-- Drop the database if it exists
DROP DATABASE IF EXISTS sales_db_snowpipe;
