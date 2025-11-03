{{ config(materialized='table') }}
with flights_airports_dest as (
SELECT *
FROM {{ ref('stg_airports') }}
join {{ref('stg_flights_michael')}}
on stg_airports.faa = stg_flights_michael.dest
where stg_airports.faa in ('ECP','VPS', 'PNS', 'TLH')
)
SELECT* from flights_airports_dest