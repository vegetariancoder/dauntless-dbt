SELECT *
FROM {{ ref('silver_team_standings_profile') }}
WHERE team IS NULL OR goals IS NULL OR Annual_Salary IS NULL
