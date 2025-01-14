
# Carregando pacotes ------------------------------------------------------

pacman::p_load(tidyverse, rio)



# Carregando dados --------------------------------------------------------

COVID_2024 <- read.csv2("Dados/2024.csv") |> 
  janitor::clean_names()

COVID_2025 <- read.csv2("Dados/2025.csv") |> 
  janitor::clean_names()

COVID <- rbind(COVID_2024, COVID_2025)

COVID <- COVID |> 
  mutate(
    # Variável: Tem CPF
    tem_cpf = case_when(
      tem_cpf == 1 ~ "Sim",
      tem_cpf == 2 ~ "Não",
      TRUE ~ NA_character_
    ),
    
    # Variável: Estrangeiro
    estrangeiro = case_when(
      estrangeiro == 1 ~ "Sim",
      estrangeiro == 2 ~ "Não",
      TRUE ~ NA_character_
    ),
    
    # Variável: Profissional de Saúde
    e_profissional_de_saude = case_when(
      e_profissional_de_saude == 1 ~ "Sim",
      e_profissional_de_saude == 2 ~ "Não",
      TRUE ~ NA_character_
    ),
    
    # Variável: Sexo
    sexo = case_when(
      sexo == 1 ~ "Masculino",
      sexo == 2 ~ "Feminino",
      TRUE ~ NA_character_
    ),
    
    # Variável: Raça/Cor
    raca_cor = case_when(
      raca_cor == 1 ~ "Branca",
      raca_cor == 2 ~ "Preta",
      raca_cor == 3 ~ "Parda",
      raca_cor == 4 ~ "Amarela",
      raca_cor == 5 ~ "Indígena",
      raca_cor == 6 ~ "Ignorado",
      TRUE ~ NA_character_
    ),
    
    # Variável: Recebeu Vacina Covid-19
    recebeu_vacina_covid_19 = case_when(
      recebeu_vacina_covid_19 == 1 ~ "Sim",
      recebeu_vacina_covid_19 == 2 ~ "Não",
      recebeu_vacina_covid_19 == 3 ~ "Ignorado",
      TRUE ~ NA_character_
    ),
    
    # Variável: Evolução do Caso
    evolucao_caso = case_when(
      evolucao_caso == 1 ~ "Cancelado",
      evolucao_caso == 2 ~ "Ignorado",
      evolucao_caso == 3 ~ "Óbito",
      evolucao_caso == 4 ~ "Cura",
      evolucao_caso == 5 ~ "Internado",
      evolucao_caso == 6 ~ "Internado em UTI",
      evolucao_caso == 7 ~ "Em tratamento domiciliar",
      TRUE ~ NA_character_
    ),
    
    # Variável: Classificação Final
    classificacao_final = case_when(
      classificacao_final == 1 ~ "Confirmado Laboratorial",
      classificacao_final == 2 ~ "Confirmado Clínico-Epidemiológico",
      classificacao_final == 3 ~ "Descartado",
      classificacao_final == 4 ~ "Síndrome Gripal Não Especificada",
      classificacao_final == 5 ~ "Confirmado Clínico-Imagem",
      classificacao_final == 6 ~ "Confirmado por Critério Clínico",
      TRUE ~ NA_character_
    )
  )
















