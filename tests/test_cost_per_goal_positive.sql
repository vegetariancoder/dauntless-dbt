SELECT *
FROM {{ ref('silver_team_standings_profile') }}
WHERE cost_per_goal < 0
