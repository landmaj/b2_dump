#!/bin/bash

set -e

FILENAME="${DATABASE}_$(date "+%Y-%m-%dT%H:%M:%S").sql"

echo "${HOST}:${PORT}:${DATABASE}:${USER}:${PASSWORD}" > ~/.pgpass
chmod 0600 ~/.pgpass
pg_dump --inserts -w -h "${HOST}" -p "${PORT}" -d "${DATABASE}" -U "${USER}" -f "${FILENAME}"

b2 authorize-account "${API_KEY_ID}" "${API_KEY}"
b2 upload-file --noProgress "${BUCKET}" "${FILENAME}" "${FILENAME}"
