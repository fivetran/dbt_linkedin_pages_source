# dbt_linkedin_pages_source v0.1.1
## 🐞 Bugfix 🐞
Previously, Redshift threw the error "constant expressions are not supported in partition by clauses" for the model `int_linkedin_pages__latest_post_history`. 

To resolve this, linkedin_pages_source models will be materialized as tables rather than views in `dbt_project.yml`. ([#4](https://github.com/fivetran/dbt_linkedin_pages_source/issues/4))

# dbt_linkedin_pages_source v0.1.0

The original release! This package contains staging models, designed to work simultaneously with our [LinkedIn Pages modeling package](https://github.com/fivetran/dbt_linkedin_pages) and our [Social Media Reporting package](https://github.com/fivetran/dbt_social_media_reporting). The staging models name columns consistently across all packages:
 * Boolean fields are prefixed with `is_` or `has_`
 * Timestamps are appended with `_timestamp`
 * ID primary keys are prefixed with the name of the table. For example, the organization table's ID column is renamed `organization_id`.