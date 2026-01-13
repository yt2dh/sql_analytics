-- Daily signups over time
SELECT signup_date, COUNT(*) AS signups
FROM users
GROUP BY signup_date
ORDER BY signup_date;
