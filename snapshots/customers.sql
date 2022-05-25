{% snapshot snapshot_customers %}

{{
    config(
      unique_key='id',
      strategy='timestamp',
      updated_at='updated_at_utc',
    )
}}

select * from {{ source('raw', 'raw_customers') }}

{% endsnapshot %}