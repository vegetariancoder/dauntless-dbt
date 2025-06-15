SELECT
  ps.name AS player,
  ps.nation,
  ps.main_position,
  ps.secondary_position,
  ps.team,
  ps.age,
  ps.played,
  ps.starts,
  ps.minutes,
  ps.goals,
  ps.assists,
  pp.touches,
  pp.carries,
  pp.successful_take_ons,
  ps.expected_goals,
  sal.Weekly_Salary,
  sal.Annual_Salary
FROM {{ ref('bronze_player_stats') }} ps
LEFT JOIN {{ ref('bronze_player_possession_stats') }} pp ON ps.name = pp.player AND ps.team = pp.team
LEFT JOIN {{ ref('bronze_player_salaries') }} sal ON ps.name = sal.Player AND ps.team = sal.Team
