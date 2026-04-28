# Arquivo: 03-lista.R
# Autor(a): Anna Clara Lucena Braga 
# Data: 14/04/2026
# Objetivo: Resolução da Lista de Exercícios 3

# Configurações globais --------------------------------------

# Configura o número de dígitos exibidos
options(digits = 5, scipen = 999)

# Carrega os pacotes necessários
library(here)
library(tidyverse)


# Exercício 1 ------------------------------------------------

## a
# Aquisição dos dados ----------------------------------------------------

# define o caminho relativo do arquivo de dados
caminho_csv <- here("dados/brutos/receitas_trimestres.csv")

# importa o arquivo usando a função read_csv do pacote readr
dados_receitas <- read_csv(caminho_csv)



## b
glimpse(dados_receitas)


## c
# Comentário:
#Os trimestres estão como nome das colunas, sendo que deveria ter uma coluna com 
#o nome "Trimestre", e abaixo dela os valores "T1, T2, T3..."


## d
#transforma receitas para o formato longo
receitas_longas <- dados_receitas |> 
  pivot_longer(
    cols = c("T1","T2","T3","T4"),
    names_to = "trimestre",
    values_to = "receita"
  )


## e
view(receitas_longas)


# Exercício 2 ------------------------------------------------


## a
# define o caminho relativo do arquivo de dados
caminho_csv <- here("dados/brutos/desempenho-empresa.csv")

# importa o arquivo usando a função read_csv do pacote readr
dados_desempenho <- read_csv(caminho_csv)



## b
glimpse(dados_desempenho)


## c
#Comentário:
#O nome das colunas estão misturando dois dados, sendo eles: receita e despesa, 
#junto com trimestre

## d
desempenho_longo <- dados_desempenho |> 
  pivot_longer(
    cols = -empresa,
    names_to = c("indicador","trimestre"),
    names_sep = "_",
    values_to = "valor"
  )

glimpse(desempenho_longo)

## e
view(desempenho_longo)


# Exercício 3 ------------------------------------------------


## a
#IMPORTANDO PRODUTOS 
# define o caminho relativo do arquivo de dados
caminho_produtos <- here("dados/brutos/produtos.csv")

# importa o arquivo usando a função read_csv do pacote readr
dados_produtos <- read_csv(caminho_produtos)

#IMPORTANDO VENDAS
# define o caminho relativo do arquivo de dados
caminho_vendas <- here("dados/brutos/vendas.csv")

# importa o arquivo usando a função read_csv do pacote readr
dados_vendas <- read_csv(caminho_vendas)

#IMPORTANDO CLIENTES 
# define o caminho relativo do arquivo de dados
caminho_clientes <- here("dados/brutos/clientes.csv")

# importa o arquivo usando a função read_csv do pacote readr
dados_clientes <- read_csv(caminho_clientes)


## b
glimpse(dados_produtos)

glimpse(dados_vendas)

glimpse(dados_clientes)


## c
vendas_produtos <- dados_vendas |>
  left_join(dados_produtos, by = "codigo_produto")

glimpse(vendas_produtos)

view(vendas_produtos)

## d
relatorio_vendas <- vendas_produtos |> 
  left_join(dados_clientes, by= "id_cliente")

glimpse(relatorio_vendas)

view(relatorio_vendas)

## e

# seleciona apenas as variáveis solicitadas
relatorio_final <- relatorio_vendas |>
  select(
    id_venda,
    codigo_produto,
    id_cliente,
    data_venda,
    nome_produto,
    quantidade,
    nome_cliente,
    cidade
  )

# exibe a estrutura do objeto
glimpse(relatorio_final)

## f

# visualiza o objeto no RStudio
View(relatorio_final)

## g

# comentário:
# podem surgir valores NA após o uso de left_join() quando existem
# registros na tabela principal que não encontram correspondência
# na outra tabela.
# neste exemplo:
# - o produto P006 aparece em dados_vendas, mas não está em 
#   dados_produtos
# - o cliente C004 aparece em dados_vendas, mas não está em 
#   dados_clientes

## h

# refaz a combinação entre dados_vendas e dados_produtos 
# usando inner_join()
vendas_produtos_inner <- dados_vendas |>
  inner_join(dados_produtos, by = "codigo_produto")

# exibe a estrutura do objeto
glimpse(vendas_produtos_inner)

# visualiza o objeto no RStudio
View(vendas_produtos_inner)

# comentário:
# com inner_join(), permanecem apenas as linhas que têm 
# correspondência nas duas tabelas.
# por isso, a venda associada ao produto P006 não aparece no resultado.

## i

# refaz a combinação entre dados_vendas e dados_produtos 
# usando full_join()
vendas_produtos_full <- dados_vendas |>
  full_join(dados_produtos, by = "codigo_produto")

# exibe a estrutura do objeto
glimpse(vendas_produtos_full)

# visualiza o objeto no RStudio
View(vendas_produtos_full)

# comentário:
# com full_join(), são mantidas todas as linhas das duas tabelas.
# por isso, além das vendas, também aparece o produto P005,
# que está em dados_produtos, mas não aparece em dados_vendas