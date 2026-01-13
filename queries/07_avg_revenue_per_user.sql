-- ARPU by segment (average revenue per user)
WITH revenue AS (
  SELECT user_id, SUM(amount_usd) AS user_revenue
  FROM transactions
  GROUP BY user_id
)
SELECT
  u.segment,
  COUNT(*) AS n_users,
  ROUND(AVG(COALESCE(r.user_revenue, 0)), 2) AS arpu_usd,
  ROUND(SUM(COALESCE(r.user_revenue, 0)) / COUNT(*), 2) AS arpu_usd_alt
FROM users u
LEFT JOIN revenue r ON u.user_id = r.user_id
GROUP BY u.segment
ORDER BY arpu_usd DESC;
