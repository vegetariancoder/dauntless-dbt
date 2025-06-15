SELECT
  team,
  SUM(Annual_Salary) AS total_annual_salary,
  AVG(Annual_Salary) AS avg_salary_per_player
FROM {{ref('bronze_player_salaries')}}
GROUP BY team
