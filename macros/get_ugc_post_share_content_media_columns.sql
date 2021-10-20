{% macro get_ugc_post_share_content_media_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "description_attributes", "datatype": dbt_utils.type_string()},
    {"name": "description_inferred_locale", "datatype": dbt_utils.type_string()},
    {"name": "description_text", "datatype": dbt_utils.type_string()},
    {"name": "landing_page_title", "datatype": dbt_utils.type_string()},
    {"name": "landing_page_url", "datatype": dbt_utils.type_string()},
    {"name": "last_modified_time", "datatype": dbt_utils.type_timestamp()},
    {"name": "media", "datatype": dbt_utils.type_string()},
    {"name": "original_url", "datatype": dbt_utils.type_string()},
    {"name": "status", "datatype": dbt_utils.type_string()},
    {"name": "thumbnails", "datatype": dbt_utils.type_string()},
    {"name": "title_attributes", "datatype": dbt_utils.type_string()},
    {"name": "title_inferred_locale", "datatype": dbt_utils.type_string()},
    {"name": "title_text", "datatype": dbt_utils.type_string()},
    {"name": "ugc_post_id", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
