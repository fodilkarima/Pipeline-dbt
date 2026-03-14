-- Test de validation des valeurs de la colonne age_group
-- Ce test vérifie que toutes les valeurs de age_group appartiennent
-- à la nomenclature attendue des tranches d'âge.
select * from {{ref('stg_etudiant')}} 
where age_group is not null
  and age_group not in (
    '20-24 ans',
    '25-29 ans',
    '30-34 ans',
    '35-39 ans',
    '40-44 ans',
    '45-49 ans',
    '50-54 ans',
    '55-59 ans',
    '60 ans ou plus'
  )
