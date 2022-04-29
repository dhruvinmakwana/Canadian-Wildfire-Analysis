@ECHO OFF
::#extract
ECHO =================================================================================
ECHO ^| Extracting data from MongoDb database server....                              ^|
ECHO =================================================================================
mongoexport --db wildfiredataset --collection pointdata --type=csv --fieldFile fields.txt --out pointdata.csv  
ECHO =================================================================================
ECHO ^|Extraction Complete                                                            ^|
ECHO =================================================================================
echo:
ECHO =================================================================================
ECHO ^|Uploading extracted data to google cloud storage bucket...                     ^|
ECHO =================================================================================
call gsutil cp pointdata.csv  gs://wildfiredataset
ECHO =================================================================================
ECHO ^|Upload complete.                                                               ^|
ECHO =================================================================================
::#transform
echo:
ECHO =================================================================================
ECHO ^|Loading data from google cloud bucket to interim bigtable for preprocessing... ^|
ECHO =============================================================================
call bq --location=US load  --source_format=CSV --skip_leading_rows=1 wildfire_Data.interem_pointsdata  gs://wildfiredataset/pointdata.csv ./schema.json
ECHO =================================================================================
ECHO ^|Interim data load complete.                                                    ^|
ECHO =================================================================================
echo:
ECHO =================================================================================
ECHO ^|Performing data cleaning operations in google Big Query...                     ^|
ECHO =================================================================================
call bq query --nouse_legacy_sql < cleaningIntrim.sql
call bq query --nouse_legacy_sql < removeDupsIntrim.sql
ECHO =================================================================================
ECHO ^|Data cleaning complete.                                                        ^|
::#load
echo:
ECHO =================================================================================
ECHO ^|Loading cleaned data to main bigquery table.                                   ^|
ECHO =================================================================================
call bq query --nouse_legacy_sql < load.sql
call bq query --nouse_legacy_sql < cleaning.sql
call bq query --nouse_legacy_sql < removeDups.sql
ECHO =================================================================================
ECHO ^|Data load completed successfully                                               ^|
ECHO =================================================================================
