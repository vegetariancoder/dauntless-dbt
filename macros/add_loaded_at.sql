-- macros/add_loaded_at.sql
{% macro add_loaded_at_column() %}
    , {{ dbt.current_timestamp() }} as loaded_at_utc
{% endmacro %}