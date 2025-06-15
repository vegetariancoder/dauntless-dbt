with player_stats as (
    select
        *
    from
        {{ source('raw','player_stats') }}
)
select
    ROW_NUMBER() OVER (ORDER BY (select null)) AS Stat_ID,
    name,
    nation,
    SUBSTRING_INDEX(position, ',', 1) AS main_position,
    SUBSTRING_INDEX(SUBSTRING_INDEX(position, ',', 2), ',', -1) AS secondary_position,
    team,
    age,
    born,
    played,
    starts,
    minutes,
    goals,
    assists,
    penalty_kicks,
    penalty_kick_attempts,
    yellow,
    red,
    expected_goals,
    progressive_carries,
    progressive_passes,
    received_progressive_passes
    {{ add_loaded_at_column() }}
from
    player_stats