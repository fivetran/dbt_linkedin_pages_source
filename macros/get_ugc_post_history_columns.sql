{% macro get_ugc_post_history_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "author", "datatype": dbt_utils.type_string()},
    {"name": "client_application", "datatype": dbt_utils.type_string()},
    {"name": "container_entity", "datatype": dbt_utils.type_string()},
    {"name": "content_certification_record", "datatype": dbt_utils.type_string()},
    {"name": "created_actor", "datatype": dbt_utils.type_string()},
    {"name": "created_time", "datatype": dbt_utils.type_timestamp()},
    {"name": "deleted_actor", "datatype": dbt_utils.type_string()},
    {"name": "deleted_time", "datatype": dbt_utils.type_timestamp()},
    {"name": "distribution_distributed_via_follow_feed", "datatype": "boolean"},
    {"name": "distribution_external_distribution_channels", "datatype": dbt_utils.type_string()},
    {"name": "distribution_feed_distribution", "datatype": dbt_utils.type_string()},
    {"name": "first_published_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "id", "datatype": dbt_utils.type_string()},
    {"name": "last_modified_actor", "datatype": dbt_utils.type_string()},
    {"name": "last_modified_time", "datatype": dbt_utils.type_timestamp()},
    {"name": "lifecycle_state", "datatype": dbt_utils.type_string()},
    {"name": "response_context_parent", "datatype": dbt_utils.type_string()},
    {"name": "response_context_root", "datatype": dbt_utils.type_string()},
    {"name": "specific_content_primary_landing_page_url", "datatype": dbt_utils.type_string()},
    {"name": "specific_content_share_commentary_attributes", "datatype": dbt_utils.type_string()},
    {"name": "specific_content_share_commentary_inferred_locale", "datatype": dbt_utils.type_string()},
    {"name": "specific_content_share_commentary_text", "datatype": dbt_utils.type_string()},
    {"name": "specific_content_share_media_category", "datatype": dbt_utils.type_string()},
    {"name": "target_audience_targeted_entities", "datatype": dbt_utils.type_string()},
    {"name": "version_tag", "datatype": dbt_utils.type_string()},
    {"name": "visibility", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
