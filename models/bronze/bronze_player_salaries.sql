with player_salaries as (
    select
        *
    from
        {{ source('raw','player_salaries') }}
)
select
    ROW_NUMBER() OVER (ORDER BY (select null)) AS Salary_ID,
    Player,
    Nation,
    SUBSTRING_INDEX(Position, ',', 1) AS main_position,
    SUBSTRING_INDEX(SUBSTRING_INDEX(Position, ',', 2), ',', -1) AS secondary_position,
    Team,
    Age,
    Weekly as Weekly_Salary,
    Annual as Annual_Salary
    {{ add_loaded_at_column() }}
from
    player_salaries