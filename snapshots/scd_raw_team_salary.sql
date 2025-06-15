{% snapshot scd_raw_team_salary %}

{{
   config(
       target_schema='Learning',
       unique_key='team',
       strategy='check',
       check_cols=['weekly', 'annual'],
       invalidate_hard_deletes=True
   )
}}

select * FROM {{ source('raw', 'team_salary') }}

{% endsnapshot %}