{% snapshot scd_raw_player_salaries %}

{{
   config(
       target_schema='Learning',
       unique_key='Player',
       strategy='check',
       check_cols=['Weekly', 'Annual'],
       invalidate_hard_deletes=True
   )
}}

select * FROM {{ source('raw', 'player_salaries') }}

{% endsnapshot %}