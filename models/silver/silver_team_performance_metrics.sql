SELECT
  team,
  goals,
  assists,
  expected_goals,
  possession,
  (progressive_passes / players) AS avg_progressive_passes_per_player
FROM {{ref('bronze_team_stats')}}
