with weather_hourly_join_dest as (
select 
    *
 from {{ref('prep_flights_airports_dest')}}
 full join {{ref ('stg_weather_daily')}}
 on prep_flights_airports_dest.faa = stg_weather_daily.airport_code
 where prep_flights_airports_dest.faa is not null
)
select * from weather_hourly_join_dest