SELECT
  player,
  team,
  attempted_take_ons,
  successful_take_ons,
  ROUND(100.0 * successful_take_ons / NULLIF(attempted_take_ons, 0), 2) AS takeon_success_rate
FROM {{ref('bronze_player_possession_stats')}}
WHERE attempted_take_ons > 0
ORDER BY takeon_success_rate DESC
