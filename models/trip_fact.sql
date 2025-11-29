with bike as (
    select 
    ride_id,
    -- RIDEABLE_TYPE,
    date(to_timestamp(started_at)) AS TRIP_DATE,
    start_station_id AS START_STATION_ID,
    END_STATION_ID,
    member_casual,
    TIMESTAMPDIFF('SECONDS',to_timestamp(started_at), to_timestamp(ENDED_AT)) AS TRIP_DURATION
     from {{ ref("stage_bike") }}
) select * from bike