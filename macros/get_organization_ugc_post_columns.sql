{% macro get_organization_ugc_post_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "organization_id", "datatype": dbt_utils.type_int()},
    {"name": "ugc_post_id", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
