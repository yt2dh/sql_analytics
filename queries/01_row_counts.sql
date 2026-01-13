-- Row counts for quick sanity checks
SELECT 'users' AS table_name, COUNT(*) AS n_rows FROM users
UNION ALL
SELECT 'events' AS table_name, COUNT(*) AS n_rows FROM events
UNION ALL
SELECT 'transactions' AS table_name, COUNT(*) AS n_rows FROM transactions;
