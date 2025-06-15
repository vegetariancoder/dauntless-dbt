SELECT *
FROM {{ ref('silver_team_standings_profile') }}
WHERE Annual_Salary < 1 AND Annual_Salary > 100000000