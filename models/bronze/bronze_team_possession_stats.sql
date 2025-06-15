with team_possession_stats as (
    select
        *
    from {{ source('raw','team_possession_stats') }}
)
select
    ROW_NUMBER() OVER (ORDER BY (select null)) AS Team_Possession_ID,
    team,
    possession,
    touches,
    deffensive_touches,
    middle_touches,
    attacking_touches,
    attempted_take_ons,
    successful_take_ons,
    carries,
    total_distance_carried
    {{ add_loaded_at_column() }}
from
    team_possession_stats