-- Top users by revenue (useful for tail diagnostics)
SELECT
  user_id,
  SUM(amount_usd) AS total_revenue_usd,
  COUNT(*) AS n_txns
FROM transactions
GROUP BY user_id
ORDER BY total_revenue_usd DESC
LIMIT 10;
