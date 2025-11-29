with bike as (
    select * from {{ source('demo', 'bike') }}
    limit 10
) select * from bike