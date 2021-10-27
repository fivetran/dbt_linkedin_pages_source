
with base as (

    select * 
    from {{ ref('stg_linkedin_pages__ugc_post_share_media_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_linkedin_pages__ugc_post_share_media_tmp')),
                staging_columns=get_ugc_post_share_content_media_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
        _fivetran_synced,
        description_attributes,
        description_inferred_locale,
        description_text,
        landing_page_title,
        landing_page_url,
        last_modified_time as last_modified_timestamp,
        media,
        original_url,
        status,
        thumbnails,
        title_attributes,
        title_inferred_locale,
        title_text,
        ugc_post_id
    from fields
)

select * from final
