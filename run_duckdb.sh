#!/usr/bin/env bash
set -euo pipefail

# Run all queries using DuckDB CLI.
# Requires: duckdb installed and available on PATH.

DUCKDB_CMD="${DUCKDB_CMD:-duckdb}"

$DUCKDB_CMD <<'SQL'
-- Load CSVs as views (DuckDB auto-detects schema)
CREATE OR REPLACE VIEW users AS
  SELECT * FROM read_csv_auto('data/users.csv');

CREATE OR REPLACE VIEW events AS
  SELECT * FROM read_csv_auto('data/events.csv');

CREATE OR REPLACE VIEW transactions AS
  SELECT * FROM read_csv_auto('data/transactions.csv');

-- Run queries
.read queries/01_row_counts.sql
.read queries/03_daily_signups.sql
.read queries/04_active_users_by_week.sql
.read queries/05_funnel_counts.sql
.read queries/06_conversion_rate_by_segment.sql
.read queries/07_avg_revenue_per_user.sql
.read queries/09_retention_cohorts.sql
.read queries/10_join_quality_checks.sql
.read queries/12_time_to_first_purchase.sql
SQL
