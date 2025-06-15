{% snapshot scd_raw_standings %}

{{
   config(
       target_schema='Learning',
       unique_key='rank',
       strategy='check',
       check_cols=['rank', 'top_scorer'],
       invalidate_hard_deletes=True
   )
}}

select * FROM {{ source('raw', 'standings') }}

{% endsnapshot %}