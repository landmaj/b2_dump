#!/bin/bash

set -e

echo "${HOST}:${PORT}:${DATABASE}:${USER}:${PASSWORD}" > ~/.pgpass
chmod 0600 ~/.pgpass
pg_dump --inserts -w -h "${HOST}" -p "${PORT}" -d "${DATABASE}" -U "${USER}" -f "${BACKUP_NAME}"

b2 authorize-account "${API_KEY_ID}" "${API_KEY}"
b2 upload-file --noProgress "${BUCKET}" "${BACKUP_NAME}" "${BACKUP_NAME}"
