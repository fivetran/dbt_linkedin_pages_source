
with base as (

    select * 
    from {{ ref('stg_linkedin_pages__organization_ugc_post_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_linkedin_pages__organization_ugc_post_tmp')),
                staging_columns=get_organization_ugc_post_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
        _fivetran_synced,
        organization_id,
        replace(ugc_post_id, 'urn:li:share:', '') as ugc_post_id
    from fields
)

select * from final
