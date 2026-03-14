-- Test d’unicité des identifiants étudiant par année
-- La combinaison (user_id, year_path_started) doit être unique
select
    user_id,
    year_path_started,
    count(*) as nb
from {{ ref('stg_etudiant') }}
group by 1, 2
-- Si le nombre est supérieur à 1, cela signifie qu'il existe des doublons
-- Dans ce cas le test échoue
having count(*) > 1
