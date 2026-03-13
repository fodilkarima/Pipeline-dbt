-- Modèle final (mart)
-- Ce modèle combine les données enrichies des étudiants
-- avec les estimations de population pour permettre
-- des analyses comparatives par région, âge, genre et année.
select
    e.user_id,
    e.path_category_name,
    e.age_group,
    e.gender,
    e.region,
    e.year_path_started,
    p.estimation_population
from {{ ref('int_etudiant_enriched') }} e
left join {{ ref('int_population_all_years') }} p
    on e.region = p.region
    and e.gender = p.gender
    and e.age_group = p.age_group
    and e.year_path_started = p.year_path_started
