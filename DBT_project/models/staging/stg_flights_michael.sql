{{ config(materialized='table') }}
    WITH flights_one_month AS (
        SELECT * 
        FROM {{source('bubbles_project', 'flights_raw')}}
    )
    SELECT * FROM flights_one_month