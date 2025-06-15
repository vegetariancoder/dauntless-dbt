with fixtures as (
    select
        *
    from {{ source('raw','fixtures') }}
)
select
    ROW_NUMBER() OVER (ORDER BY (select null)) AS Fixture_ID,
    Week,
    Day as DayOfWeek,
    Date as MatchDate,
    Time as TimeofMatch,
    Home,
    HomeScore,
    Away,
    AwayScore,
    Attendance as ViewersHeadCount,
    Venue,
    Referee
    {{ add_loaded_at_column() }}
from
    fixtures