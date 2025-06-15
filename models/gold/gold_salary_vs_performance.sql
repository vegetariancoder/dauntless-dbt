SELECT
  ps.name AS player,
  ps.team,
  sal.Annual_Salary,
  ps.goals,
  ps.assists,
  (ps.goals + ps.assists) AS contributions,
  ROUND(sal.Annual_Salary / NULLIF(ps.goals + ps.assists, 0), 2) AS cost_per_contribution
FROM {{ref('bronze_player_stats')}} ps
JOIN {{ref('bronze_player_salaries')}} sal ON ps.name = sal.Player AND ps.team = sal.Team
WHERE ps.goals + ps.assists > 0
