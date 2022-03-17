# dbt_linkedin_pages_source v0.1.2
## 🐞 Bugfix 🐞
- Modified the `ugc_post_id` parsing logic within `stg_linkedin_pages__organization_ugc_post` to dynamically parse the correct `ugc_post_id`. Previously, only posts of the `share` type where being parsed correctly. This will now work for both `share` and `ugcpost` types ([#6](https://github.com/fivetran/dbt_linkedin_pages_source/issues/6))

## Contributors
- @bthomson22 ([#7](https://github.com/fivetran/dbt_linkedin_pages_source/pull/7)) 

# dbt_linkedin_pages_source v0.1.1
## 🐞 Bugfix 🐞
Previously, Redshift threw the error "constant expressions are not supported in partition by clauses" for the model `int_linkedin_pages__latest_post_history`. 

To resolve this, linkedin_pages_source models will be materialized as tables rather than views in `dbt_project.yml`. ([#4](https://github.com/fivetran/dbt_linkedin_pages_source/issues/4))

# dbt_linkedin_pages_source v0.1.0

The original release! This package contains staging models, designed to work simultaneously with our [LinkedIn Pages modeling package](https://github.com/fivetran/dbt_linkedin_pages) and our [Social Media Reporting package](https://github.com/fivetran/dbt_social_media_reporting). The staging models name columns consistently across all packages:
 * Boolean fields are prefixed with `is_` or `has_`
 * Timestamps are appended with `_timestamp`
 * ID primary keys are prefixed with the name of the table. For example, the organization table's ID column is renamed `organization_id`.