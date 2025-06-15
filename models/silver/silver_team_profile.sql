SELECT
  ts.team,
  ts.players,
  ts.age,
  ts.possession,
  ts.goals,
  ts.assists,
  ts.expected_goals,
  ts.expected_assists,
  tp.touches,
  tp.successful_take_ons,
  ts.progressive_passes,
  sal.Weekly_Salary,
  sal.Annual_Salary
FROM {{ref('bronze_team_stats')}} ts
LEFT JOIN {{ref('bronze_team_possession_stats')}} tp ON ts.team = tp.team
LEFT JOIN {{ref('bronze_team_salary')}} sal ON ts.team = sal.team
