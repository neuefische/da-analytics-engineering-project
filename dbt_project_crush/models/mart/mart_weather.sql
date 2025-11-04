WITH weather AS (
    SELECT *
    FROM {{ ref('prep_weather') }}
),
weather_by_station_date AS (
    SELECT 
        airport_code
        , date
        , weekday
        , avg(pressure_hpa) AS avg_pressure_hpa
        , avg(wind_direction) AS avg_wind_direction
        , avg(wind_speed_kmh) AS avg_wind_speed_kmh
        , max(wind_speed_kmh) AS max_wind_speed_kmh
        , avg(temp_c) AS avg_temp_c
        , max(temp_c) AS max_temp_c
    FROM weather
    GROUP BY date, airport_code, weekday
    ORDER BY airport_code, date
),
beaufort_calc AS (
    SELECT 
        *
        , CASE 
            WHEN max_wind_speed_kmh BETWEEN 0 AND 1.9 THEN 0
            WHEN max_wind_speed_kmh BETWEEN 2 AND 5.9 THEN 1
            WHEN max_wind_speed_kmh BETWEEN 6 AND 11.9 THEN 2
            WHEN max_wind_speed_kmh BETWEEN 12 AND 19.9 THEN 3
            WHEN max_wind_speed_kmh BETWEEN 20 AND 28.9 THEN 4
            WHEN max_wind_speed_kmh BETWEEN 29 AND 38.9 THEN 5
            WHEN max_wind_speed_kmh BETWEEN 39 AND 49.9 THEN 6
            WHEN max_wind_speed_kmh BETWEEN 50 AND 61.9 THEN 7
            WHEN max_wind_speed_kmh BETWEEN 62 AND 74.9 THEN 8
            WHEN max_wind_speed_kmh BETWEEN 75 AND 88.9 THEN 9
            WHEN max_wind_speed_kmh BETWEEN 89 AND 102.9 THEN 10
            WHEN max_wind_speed_kmh BETWEEN 103 AND 117.9 THEN 11
            WHEN max_wind_speed_kmh >= 118 THEN 12
        END AS beaufort_scale
        ,  CASE 
            WHEN max_wind_speed_kmh BETWEEN 0 AND 1.9 THEN 'Calm'
            WHEN max_wind_speed_kmh BETWEEN 2 AND 5.9 THEN 'Light Air'
            WHEN max_wind_speed_kmh BETWEEN 6 AND 11.9 THEN 'Light Breeze'
            WHEN max_wind_speed_kmh BETWEEN 12 AND 19.9 THEN 'Gentle Breeze'
            WHEN max_wind_speed_kmh BETWEEN 20 AND 28.9 THEN 'Moderate Breeze'
            WHEN max_wind_speed_kmh BETWEEN 29 AND 38.9 THEN 'Fresh Breeze'
            WHEN max_wind_speed_kmh BETWEEN 39 AND 49.9 THEN 'Strong Breeze'
            WHEN max_wind_speed_kmh BETWEEN 50 AND 61.9 THEN 'Near Gale'
            WHEN max_wind_speed_kmh BETWEEN 62 AND 74.9 THEN 'Gale'
            WHEN max_wind_speed_kmh BETWEEN 75 AND 88.9 THEN 'Severe Gale'
            WHEN max_wind_speed_kmh BETWEEN 89 AND 102.9 THEN 'Storm'
            WHEN max_wind_speed_kmh BETWEEN 103 AND 117.9 THEN 'Violent Storm'
            WHEN max_wind_speed_kmh >= 118 THEN 'Hurricane'
        END AS beaufort_description
    FROM weather_by_station_date
)
SELECT *
FROM beaufort_calc