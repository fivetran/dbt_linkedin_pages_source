[PR #20](https://github.com/fivetran/dbt_linkedin_pages_source/pull/20) includes the following updates:

### Under the Hood - July 2025 Updates

- Updated conditions in `.github/workflows/auto-release.yml`.
- Added `.github/workflows/generate-docs.yml`.
- Added `+docs: show: False` to `integration_tests/dbt_project.yml`.
- Migrated `flags` (e.g., `send_anonymous_usage_stats`, `use_colors`) from `sample.profiles.yml` to `integration_tests/dbt_project.yml`.
- Updated `maintainer_pull_request_template.md` with improved checklist.
- Refreshed README tag block:
  - Standardized Quickstart-compatible badge set
  - Left-aligned and positioned below the H1 title.
- Updated Python image version to `3.10.13` in `pipeline.yml`.
- Added `CI_DATABRICKS_DBT_CATALOG` to:
  - `.buildkite/hooks/pre-command` (as an export)
  - `pipeline.yml` (under the `environment` block, after `CI_DATABRICKS_DBT_TOKEN`)
- Added `certifi==2025.1.31` to `requirements.txt` (if missing).
- Updated `.gitignore` to exclude additional DBT, Python, and system artifacts.

# dbt_linkedin_pages_source version.version

## Documentation
- Corrected references to connectors and connections in the README. ([#19](https://github.com/fivetran/dbt_linkedin_pages_source/pull/19))

# dbt_linkedin_pages_source v0.3.0
[PR #14](https://github.com/fivetran/dbt_linkedin_pages_source/pull/14) includes the following breaking changes:
## 🚨 Breaking Changes 🚨:
- This update is made breaking due to the following changes in the [Linkedin Company Pages Fivetran Connector](https://fivetran.com/docs/applications/linkedin-company-pages). 
    - Deprecated source table `ugc_post_share_content_media`
    - Added source table `post_content` 
    - See the [May 2023 release notes](https://fivetran.com/docs/applications/linkedin-company-pages/changelog#may2023) for full details.
- Removed the following deprecated columns from `stg_linkedin_pages__ugc_post_history`:
    - `deleted_actor`
    - `deleted_timestamp`
    - `specific_content_primary_landing_page_url`
    - `specific_content_share_commentary_attributes`
    - `specific_content_share_commentary_inferred_locale`
    - `specific_content_share_commentary_text`
    - `specific_content_share_media_category`
    - `target_audience_targeted_entities`
    - `version_tag`

## Features:
- Added the following new column to `stg_linkedin_pages__ugc_post_history`:
    - `commentary`
- Added source table `post_content` and staging table `stg_linkedin_pages__post_content`
- Updated documentation with the updated columns.

## Under the Hood:
- Updated seeds to reflect the above changes. 

[PR #12](https://github.com/fivetran/dbt_linkedin_pages_source/pull/12) includes the following updates:
- Incorporated the new `fivetran_utils.drop_schemas_automation` macro into the end of each Buildkite integration test job.
- Updated the pull request [templates](/.github).

# dbt_linkedin_pages_source v0.2.0
## 🚨 Breaking Changes 🚨:
[PR #10](https://github.com/fivetran/dbt_linkedin_pages_source/pull/10) includes the following breaking changes:
- Dispatch update for dbt-utils to dbt-core cross-db macros migration. Specifically `{{ dbt_utils.<macro> }}` have been updated to `{{ dbt.<macro> }}` for the below macros:
    - `any_value`
    - `bool_or`
    - `cast_bool_to_text`
    - `concat`
    - `date_trunc`
    - `dateadd`
    - `datediff`
    - `escape_single_quotes`
    - `except`
    - `hash`
    - `intersect`
    - `last_day`
    - `length`
    - `listagg`
    - `position`
    - `replace`
    - `right`
    - `safe_cast`
    - `split_part`
    - `string_literal`
    - `type_bigint`
    - `type_float`
    - `type_int`
    - `type_numeric`
    - `type_string`
    - `type_timestamp`
    - `array_append`
    - `array_concat`
    - `array_construct`
- For `current_timestamp` and `current_timestamp_in_utc` macros, the dispatch AND the macro names have been updated to the below, respectively:
    - `dbt.current_timestamp_backcompat`
    - `dbt.current_timestamp_in_utc_backcompat`
- `packages.yml` has been updated to reflect new default `fivetran/fivetran_utils` version, previously `[">=0.3.0", "<0.4.0"]` now `[">=0.4.0", "<0.5.0"]`.

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
