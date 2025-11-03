{{ config(materialized='table') }}

WITH airports_stg AS (
  SELECT *
  FROM {{source('bubbles_project', 'airports')}}
)
SELECT * FROM airports_stg