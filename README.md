# snowflake_proj6_snowpipe

TASK 1:-
Setting Up Database, Table, Stage, and File Format for Snowpipe

Use the Demo Warehouse: Ensure you are using the demo warehouse for this assignment.
Create a Database: Create a database called sales_db_snowpipe.

Create a Table: Within the sales_db_snowpipe database, create a table named sales_pipe_table with the following columns:
order_id (INTEGER)
customer_id (INTEGER)
customer_name (STRING)
order_date (DATE)
product (STRING)
quantity (INTEGER)
price (FLOAT)
complete_address (STRING)

Create an External Stage: Set up an external stage named s3_stage_snowpipe that points to the S3 bucket s3://snowflake-hands-on-data/sample_data_snowpipe/step-1/ using the provided AWS credentials:
AWS Access Key: 888888888888
AWS Secret Key: 888888888888

Create a File Format: Define a CSV file format named csv_format_snowpipe with the following properties:
Type: CSV
Field Delimiter: , (comma)
Skip the first row as header: SKIP_HEADER = 1



TASK 2:-
Setting up Snowpipe for Automatic Data Loading

Step 1: Ensure you are using the demo warehouse for this assignment.
Step 2: Continue using the sales_db_snowpipe database created in the previous assignment.
Step 3: Create a Snowpipe for automatic data loading
Step 4: Describe the Snowpipe configuration
After creating the Snowpipe, describe it to verify the configuration.
Step 5: Check there should be no data in the table
Ensure that the data has not yet been loaded into the table before triggering the pipe.



TASK 3:-
Error Handling in Snowpipe

Continue Using the Demo Warehouse: Ensure you are utilizing the demo warehouse for all operations in this assignment.
Use the Existing Database: Switch to the database created in Assignment 21, which contains the table for loading sales data.
Show Existing Pipes: List all the currently configured Snowpipes to verify the existing setups.
Recreate the Snowpipe with Error Handling: Modify the existing Snowpipe configuration to include error handling options. Set it to continue loading data even when it encounters invalid rows.
Describe the Snowpipe Configuration: Review the settings of the newly created Snowpipe to confirm the configuration changes.
Pause the Snowpipe: Temporarily halt the execution of the Snowpipe. This is useful for maintenance or testing purposes.

Check the Status of the Snowpipe: Monitor the status of the Snowpipe to ensure it is paused and not actively processing any files.


TASK 4:-
Managing Snowpipe Execution

Continue Using the Demo Warehouse: Ensure you are utilizing the demo warehouse for all operations in this assignment.
Use the Existing Database: Switch to the database created in Assignment 21, which contains the sales data table.
Show Existing Pipes: List all currently configured Snowpipes to verify their status.
Resume the Snowpipe: Unpause the previously paused Snowpipe to allow it to continue processing incoming data.
Manually Trigger the Snowpipe: Refresh the Snowpipe to load data from the external stage.
Check the Status of the Snowpipe: Monitor the status of the Snowpipe to ensure it is actively processing data.
Verify Data Load: Query the sales data table to check if new data has been successfully loaded.



TASK 5:-
End-to-End Testing and Cleanup of Snowpipe

Continue Using the Demo Warehouse: Ensure that you are using the demo warehouse for executing all queries in this assignment.
Use the Existing Database: Switch to the database created for Snowpipe, which contains the sales data table.
Recreate the External Stage: Set up an external stage pointing to the S3 bucket that contains the sales data.
S3 Path: s3://snowflake-hands-on-data/sample_data_snowpipe/step-2/
Recreate the Snowpipe with Error Handling: Create or replace the Snowpipe, ensuring it has error handling for invalid rows.
Manually Trigger the Snowpipe: Refresh the Snowpipe to initiate the loading of data from the external stage.
Check the Status of the Snowpipe: Verify the status of the Snowpipe to ensure it is running and processing data.
Verify Data Load: Query the sales data table to confirm that the data has been successfully loaded.
Cleanup Resources: Drop the Snowpipe, stage, table, and database to clean up the environment.








