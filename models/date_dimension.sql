with cte as (
    select 
    to_timestamp(started_at) as STARTED_AT
    from {{ source('demo', 'bike') }}  
    where try_to_timestamp(started_at) is not null
) select 
    *,
    DATE(started_at) as DATE_STARTED_AT,
    HOUR(started_at) as HOUR_STARTED_AT,
    case when DAYNAME(started_at) in ('Sat', 'Sun') then 'WEEKEND' else 'WEEKDAY' end as DAY_TYPE,
    Month(started_at) as MONTH_STARTED_AT
 from cte
