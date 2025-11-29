WITH CTE AS (
    SELECT * FROM {{ ref("trip_fact") }} t
    left join {{ ref("daily_weather") }} w
    on
    t.TRIP_DATE = w.weather_day
    limit 10
)

select * from CTE