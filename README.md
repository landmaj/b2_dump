Backup Postgres to Backblaze
----------------------------

Simple Docker image meant for creating Postgres backups in Kubernetes
and uploading them to Backblaze.

Expected environmental variables:

#### POSTGRES
 - HOST
 - PORT
 - USER
 - PASSWORD
 - DATABASE

#### BACKBLAZE
 - API_KEY_ID
 - API_KEY
 - BUCKET
