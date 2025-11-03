{{ config(materialized='table') }}

with weather_daily_join as (
select 
    *
 from {{ref('prep_flights_airports_origin')}}
 full join {{ref ('stg_weather_daily')}}
 on prep_flights_airports_origin.faa = stg_weather_daily.airport_code
 where prep_flights_airports_origin.faa is not null
)
select * from weather_daily_join