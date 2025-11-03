{{ config(materialized='table') }}
WITH prep_airports AS (
    SELECT
        faa,
        name,
        city,
        country,
        lat,
        lon,
        alt,
        tz,
        dst
    FROM {{ ref('stg_airports') }}
)
SELECT *
FROM prep_airports