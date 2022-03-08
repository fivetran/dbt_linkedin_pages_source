
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

        {{ fivetran_utils.source_relation(
            union_schema_variable='linkedin_pages_union_schemas', 
            union_database_variable='linkedin_pages_union_databases') 
        }}
        
    from base
),

final as (
    
    select 
        _fivetran_synced,
        organization_id,
        split_part(ugc_post_id, ':', -1) as ugc_post_id,
        source_relation
    from fields
)

select * from final
