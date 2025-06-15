SELECT *,
  CASE
    WHEN HomeScore > AwayScore THEN Home
    WHEN HomeScore < AwayScore THEN Away
    ELSE 'Draw'
  END AS Result
FROM {{ref('silver_fixtures_cleaned')}}
