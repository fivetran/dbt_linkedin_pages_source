{% macro get_ugc_post_share_statistic_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "share_statistic_id", "datatype": dbt_utils.type_string()},
    {"name": "ugc_post_id", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
