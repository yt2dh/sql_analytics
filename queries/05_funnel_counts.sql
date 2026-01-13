-- Funnel counts by event type (overall)
SELECT event_type, COUNT(*) AS n_events, COUNT(DISTINCT user_id) AS n_users
FROM events
GROUP BY event_type
ORDER BY n_events DESC;
