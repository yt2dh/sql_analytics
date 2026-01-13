# SQL Analytics Project (DuckDB)

A small, runnable SQL portfolio project showing practical data extraction and analytics patterns (joins, aggregations, cohorts, funnels).   
Designed to demonstrate how SQL is used to pull and validate data before downstream analysis in Python.

## What this demonstrates
- Clean, readable SQL (CTEs, joins, group-bys; light use of window functions)
- Data validation checks (join completeness, sanity counts)
- Common analytics patterns (funnels, ARPU, cohort retention)
- Reproducible local execution (DuckDB, no server needed)

## Project Structure

```text
sql-analytics-mini/
├── data/                 # Small synthetic dataset (CSV)
│   ├── users.csv
│   ├── events.csv
│   └── transactions.csv
├── queries/              # Standalone SQL queries (numbered)
│   ├── 01_row_counts.sql
│   ├── 02_basic_preview.sql
│   ├── 03_daily_signups.sql
│   ├── 04_active_users_by_week.sql
│   ├── 05_funnel_counts.sql
│   ├── 06_conversion_rate_by_segment.sql
│   ├── 07_avg_revenue_per_user.sql
│   ├── 08_top_users_by_revenue.sql
│   ├── 09_retention_cohorts.sql
│   ├── 10_join_quality_checks.sql
│   ├── 11_device_mix_by_country.sql
│   └── 12_time_to_first_purchase.sql
├── run_duckdb.sh         # One-command runner (macOS/Linux)
├── requirements.txt      # Optional: install duckdb python package
└── README.md
```

## Quickstart (Local)

### Option A: DuckDB CLI
1) Install DuckDB: https://duckdb.org/docs/installation/
2) Run:

```bash
./run_duckdb.sh
```

This loads the CSVs into an in-memory DuckDB database and runs the queries.

### Option B: Python (no DuckDB CLI needed)
```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
python run_sql.py
```

## Notes
- The dataset is synthetic (generated for portfolio use).
- Queries are standard SQL.
