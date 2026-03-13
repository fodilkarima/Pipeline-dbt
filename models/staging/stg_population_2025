{{ config(materialized='view') }}

select
  C1::string as region,
  2025 as year_path_started,
  
  to_number(regexp_replace(C23::string, '[^0-9]', '')) as m_0_4,
  to_number(regexp_replace(C24::string, '[^0-9]', '')) as m_5_9,
  to_number(regexp_replace(C25::string, '[^0-9]', '')) as m_10_14,
  to_number(regexp_replace(C26::string, '[^0-9]', '')) as m_15_19,
  to_number(regexp_replace(C27::string, '[^0-9]', '')) as m_20_24,
  to_number(regexp_replace(C28::string, '[^0-9]', '')) as m_25_29,
  to_number(regexp_replace(C29::string, '[^0-9]', '')) as m_30_34,
  to_number(regexp_replace(C30::string, '[^0-9]', '')) as m_35_39,
  to_number(regexp_replace(C31::string, '[^0-9]', '')) as m_40_44,
  to_number(regexp_replace(C32::string, '[^0-9]', '')) as m_45_49,
  to_number(regexp_replace(C33::string, '[^0-9]', '')) as m_50_54,
  to_number(regexp_replace(C34::string, '[^0-9]', '')) as m_55_59,
  to_number(regexp_replace(C35::string, '[^0-9]', '')) as m_60_64,
  to_number(regexp_replace(C36::string, '[^0-9]', '')) as m_65_69,
  to_number(regexp_replace(C37::string, '[^0-9]', '')) as m_70_74,
  to_number(regexp_replace(C38::string, '[^0-9]', '')) as m_75_79,
  to_number(regexp_replace(C39::string, '[^0-9]', '')) as m_80_84,
  to_number(regexp_replace(C40::string, '[^0-9]', '')) as m_85_89,
  to_number(regexp_replace(C41::string, '[^0-9]', '')) as m_90_94,
  to_number(regexp_replace(C42::string, '[^0-9]', '')) as m_95_plus,

  to_number(regexp_replace(C44::string, '[^0-9]', '')) as f_0_4,
  to_number(regexp_replace(C45::string, '[^0-9]', '')) as f_5_9,
  to_number(regexp_replace(C46::string, '[^0-9]', '')) as f_10_14,
  to_number(regexp_replace(C47::string, '[^0-9]', '')) as f_15_19,
  to_number(regexp_replace(C48::string, '[^0-9]', '')) as f_20_24,
  to_number(regexp_replace(C49::string, '[^0-9]', '')) as f_25_29,
  to_number(regexp_replace(C50::string, '[^0-9]', '')) as f_30_34,
  to_number(regexp_replace(C51::string, '[^0-9]', '')) as f_35_39,
  to_number(regexp_replace(C52::string, '[^0-9]', '')) as f_40_44,
  to_number(regexp_replace(C53::string, '[^0-9]', '')) as f_45_49,
  to_number(regexp_replace(C54::string, '[^0-9]', '')) as f_50_54,
  to_number(regexp_replace(C55::string, '[^0-9]', '')) as f_55_59,
  to_number(regexp_replace(C56::string, '[^0-9]', '')) as f_60_64,
  to_number(regexp_replace(C57::string, '[^0-9]', '')) as f_65_69,
  to_number(regexp_replace(C58::string, '[^0-9]', '')) as f_70_74,
  to_number(regexp_replace(C59::string, '[^0-9]', '')) as f_75_79,
  to_number(regexp_replace(C60::string, '[^0-9]', '')) as f_80_84,
  to_number(regexp_replace(C61::string, '[^0-9]', '')) as f_85_89,
  to_number(regexp_replace(C62::string, '[^0-9]', '')) as f_90_94,
  to_number(regexp_replace(C63::string, '[^0-9]', '')) as f_95_plus

from {{ source('ecommerce', 'population_2025') }}
where C1 is not null
  and C1 not in ('Année 2022', 'Régions')
  and C1 not like 'Source%'
  and C1 not like 'Estimation%'
