-- Device mix by country
SELECT
  country,
  device,
  COUNT(*) AS n_users,
  ROUND(1.0 * COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY country), 4) AS share_within_country
FROM users
GROUP BY country, device
ORDER BY country, n_users DESC;
