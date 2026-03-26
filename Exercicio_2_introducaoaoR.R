

##########################################
# Lista de exercícios 2
# Autor: Alexandre Bentaberry-Rosa
# Data: 26/03/2026
##########################################

#Carregando os dados
urlfile="https://raw.githubusercontent.com/edsonzmartinez/cursoR/main/Dados_jogadores.csv"

#Criando um df
jog <- read.csv2(urlfile)

######  Questão 1 ##### 

####### - A)Escreva as funções R adequadas para retornar as estatísticas descritivas para a idade dos atletas (média, desvio padrão, mediana, amplitude e intervalo interquartil) #######
#Para descrever a media da idade dos atletas:
#Primeiramente preciso chamar a funçao mean/sd/median/max/IQR e logo depois de selecionar o dataframe devo selecionqr a variavel usando o $

#Média
mean(jog$idade)

#Desvio padrão
sd(jog$idade)

#Mediana
median(jog$idade)

# Amplitude (máximo - mínimo)
#Criando variaveis intermediarias
max_idade <- max(jog$idade)
min_idade <- min(jog$idade)

#Calculando a amplitude
amplitude <- max_idade - min_idade

#Visualizando o resultado
amplitude

# Intervalo interquartil (IQR)
IQR(jog$idade)


###### - B)Escreva as funções R adequadas para encontrar a média e o desvio padrão da altura dos atletas que têm mais de 25 anos ######

#Criando um novo dataframe contento apenas os atletas com idade > 25
maisde25 <- jog[jog$idade > 25, ]  #Para filtrar dados os colchetes sao indicados, seguido do df do simbolo $ e da variavel

#Apos a criaçao do novo df, podemos aplicar as funçoes de média e DP
#Média
mean(maisde25$altura)

#Desvio Padrão
sd(maisde25$altura)


###### - C) Escreva as funções R que permitem encontrar as estatísticas descritivas para a altura dos atletas (média, DP e mediana), de acordo com suas posições ######

#Para realizarmos os calculos por subgrupos, nos vms aplicar a função tapply, que vai nos ajudar a calcular algo em subgrupos
# Média da altura por posição
tapply(jog$altura, jog$posicao, mean)
#Para melhorar a acuraria, usar a funçao na.rm =TRUE permite a remoção de NA
tapply(jog$altura, jog$posicao, mean, na.rm= TRUE)

# Desvio padrão da altura por posição
tapply(jog$altura, jog$posicao, sd)
tapply(jog$altura, jog$posicao, sd, na.rm=TRUE)
# Mediana da altura por posição
tapply(jog$altura, jog$posicao, median)
tapply(jog$altura, jog$posicao, median, na.rm=TRUE)



###### - D) Escreva a função R que permite calcular o coeficiente de correlação de Pearson entre a idade e a.... ######

cor.test(jog$idade, jog$altura, method = "pearson")

# A corr deu 0.222, valor positivo, o que sugere uma tendência leve de atletas mais velhos serem ligeiramente mais altos.
#Porém, 0.222 é uma correlação fraca, ou seja, não é suficiente para afirmar uma relação forte ou consistente.
#além disso o p-valor é maior aue 0.05 o que nao demonstra significatividade, além de termos o IC95% que cruza o 0.


###### - E)  Escreva as funções R que mostram as frequências absolutas e relativas de atletas que atuam em cada posição ######

#Frequência absoluta
table(jog$posicao)

#Frequência relativa
round(prop.table(table(jog$posicao)) * 100)
round(prop.table(table(jog$posicao)) * 100 , 1) #Proporções dentro de cada grupo


###### - F) Escreva a função R que mostra quantos atletas possuem idade em cada um destes intervalos:  ######
breaks <- c(22, 24, 26, 28, 30, 32, 34)
table(cut(jog$idade,breaks=c(22,24,26,28,30,32,34)))



######  Questão 2 ##### 

###### - A) -  ######
seq(from = 40, to = 20, by = -4)

###### - B) -  ######
rep(c(9, 5, 2), times = 3)

###### - C) -  ######
seq(from = 0, to = 1, by = 0.2)

###### - D) -  ######
rep(c(9, 7), each = 3)




