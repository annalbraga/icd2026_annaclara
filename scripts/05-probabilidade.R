# Arquivo: 05-probabilidade.R
# Autor: Anna Clara Lucena Braga 
# Data: 11/05/2026
# Objetivos:
# 1. Praticar cálculos básicos de probabilidades
# 2. Praticar conceitos básicos de simulação de Monte Carlo

# Configuracoes globais -----------------------------------------------

# exibe números sem notação científica
options(digits = 5, scipen = 999)


# Pacotes usados ------------------------------------------------------

library(tidyverse)
library(probs) # instale esse pacote

#SOLUÇÃO DO EXEMPLO 1

#A FUNÇÃO TOSSCOIN SIMULA O LANÇAMENTO DE MOEDAS

#SIMULA O LANÇAMENTO DE 3 MOEDAS

# espaço amostral do lançamento de uma moeda 2 vezes
tosscoin(times = 3)

# para exibir os números sem notação científica
options(scipen = 999)

choose(60,6)

# para exibir os números sem notação científica
options(scipen = 999)

# prob. de acertar os 6 números da megasena com 1 aposta
1/choose(60,6)

# fixa a semente para reprodutibilidade
set.seed(123)

# cria um vetor de 1 até 6 (faces)
dado <- 1:6                                 

# define o n. de lançamentos do dado
n <- 10 

# simula os 10 lançamentos
lançamentos <- sample(dado, size = 10, replace = TRUE)
lançamentos

# calcula o valor médio dos 10 lançamentos
mean(lançamentos)  # média observada

#EXEMPLO 1

# fixa a semente para reprodutibilidade
set.seed(123)

# define o n. de lançamentos do dado
n <- 100000 

# simula os n lançamentos
lançamentos <- sample(dado, size = 100000, replace = TRUE)

# calcula o valor médio dos 10 lançamentos
mean(lançamentos)  # média observada











