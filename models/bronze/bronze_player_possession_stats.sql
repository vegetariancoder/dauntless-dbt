with player_possession_stats as (
    select
        *
    from
        {{ source('raw','player_possession_stats') }}
)
select
    ROW_NUMBER() OVER (ORDER BY (select null)) AS Player_Possesion_ID,
    player,
    nation,
    SUBSTRING_INDEX(position, ',', 1) AS main_position,
    SUBSTRING_INDEX(SUBSTRING_INDEX(position, ',', 2), ',', -1) AS secondary_position,
    team,
    age,
    90s,
    touches,
    deffensive_touches,
    middle_touches,
    attacking_touches,
    attempted_take_ons,
    successful_take_ons,
    takeons_tackled,
    carries,
    total_distance_carried,
    received
    {{ add_loaded_at_column() }}
from
    player_possession_stats