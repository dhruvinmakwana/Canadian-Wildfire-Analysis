#extract
mongoexport --db wildfiredataset --collection pointdata --type=csv --fieldFile fields.txt --out pointdata.csv  
gsutil cp pointdata.csv  gs://wildfiredataset
#transform
bq --location=US load  --source_format=CSV  wildfire_Data.interem_pointsdata --skip_leading_rows=1 gs://wildfiredataset/pointdata.csv ./schema.json
bq query --nouse_legacy_sql < cleaning.sql
bq query --nouse_legacy_sql < removeDups.sql
#load
bq query --nouse_legacy_sql < load.sql
