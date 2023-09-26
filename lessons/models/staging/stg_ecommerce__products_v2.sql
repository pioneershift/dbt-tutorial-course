with source as (

    select * from {{ source('thelook_ecommerce', 'products') }}

),

renamed as (

    select
        id,
        cost,
        category,
        name,
        retail_price,
        department,
        sku,
        distribution_center_id,
        brand,

    from source

)

select * from renamed