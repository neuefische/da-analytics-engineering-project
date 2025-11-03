{{ config(materialized='table') }}
with flights_airports_origin as (
SELECT *
FROM {{ ref('stg_flights_michael') }}
join {{ref('stg_airports')}}
on stg_airports.faa = stg_flights_michael.origin
where stg_airports.faa in ('ECP','VPS', 'PNS', 'TLH')
)
SELECT* from flights_airports_origin