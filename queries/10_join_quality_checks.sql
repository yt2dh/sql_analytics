-- Join quality checks: ensure every event user exists in users table
SELECT
  COUNT(*) AS n_events,
  SUM(CASE WHEN u.user_id IS NULL THEN 1 ELSE 0 END) AS n_events_missing_user
FROM events e
LEFT JOIN users u ON e.user_id = u.user_id;
