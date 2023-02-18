#!/bin/bash
set -e

pg_restore --no-owner --role="$POSTGRES_USER" -d "$POSTGRES_DB" /sql/SCHEMA.sql
psql -d "$POSTGRES_DB" -U "$POSTGRES_USER" -f /sql/FestaDefaults.sql
psql -d "$POSTGRES_DB" -U "$POSTGRES_USER" -f /sql/NetcafeDefaults.sql
psql -d "$POSTGRES_DB" -U "$POSTGRES_USER" -f /sql/RoadShopItems.sql