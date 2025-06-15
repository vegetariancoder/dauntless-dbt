{{ config(materialized='incremental') }}

SELECT
  ts.team,
  ts.players,
  ts.age AS avg_age,
  ts.possession,
  ts.goals,
  ts.assists,
  ts.penalty_kicks,
  ts.penalty_kick_attempts,
  ts.yellows,
  ts.reds,
  ts.expected_goals,
  ts.expected_assists,
  ts.progressive_carries,
  ts.progressive_passes,
  sal.Weekly_Salary,
  sal.Annual_Salary,
  ROUND(sal.Annual_Salary / NULLIF(ts.goals, 0), 2) AS cost_per_goal,
  ROUND(sal.Annual_Salary / NULLIF(ts.assists, 0), 2) AS cost_per_assist
FROM {{ ref('bronze_team_stats') }} ts
LEFT JOIN {{ ref('bronze_team_salary') }} sal
  ON ts.team = sal.team
