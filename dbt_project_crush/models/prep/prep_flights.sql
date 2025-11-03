WITH raw_flights AS (
    SELECT *
    FROM {{ source('flights_data', 'flights_raw') }}
),
cleaned_flights AS (
    SELECT
        flight_date::DATE AS flight_date,
        origin AS origin,
        dest AS dest,
        dep_time,                  
        arr_time,                  
        sched_dep_time,            
        sched_arr_time,            
        dep_delay AS dep_delay,
        arr_delay AS arr_delay,
        cancelled::INTEGER AS cancelled,
        diverted::INTEGER AS diverted,
        distance AS distance_miles,
        (distance / 0.621371)::NUMERIC AS distance_km,  -- convert miles → km
        air_time AS air_time_minutes
    FROM raw_flights
    WHERE flight_date IS NOT NULL
)

SELECT *
FROM cleaned_flights