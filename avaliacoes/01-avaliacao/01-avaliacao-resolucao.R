# Arquivo: 01-avaliacao-resolucao.R
# Integrante 1: ANNA CLARA LUCENA BRAGA 
# Integrante 2: LARISSA TEIXEIRA 
# Integrante 3: MARIA EDUARDA SOUZA
# Integrante 4: ISABELLE HELENA 
# Data: 28/04/2026
# Objetivo: Resolução da Avaliação 1 — Introdução à Ciência de Dados


# Configurações globais -----------------------------------------------

options(digits = 5, scipen = 999)

# carrega os pacotes usados (Exercício 1)

library(here) # para usar caminhos relativos
library(tidyverse) # carrega o dplyr, readr, ggplot2, etc.
library(janitor) # para limpar os nomes das colunas


# Exercício 1 -----------------------------------------------------------

# importa o arquivo agencias.csv

# define o caminho relativo do arquivo usando a função here():
caminho_agencias <- here("dados/brutos/agencias.csv")
  
# importa o arquivo com a função read_csv:
  dados_agencias <- read_csv(caminho_agencias)
  
  
# inspeciona a estrutura do objeto
  # exibe uma visão compacta do objeto
  glimpse(dados_agencias)
  
  
# importa o arquivo credito_trimestral.csv
  
  
# define o caminho relativo do arquivo de dados
  caminho_credito <- here("dados/brutos/credito_trimestral.csv")
  
# importa o arquivo usando a função read_csv do pacote readr
  dados_credito <- read_csv(caminho_credito) 
  

  
  # inspeciona a estrutura do objeto
  # exibe uma visão compacta do objeto
  glimpse(dados_agencias)  
  
  
  # Exercício 2 ----------------------------------------------------------

# 2.a) #Filtre as agências cujo tipo_agencia seja "Plena", salve o resultado 
#em dados_agencias_plenas e imprima no console.
  
  # pipeline de preparação dos dados
  dados_agencias_limpos <- dados_agencias
  
  glimpse (dados_agencias_limpos)
  
  
#filtra os dados de agencias plenas
  dados_agencias_plenas|> 
    filter(tipo_agencia == "Plena")
  
  #salva o resultado em um novo objeto 
  dados_agencias_plenas <- dados_agencias_limpos |>
    filter(tipo_agencia == "Plena")
  
  #exibe o resultado 
  dados_agencias_plenas
  

# 2.b)
#Selecione apenas as colunas nome_agencia, cidade e num_cooperados e organiza 
#ordem decrescente
  
  dados_agencias_limpos |>
    select(nome_agencia, cidade, num_cooperados)|> 
    arrange(desc(num_cooperados))


# 2.c)
#Filtre as agências localizadas em "Divinópolis" e que possuam mais de 1.000
#cooperados.
  
  dados_agencias_limpos|>
    filter(cidade == "Divinópolis")|> 
    filter(num_cooperados>1000)



# Exercício 3 ---------------------------------------------------------

# 3.a) pivot_longer

# reorganiza os dados de crédito em trimestre e volume_credito
  dados_credito_longo <- dados_credito |> 
    pivot_longer(
      cols = c("T1","T2","T3","T4"),
      names_to = "trimestre",
      values_to = "volume_credito")
  
  #exibe o resultado 
  dados_credito_longo
    

  
  # 3.b) left_join
  
  # combina `dados_credito_longo`com `dados_agencias`
  dados_completos <- dados_credito_longo |> 
    left_join(dados_agencias, by = "codigo_agencia")
  
  #exibe o resultado 
  dados_completos
  
  
  
  # Exercício 4 ---------------------------------------------------------

# cria dados_analise com credito_por_cooperado
  dados_analise <- dados_completos |>
    mutate(credito_por_cooperado = volume_credito/num_cooperados)
  
  
  #exibe o resultado 
  dados_analise 
  
  # resume por cidade e ordena por volume_total
  dados_analise |> 
    group_by(cidade) |> 
    summarise(volume_total = sum(volume_credito),
    media_dos_creditos_por_cooperado = mean(credito_por_cooperado))|> 
    arrange(desc(volume_total))
  
  #exibe o resultado 
  dados_analise
  
  
  # Resposta do Exercício 4:
  
  # Cidade com maior volume_total: Divinópolis
  # Cidade com maior media_dos_creditos_por_cooperado: Formiga
  
  
  
  # Exercício 5 ---------------------------------------------------------

# classifica nivel_credito e resume por tipo_agencia
resumo_por_tipo <- dados_analise |>
    mutate(
      nivel_credito = case_when(
        credito_por_cooperado < 1400 ~ "Baixo",
        credito_por_cooperado >= 1400 & volume_credito < 1700 ~ "Médio",
        credito_por_cooperado >= 1700 ~ "Alto"
      )
    ) |>
    group_by(tipo_agencia, nivel_credito) |>
    summarise(volume_total = sum (volume_credito),
              n_obs = n(3)
    )|>
    arrange(desc(volume_total))
  
  