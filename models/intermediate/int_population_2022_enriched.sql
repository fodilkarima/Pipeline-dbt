{{ config(materialized='view') }}
-- Ce modèle transforme les données de population 2022
-- Il convertit les colonnes d'âges en lignes (unpivot)
-- puis enrichit et regroupe les catégories d'âge
with base as (
     -- Sélection des données provenant du modèle de staging
    select *
    from {{ ref('stg_population_2022') }}
),
unpivoted as (
        -- Transformation des colonnes d'âges en lignes
    -- Chaque tranche d'âge devient une ligne avec sa population
    select
        region,
        age_code,
        population_raw,
        year_path_started
    from base
    unpivot (
        population_raw for age_code in (
            m_0_4, m_5_9, m_10_14, m_15_19, m_20_24,
            m_25_29, m_30_34, m_35_39, m_40_44, m_45_49,
            m_50_54, m_55_59, m_60_64, m_65_69, m_70_74,
            m_75_79, m_80_84, m_85_89, m_90_94, m_95_PLUS,
            F_0_4, F_5_9, F_10_14, F_15_19, F_20_24,
            F_25_29, F_30_34, F_35_39, F_40_44, F_45_49,
            F_50_54, F_55_59, F_60_64, F_65_69, F_70_74,
            F_75_79, F_80_84, F_85_89, F_90_94, F_95_PLUS
        )
    )
),
enriched as (
     -- Enrichissement des données
    -- Extraction du genre et du groupe d'âge depuis age_code
select 
   region,
    -- Extraction du genre (M ou F)
    split_part(age_code, '_', 1) as gender,
      -- Extraction du groupe d'âge
    substr(age_code, position('_' in age_code) + 1) as age_group,
    population_raw as estimation_population,
    year_path_started
from unpivoted
  -- Suppression des lignes non pertinentes
where region is not null
  and region not in ('Année 2022', 'Régions')),

labeled as (
       -- Regroupement des tranches d'âge
    -- Toutes les personnes de 60 ans et plus sont regroupées
  select
    region,
    gender,
    case
        when age_group in ('60_64','65_69','70_74','75_79','80_84','85_89','90_94','95_PLUS')
            then '60 ans ou plus'
             -- Transformation du format d'âge : 20_24 → 20-24 ans
        else replace(age_group, '_', '-') || ' ans'
    end as age_group,
    estimation_population,
    year_path_started
from enriched)
-- Agrégation finale de la population par région, genre et tranche d'âge
select
    region,
    gender,
    age_group,
     -- Somme de la population estimée
    sum(estimation_population) as estimation_population,
    year_path_started
from labeled
-- Agrégation finale
group by region, gender, age_group,year_path_started
