-- Simple cohort retention: share of users with an event in week k after signup week
WITH u AS (
  SELECT
    user_id,
    DATE_TRUNC('week', CAST(signup_date AS DATE)) AS signup_week
  FROM users
),
e AS (
  SELECT
    user_id,
    DATE_TRUNC('week', CAST(event_ts AS TIMESTAMP)) AS event_week
  FROM events
),
joined AS (
  SELECT
    u.user_id,
    u.signup_week,
    e.event_week,
    DATE_DIFF('week', u.signup_week, e.event_week) AS weeks_since_signup
  FROM u
  JOIN e ON u.user_id = e.user_id
  WHERE DATE_DIFF('week', u.signup_week, e.event_week) BETWEEN 0 AND 8
),
cohort_sizes AS (
  SELECT signup_week, COUNT(*) AS cohort_size
  FROM u
  GROUP BY signup_week
)
SELECT
  j.signup_week,
  j.weeks_since_signup,
  COUNT(DISTINCT j.user_id) AS active_users,
  cs.cohort_size,
  ROUND(1.0 * COUNT(DISTINCT j.user_id) / cs.cohort_size, 4) AS retention_rate
FROM joined j
JOIN cohort_sizes cs ON j.signup_week = cs.signup_week
GROUP BY j.signup_week, j.weeks_since_signup, cs.cohort_size
ORDER BY j.signup_week, j.weeks_since_signup;
