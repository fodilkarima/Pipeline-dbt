# Pipeline dbt – Analyse des étudiants

## Objectif

Ce projet dbt transforme des données brutes d'étudiants et de population afin de produire une table analytique exploitable pour l'analyse des parcours de formation.

Le pipeline permet :
- le nettoyage des données
- l'enrichissement des informations
- la production d'une table finale pour l'analyse

---

# Architecture du pipeline

Le projet suit l’architecture dbt classique :

source → staging → intermediate → marts

### Staging
Préparation et nettoyage des données brutes.

Exemples :
- stg_etudiant
- stg_population_2022
- stg_population_2023
- stg_population_2024
- stg_population_2025

### Intermediate
Transformation et enrichissement des données.

Exemples :
- int_etudiant_enriched
- int_population_2022_enriched
- int_population_2023_enriched
- int_population_2024_enriched
- int_population_2025_enriched
- int_population_all_years

### Marts
Tables analytiques finales.

Exemple :
- marts_etudiant_population

## Tests de qualité des données

Les tests implémentés dans ce projet :

### not_null
Vérifie que la colonne `user_id` n'est jamais vide.

### accepted_values
Vérifie que la colonne `gender` ne contient que :

- F
- M
- unknown

### Test personnalisé

Le test `unique_user_year.sql` vérifie que la combinaison suivante est unique :

(user_id, year_path_started)

Cela garantit qu'un étudiant apparaît au maximum une fois par année.

# Structure du projet

Pipeline-dbt
│
├── models
│ ├── staging
│ ├── intermediate
│ └── marts
│
├── tests
│ └── unique_user_year.sql
│
├── dbt_project.yml
└── README.md

# Exécution du pipeline
- dbt run
- dbt test

Construire le pipeline :
dbt build

Technologies utilisées
dbt
Snowflake
SQL
GitHub

Auteur

Projet réalisé par Fodil Karima



