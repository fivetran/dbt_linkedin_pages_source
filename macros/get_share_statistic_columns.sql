{% macro get_share_statistic_columns() %}

{% set columns = [
    {"name": "_fivetran_id", "datatype": dbt_utils.type_string()},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "_organization_entity_urn", "datatype": dbt_utils.type_string()},
    {"name": "_share_entity_urn", "datatype": dbt_utils.type_string()},
    {"name": "click_count", "datatype": dbt_utils.type_int()},
    {"name": "comment_count", "datatype": dbt_utils.type_int()},
    {"name": "engagement", "datatype": dbt_utils.type_float()},
    {"name": "impression_count", "datatype": dbt_utils.type_int()},
    {"name": "like_count", "datatype": dbt_utils.type_int()},
    {"name": "share_count", "datatype": dbt_utils.type_int()}
] %}

{{ return(columns) }}

{% endmacro %}
