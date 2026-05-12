# Arquivo: 04-lista-resolucao.R
# Autor(a): Anna Clara Lucena Braga
# Data: 12/05/2026
# Objetivo: Resolução da Lista de Exercícios 4

# Configurações globais --------------------------------------

# Configura o número de dígitos exibidos
options(digits = 5, scipen = 999)


# Exercício 2 ------------------------------------------------

# a)
# total de conjuntos diferentes de 20 números sorteados entre 100
total_resultados <- choose(100,20)
total_resultados

#são prováveis 535983370403809656842 conjuntos



# b)
# resultados favoráveis: os 20 números sorteados precisam estar
# dentro dos 50 números escolhidos na aposta
resultados_favoraveis <- choose(50,20)
resultados_favoraveis

#isso pode acontecer de 47129212243960 formas


# c)
# probabilidade de acertar os 20 números
prob_acertar_20 <- choose(50,20) / choose(100,20)
prob_acertar_20

#a probabilidade de acertar os 20 numeros é de 0.00000008793% 

# forma alternativa de interpretação: uma chance em quantas apostas?
uma_chance_em <- 1 / (535983370403809656842)
uma_chance_em 
 
# a chance é uma em 535.983.370.403.809.656.842

# d)
# Muito baixa, pois tem apenas uma chance de acertar entre 
#535.983.370.403.809.656.842 probabilidades



# Exercício 3 ------------------------------------------------

# probabilidade teórica do evento A: obter 5 ou 6
prob_teorica <- ___ / ___
prob_teorica

# resultados possíveis do dado
dado <- ___

# número de lançamentos
n <- 100

# fixa a semente para reprodutibilidade
set.seed(123)

# simula os lançamentos
# dica: em um dado equilibrado, todas as faces têm a mesma probabilidade
lancamentos <- sample(
  x = ___,
  size = ___,
  replace = ___
)

# evento A: resultado maior ou igual a 5
evento_A <- lancamentos >= ___

# número de lançamentos favoráveis ao evento A
favoraveis <- ___(evento_A)
favoraveis

# frequência relativa do evento A
freq_relativa <- ___(evento_A)
freq_relativa

# Depois de completar para n = 100, altere n para 1000 e 10000.



# Exercício 5 ------------------------------------------------


# Cálculo do valor esperado com R

# parâmetros do modelo
prob_incendio <- 0.01
indenizacao <- 150000
carregamento <- 0.25

# valor esperado de indenização por residência
valor_esperado <- ___ * ___

# exibe o resultado
valor_esperado

# prêmio anual por residência com acréscimo
premio <- ___ * (1 + ___)

# exibe o resultado
premio


# a) 


# b) 


# c) 



# Exercício 6 ------------------------------------------------

# fixa a semente para obter os mesmos resultados ao reexecutar
set.seed(2)

# tamanho da carteira de residências seguradas
n <- 100

# simula a indenização de cada residência: 0 ou valor total da indenização
indenizacoes <- sample(
  x = c(___, ___),
  size = ___,
  replace = TRUE,
  prob = c(1 - ___, ___)
)

# média das indenizações por residência na carteira simulada
media_indenizacoes <- ___(indenizacoes)
media_indenizacoes

# total de indenizações pagas pela seguradora
total_indenizacoes <- ___(indenizacoes)
total_indenizacoes

# total arrecadado com os prêmios cobrados
total_premios <- ___ * ___
total_premios

# resultado simplificado da carteira: prêmios recebidos menos indenizações pagas
resultado_carteira <- ___ - ___
resultado_carteira

# Depois de completar para n = 100, altere n para 10000 e 100000.

# a) 


# b) 


# c) 


# d) 