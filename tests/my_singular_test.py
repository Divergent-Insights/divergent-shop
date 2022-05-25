-- This is a singular test
-- The simplest way to define a test is by writing the exact SQL that will return failing records
select *
from {{ source('raw', 'raw_orders') }}
where ingest_timestamp_utc 
is null;