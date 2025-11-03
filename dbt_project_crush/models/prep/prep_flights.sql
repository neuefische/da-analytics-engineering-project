WITH flights AS (
    SELECT * 
    FROM {{ ref('staging_flights') }}
),
add_features AS (
    SELECT *,
        TO_CHAR(dep_time, 'FM0000')::TIME AS dep_time_formatted,
        TO_CHAR(arr_time, 'FM0000')::TIME AS arr_time_formatted,
        TO_CHAR(sched_dep_time, 'FM0000')::TIME AS sched_dep_time_formatted,
        TO_CHAR(sched_arr_time, 'FM0000')::TIME AS sched_arr_time_formatted,
        (dep_delay * INTERVAL '1 minute') AS dep_delay_interval,
        (distance / 0.621371) AS distance_km
    FROM flights
)
SELECT *
FROM add_features