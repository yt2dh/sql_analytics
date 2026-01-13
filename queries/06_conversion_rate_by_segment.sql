-- Purchase conversion rate by segment: users with at least one purchase / total users
WITH purchasers AS (
  SELECT DISTINCT user_id
  FROM transactions
)
SELECT
  u.segment,
  COUNT(*) AS n_users,
  SUM(CASE WHEN p.user_id IS NOT NULL THEN 1 ELSE 0 END) AS n_purchasers,
  ROUND(1.0 * SUM(CASE WHEN p.user_id IS NOT NULL THEN 1 ELSE 0 END) / COUNT(*), 4) AS purchase_rate
FROM users u
LEFT JOIN purchasers p
  ON u.user_id = p.user_id
GROUP BY u.segment
ORDER BY purchase_rate DESC;
