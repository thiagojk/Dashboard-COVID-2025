
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
    datanot = as.Date(data_da_notificacao, format = "%d/%m/%Y"),
    semana_epi = epiweek(datanot),
    notificados_belem = as.integer(municipio_da_notificacao == "Belém"),
    residentes_belem = as.integer(municipio_de_residencia == "Belém")
  ) |>
  relocate(datanot, semana_epi, notificados_belem, residentes_belem, .before = 1)












