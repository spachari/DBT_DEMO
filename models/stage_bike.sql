with cte as (
    select 
    ride_id,
    replace(started_at,'"','') as started_at,
    replace(ended_at,'"','') as ended_at,
    replace(start_station_name,'"','') as start_station_name,
    start_station_id,
    replace(end_station_name,'"','') as end_station_name,
    end_station_id,
    start_lat,
    start_lng,
    end_lat,
    end_lng,
    replace(member_casual,'"','') as member_casual
    from {{ source("demo", "bike") }}
    where ride_id not in ('"bikeid"', 'bikeid')
    limit 10
)
select * from cte