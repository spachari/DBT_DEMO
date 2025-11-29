with cte as (
    select 
    to_timestamp(started_at) as STARTED_AT
    from {{ ref("stage_bike") }}  
    where try_to_timestamp(started_at) is not null
) select 
    *,
    DATE(started_at) as DATE_STARTED_AT,
    HOUR(started_at) as HOUR_STARTED_AT,
    {{ get_season('started_at') }} as SEASON_OF_YEAR,
    Month(started_at) as MONTH_STARTED_AT,
    {{ get_day_type('started_at') }} as DAY_TYPE


 from cte
