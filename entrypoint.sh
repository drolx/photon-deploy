#!/bin/bash

# Configuration
DATA_DIR="/photon"
INDEX_DIR="$DATA_DIR/photon_data/elasticsearch"
UPDATE_INTERVAL="${UPDATE_INTERVAL:-24h}"
LOG_LEVEL="${LOG_LEVEL:-INFO}"

# Download elasticsearch index
if [ ! -d "$INDEX_DIR" ]; then
  echo "importing search index from nominatim"

  java -jar photon.jar -nominatim-import -host "$NOMINATIM_HOST" -port 5432 -database nominatim -user "$NOMINATIM_USER" -password "$NOMINATIM_PASSWORD"
fi

# Start photon if elastic index exists
if [ -d "$INDEX_DIR" ]; then
  echo "Start photon"
  java -jar photon.jar "$@"
else
  echo "Could not start photon, the search index could not be found"
fi
