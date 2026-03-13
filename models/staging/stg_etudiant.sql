{{config(materialized='view')}}
-- Modèle de staging : nettoyage et préparation des données étudiants
select 
 -- Pseudonymisation de l'identifiant utilisateur pour protéger les données personnelles
  sha2(cast(user_id as string), 256) as user_id,
  path_category_name,
  age_group,
   -- Remplacement des valeurs nulles dans le genre par "unknown"
  coalesce(gender, 'unknown') as gender,
    -- Normalisation des noms de régions pour garantir une cohérence
  case when region = 'Centre-Val de Loire' then 'Centre-Val-de-Loire'
       when region = 'DROM' then 'DOM'
  else region end as region,
  year_path_started
from {{source('ecommerce','orders')}}
