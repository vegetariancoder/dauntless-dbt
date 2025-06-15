SELECT
  ps.name AS player,
  ps.team,
  sal.Weekly_Salary,
  ps.goals,
  ps.assists,
  ps.minutes,
  ROUND((sal.Weekly_Salary * (ps.goals + ps.assists) / NULLIF(ps.minutes, 0)) * 1000, 2) AS estimated_market_value
FROM {{ref('bronze_player_stats')}} ps
JOIN {{ref('bronze_player_salaries')}} sal ON ps.name = sal.Player AND ps.team = sal.Team
