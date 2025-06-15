SELECT
  team,
  -- Points calculation is correct as 'result' and 'team' columns are correctly formed after unpivot
  SUM(CASE WHEN result = team THEN 3 WHEN result = 'Draw' THEN 1 ELSE 0 END) AS points,
  COUNT(*) AS games_played,
  -- Corrected total_goals: Use 'role' to determine which score belongs to the 'team'
  SUM(CASE
        WHEN role = 'Home' THEN HomeScore
        WHEN role = 'Away' THEN AwayScore
        ELSE 0 -- Should not happen if unpivot is only on Home and Away
      END) AS total_goals
FROM (
  SELECT Home, Away, HomeScore, AwayScore,
    CASE
      WHEN HomeScore > AwayScore THEN Home
      WHEN AwayScore > HomeScore THEN Away
      ELSE 'Draw'
    END AS result
  FROM {{ref('bronze_fixtures')}}
) all_matches
UNPIVOT (team FOR role IN (Home, Away))
GROUP BY team