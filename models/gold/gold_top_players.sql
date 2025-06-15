{{ config(materialized='table') }}

SELECT
  player,
  team,
  goals,
  assists,
  (goals + assists) AS goal_contributions
FROM {{ ref('silver_player_profile') }}
ORDER BY goal_contributions DESC
LIMIT 10
