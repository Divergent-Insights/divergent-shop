{{
    config(
        materialized='incremental'
    )
}}

with source as (

    select * from {{ source('raw', 'raw_customers') }}

),

renamed as (

    select
        id as customer_id,
        first_name,
        last_name,
        ingest_timestamp_utc

    from source

)

select * from renamed

{% if is_incremental() %}

    -- this filter will only be applied on an incremental run
    where customer_id > (select max(customer_id) from {{ this }})

{% endif %}
