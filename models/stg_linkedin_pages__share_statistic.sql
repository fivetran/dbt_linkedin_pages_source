
with base as (

    select * 
    from {{ ref('stg_linkedin_pages__share_statistic_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_linkedin_pages__share_statistic_tmp')),
                staging_columns=get_share_statistic_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
        _fivetran_id as share_statistic_id,
        _fivetran_synced,
        _organization_entity_urn as organization_entity_urn,
        _share_entity_urn as share_entity_urn,
        click_count,
        comment_count,
        engagement,
        impression_count,
        like_count,
        share_count
    from fields
)

select * from final
