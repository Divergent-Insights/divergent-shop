{% test my_generic_test(model, column_name) %}

with validation as (

    select
        {{ column_name }} as field

    from {{ model }}

),

validation_errors as (

    select
        field

    from validation
    -- if this is true, then this record is invalid
    where field is null

)

select *
from validation_errors

{% endtest %}