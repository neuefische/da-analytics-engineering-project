{{ config(materialized='table') }}

WITH weather_numeric AS (
    SELECT
        *,
        DATE_PART('day', date) AS date_day,
        DATE_PART('month', date) AS date_month,
        DATE_PART('year', date) AS date_year,
        DATE_PART('week', date) AS cw,
        TO_CHAR(date, 'FMMonth') AS month_name,
        TO_CHAR(date, 'FMDay') AS weekday
    FROM {{ ref('stg_weather_daily') }}
)
SELECT
    airport_code,
    station_id,
    date,
    avg_temp_c,
    min_temp_c,
    max_temp_c,
    precipitation_mm,
    sun_minutes,
    max_snow_mm,
    avg_wind_direction,
    avg_wind_speed,
    avg_peakgust,
    avg_pressure_hpa,
    date_day,
    date_month,
    date_year,
    cw,
    month_name,
    weekday
FROM weather_numeric