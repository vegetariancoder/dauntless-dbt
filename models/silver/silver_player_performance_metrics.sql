SELECT
  name AS player,
  team,
  (goals * 90.0 / minutes) AS goals_per_90,
  (assists * 90.0 / minutes) AS assists_per_90,
  (expected_goals * 90.0 / minutes) AS xg_per_90,
  yellow,
  red
FROM {{ref('bronze_player_stats')}}
WHERE minutes > 0
