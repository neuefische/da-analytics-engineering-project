{{ config(materialized='table') }}

with weather_daily_join_dest as (
select 
    *
 from {{ref('prep_flights_airports_dest')}}
 full join {{ref ('stg_weather_daily')}}
 on prep_flights_airports_dest.faa = stg_weather_daily.airport_code
)
select * from weather_daily_join_dest