with standings as (
    select
        *
    from {{ source('raw','standings') }}
)
select
    ROW_NUMBER() OVER (ORDER BY (select null)) AS Standing_ID,
    rank,
    team,
    win,
    loss,
    draw,
    goals,
    conceded,
    points,
    last5,
    top_scorer,
    keeper
    {{ add_loaded_at_column() }}
from
    standings