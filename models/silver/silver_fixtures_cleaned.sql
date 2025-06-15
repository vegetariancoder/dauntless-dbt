SELECT
  Fixture_ID,
  Week,
  DayOfWeek,
  MatchDate,
  TimeofMatch,
  Home,
  Away,
  HomeScore,
  AwayScore,
  Venue,
  Referee,
  COALESCE(ViewersHeadCount, 0) AS ViewersHeadCount
FROM {{ref('bronze_fixtures')}}
WHERE MatchDate IS NOT NULL
