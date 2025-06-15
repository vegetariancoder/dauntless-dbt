with team_stats as (
    select
        *
    from {{ source('raw','team_stats') }}
)
select
    ROW_NUMBER() OVER (ORDER BY (select null)) AS Team_Stat_ID,
    team,
    players,
    age,
    possession,
    goals,
    assists,
    penalty_kicks,
    penalty_kick_attempts,
    yellows,
    reds,
    expected_goals,
    expected_assists,
    progressive_carries,
    progressive_passes
    {{ add_loaded_at_column() }}
from
    team_stats