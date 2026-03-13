{{ config(materialized='view') }}

select * from {{ ref('int_population_2022_enriched') }}

union all

select * from {{ ref('int_population_2023_enriched') }}

union all

select * from {{ ref('int_population_2024_enriched') }}

union all

select * from {{ ref('int_population_2025_enriched') }}
