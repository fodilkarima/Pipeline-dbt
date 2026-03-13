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

---

# Structure du projet


Try running the following commands:
- dbt run
- dbt test

Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/overview)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](http://slack.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
