with team_salary as (
    select
        *
    from {{ source('raw','team_salary') }}
)
select
    ROW_NUMBER() OVER (ORDER BY (select null)) AS Team_Salary_ID,
    team,
    players,
    weekly as Weekly_Salary,
    annual as Annual_Salary
    {{ add_loaded_at_column() }}
from
    team_salary