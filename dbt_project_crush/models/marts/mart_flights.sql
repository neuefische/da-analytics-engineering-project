{{ config(materialized='table') }}
WITH flights AS (
    SELECT *
    FROM {{ ref('prep_flights') }}
),
flights_stats AS (
    SELECT
        flight_date,
        origin,
        dest,
        COUNT(*) AS total_flights,
        AVG(dep_delay) AS avg_dep_delay,
        AVG(arr_delay) AS avg_arr_delay,
        MAX(arr_delay) AS max_arr_delay,
        MIN(arr_delay) AS min_arr_delay,
        SUM(cancelled) AS total_cancelled,
        SUM(diverted) AS total_diverted,
        AVG(air_time_minutes) AS avg_air_time_minutes,
        AVG(distance_miles) AS avg_distance_miles,
        AVG(ROUND(distance_km)) AS avg_distance_km
    FROM flights
    GROUP BY flight_date, origin, dest
)

SELECT *
FROM flights_stats
ORDER BY flight_date