# snowflake_proj6_snowpipe
This project demonstrates Snowpipe, Snowflake’s continuous data ingestion service. The exercises cover:
Setting up databases, tables, stages, and file formats for Snowpipe
Configuring Snowpipe for automatic data loading from S3
Managing error handling in Snowpipe
Controlling Snowpipe execution (pause, resume, manual triggers)
Performing end-to-end testing and cleanup

The goal is to learn how Snowpipe enables real-time or near-real-time ingestion of data with minimal manual intervention.

Prerequisites:
Active Snowflake account
Access to Snowflake Web UI or SnowSQL
AWS credentials with access to the specified S3 buckets
Demo warehouse created in Project 1

Tasks Performed:-
Task 1: Setting Up Database, Table, Stage, and File Format
Created a database and table for sales data
Created an external stage pointing to the S3 bucket
Defined a CSV file format for data ingestion

Task 2: Setting Up Snowpipe for Automatic Data Loading
Created a Snowpipe for automatic ingestion from the external stage
Verified the Snowpipe configuration
Ensured that no data existed in the table before triggering the pipe

Task 3: Error Handling in Snowpipe
Listed existing Snowpipes and verified their setup
Modified Snowpipe to include error handling for invalid rows
Paused the Snowpipe for testing and maintenance
Verified the Snowpipe status

Task 4: Managing Snowpipe Execution
Resumed the paused Snowpipe
Manually triggered data loading from the external stage
Verified that data was successfully loaded into the table

Task 5: End-to-End Testing and Cleanup
Recreated the external stage and Snowpipe with error handling
Manually triggered the Snowpipe to load new data
Verified successful data ingestion
Cleaned up all resources (Snowpipe, stage, table, database)

Real-World Relevance:
Snowpipe allows automatic, near-real-time ingestion of cloud-based data
Error handling options ensure that invalid rows do not block data pipelines
Execution management (pause, resume, manual trigger) provides control over automated pipelines
End-to-end testing ensures robust and reliable continuous data ingestion




