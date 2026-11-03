library(dplyr)
library(stringr)

base_dvf = read.csv2(
  file = "z:/formations/master/2026-2027/projet_methodo/donnees/ValeursFoncieres-2026-S1.csv",
  sep = "|"
)

colnames(base_dvf) = c(
  "id_de_doc",
  "ref_doc",
  "x1_articles_cgi",
  "x2_articles_cgi",
  "x3_articles_cgi",
  "x4_articles_cgi",           
  "x5_articles_cgi",
  "num_disposition",            
  "date_mutation",
  "nature_mutation",
  "valeur_fonciere",
  "num_voie",
  "b_t_q",
  "type_de_voie",
  "code_voie",
  "voie",
  "code_post",
  "commune",
  "code_dep",
  "code_com",
  "prefixe_de_section",
  "section",
  "num_de_plan",
  "num_de_Volume",                 
  "x1er_lot",
  "surf_carrez_1er_lot",
  "x2eme_lot",
  "surf_carrez_2e_lot",
  "x3eme_lot",
  "surf_carrez_3e_lot",
  "x4eme_lot",
  "surf_carrez_4e_lot",
  "x5eme_lot",
  "surf_carrez_5e_lot",
  "nbre_lots",
  "code_type_local",
  "type_local",
  "id_local",         
  "surf_reelle_bati",
  "nbre_pieces",
  "nature_culture",
  "nature_culture_speciale",
  "sur_terrain"
)

base_dvf = base_dvf |>
  mutate(
    code_post = sprintf("%05d", code_post)
  ) |> 
  select(
    !c(
      "id_de_doc",
      "ref_doc",
      "x1_articles_cgi",
      "x2_articles_cgi",
      "x3_articles_cgi",
      "x4_articles_cgi",
      "x5_articles_cgi",
      "code_dep",
      "code_com",
      "num_de_Volume",
      "id_local"
    )
  )

base_dvf_bretagne = base_dvf |> 
  filter(
    str_sub(code_post, 1, 2) %in% c(22, 29, 35, 56)
  ) |> 
  filter(
    type_local %in% c("Appartement", "Maison")
  )

