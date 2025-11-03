{{ config(materialized='table') }}
WITH daily_data AS (
        SELECT * 
        FROM {{ref('prep_weather_daily')}}
),
weekly_data AS (
        SELECT airport_code, station_id, 
        	DATE_TRUNC('week', date)::date AS week_start, 
        	date_year, cw
            ,AVG(avg_temp_c)::NUMERIC(4,2) AS avg_temp_c
            ,MIN(min_temp_c)::NUMERIC(4,2) AS min_temp_c
            ,MAX(max_temp_c)::NUMERIC(4,2) AS max_temp_c
            ,SUM(precipitation_mm) AS total_prec_mm
            ,AVG(avg_wind_speed)::NUMERIC(5,2) AS avg_wind_speed
            ,AVG(avg_pressure_hpa)::NUMERIC(6,2) AS avg_pressure_hpa
        FROM daily_data
        GROUP BY airport_code, station_id, date_year, cw, week_start
)
SELECT * FROM weekly_data