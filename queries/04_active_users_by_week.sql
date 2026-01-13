-- Weekly active users (WAU): users with any event in the week
SELECT
  DATE_TRUNC('week', CAST(event_ts AS TIMESTAMP)) AS week_start,
  COUNT(DISTINCT user_id) AS weekly_active_users
FROM events
GROUP BY 1
ORDER BY 1;
