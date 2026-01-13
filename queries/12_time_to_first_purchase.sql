-- Time to first purchase (days) for purchasers
WITH first_purchase AS (
  SELECT user_id, MIN(CAST(txn_ts AS TIMESTAMP)) AS first_purchase_ts
  FROM transactions
  GROUP BY user_id
),
u AS (
  SELECT user_id, CAST(signup_date AS DATE) AS signup_date
  FROM users
)
SELECT
  u.user_id,
  u.signup_date,
  fp.first_purchase_ts,
  DATE_DIFF('day', u.signup_date, CAST(fp.first_purchase_ts AS DATE)) AS days_to_first_purchase
FROM u
JOIN first_purchase fp ON u.user_id = fp.user_id
ORDER BY days_to_first_purchase ASC
LIMIT 25;
