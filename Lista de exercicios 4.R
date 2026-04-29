##########################################
# Lista de exercícios 4
# Autor: Alexandre Bentaberry-Rosa
# Data: 27/04/2026
##########################################


                               ################## Exercicio Lista 4 ################## 

# Carregar pacotes
library(ggplot2)
library(tidyr)
library(dplyr)

w <- read.table("https://codeberg.org/edsonzmartinez/CursoR/raw/branch/main/antropo.txt")
head(w)

# 1. #Criar uma variavel contento o peso das pessoas - Sabendo que 1 libra = 0.45359237 kg
#Transformar a primeira linha em nome das colunas
colnames(w) <- w[1, ]
#Excluir a primeira linha
w <- w[-1, ]
#Foi preciso verificar a classe e transforma-la em numeric
class(w) 
# Multiplicamos a variável Weight por esse fator
w$Weight_kg <- as.numeric(w$Weight) * 0.45359237
# Visualizar resultado
head(w)


# 2. Sabendo que 1 polegada = 2,54 centímetros, crie uma nova variável no banco de
#dados, contendo a altura das pessoas, em centímetros
w$Height_cm <- as.numeric(w$Height) * 2.54
# Visualizar resultado
head(w)

# 3. Faça um box-plot para cada uma das variáveis contínuas do banco de dados,
# identificando a forma da distribuição dos dados e possíveis valores atípicos.
# Selecionar apenas as variáveis contínuas (numéricas)
class(w)
#Transformar tudo em numerico
w[] <- lapply(w, function(x) as.numeric(as.character(x)))

#Excluir a coluna NA
w <- w[, !names(w) %in% "NA"]

# Selecionar apenas variáveis numéricas (contínuas)
w_num <- w[, sapply(w, is.numeric)]

# Boxplot de todas as variáveis contínuas
boxplot(w_num,
        main = "Boxplot das variáveis contínuas",
        las = 2,              # nomes na vertical
        col = "lightblue")

### 4. Faça um gráfico da dispersão entre o peso e a altura das pessoas, identificando valores atípicos nesta relação
#Destacando os outliers
outliers <- w$Weight_kg > 120

#Construindo o plot e marcando os outliers
plot(w$Height_cm, w$Weight_kg,
     col = ifelse(outliers, "red", "blue"),
     pch = 19,
     xlab = "Altura (cm)",
     ylab = "Peso (kg)",
     main = "Dispersão com outliers destacados")

#### 5. Construa histogramas para a idade, peso e estatura, descrevendo a distribuição dos dados
#Histograma para a idade
Figura5a<-hist(w$Age,
               main = "Histograma da Idade",
               xlab = "Idade",
               col = "lightblue") #Distribuiçao aproximadamente unimodal, com maior concentração de indivíduos entre 35 e 50 anos. 
#Observa-se uma leve assimetria à direita.

#Histograma para o peso
Figura5b<-hist(w$Weight_kg,
               main = "Histograma do Peso",
               xlab = "Peso (kg)",
               col = "lightgreen") #Distribuiçao simetrica com dados com comportamento de outleirs a direita

#Histograma para a altura
Figura5c<-hist(w$Height_cm,
               main = "Histograma da Altura",
               xlab = "Altura (cm)",
               col = "lightpink") # distribuiçao assimetrica com right tail


### 6. Faça gráficos de dispersão que permitam descrever os padrões de associação entre o
## percentual de gordura (Fat) e as demais variáveis do banco de dados.

variaveis_numericas <- w[, sapply(w, is.numeric) & colnames(w) != "Fat %"]

variaveis_numericas <- cbind(w$Fat, variaveis_numericas)

colnames(variaveis_numericas)[1] <- "Fat"

pairs(variaveis_numericas, main = "Gráficos de Dispersão - Fat e Demais Variáveis", col =
        "blue", pch = 16)

### 7. Calcule coeficientes de correlação entre o percentual de gordura e as demais variáveis
##do banco de dados. Qual variável parece mais correlacionada com o percentual de gordura?

correlacao_variaveis <- w[, sapply(w, is.numeric) & colnames(w) !="Fat"]
w$`Fat` <- as.numeric(as.character(w$`Fat`))
correlacao_variaveis <- w[, sapply(w, is.numeric) & colnames(w) !="Fat"]
correlacoes <- cor(w$`Fat`, correlacao_variaveis)
print(correlacoes)

variavel_mais_correlacionada <- colnames(correlacao_variaveis)[which.max(abs(correlacoes))]
cat("Variável mais correlacionada com o percentual de gordura",
    variavel_mais_correlacionada,"\n")

### 8. Responda: há uma tendência de pessoas mais idosas possuírem maior circunferência de addômen?

cor.test(w$Abdomen, w$Age, method= "pearson")
cor.test(w$Abdomen, w$Age, method= "spearman")
cor.test(w$Abdomen, w$Age, method= "kendall")


### 9. Crie uma nova variável, que recebe 0 se a idade é menor ou igual a 45 e 1 caso contrário

ifelse(w$Age <= 45, 0, 1) 

### 10. Faça box-plots para cada uma das variáveis contínuas do banco de dados, 
## descrevendo-as segundo os dois grupos de idade criados no item 9 (os gráficos devem
## permitir comparações visuais da distribuição das variáveis entre os dois grupos)

w$Grupo_Idade <- ifelse(w$Age <= 45, 0, 1)
for (variavel in colnames(w)[sapply(w, is.numeric)]) {
  boxplot(w[, variavel] ~ w$Grupo_Idade,
          main = variavel, xlab = "Grupo de Idade", ylab = variavel, col = c("lightblue", "lightgreen"))}

### 11. Use testes de normalidade e gráficos de probabilidade normal para testar a
## normalidade de cada uma das variáveis contínuas do banco de dados.

variaveis_continuas_11 <- c("Density", "Fat", "Weight_kg", "Height_cm", "Neck", "Chest",
                            "Abdomen", "Hip", "Thigh", "Knee", "Ankle", "Biceps", "Forearm", "Wrist")
for (variavel in variaveis_continuas_11) {
  w[[variavel]] <- as.numeric(as.character(w[[variavel]]))
  if (any(is.na(w[[variavel]]))) {
    cat(paste("A variável", variavel, "contém valores não numéricos.\n\n"))
  } else {
    teste_normalidade <- shapiro.test(w[[variavel]])
    qqnorm(w[[variavel]], main = paste("Q-Q Plot -", variavel))
    qqline(w[[variavel]], col = 2)
    
    cat(paste("Variável:", variavel, "\n"))
    cat(paste("Teste de Shapiro-Wilk p-value:", teste_normalidade$p.value, "\n\n"))
  }
}

### 12. Use testes de comparação de médias para testar se cada uma das variáveis contínuas
## do banco de dados possui médias populacionais diferentes entre os dois grupos de
## idade criados no item 9

w$grupo_idade <- ifelse(w$Age <= 45, 0, 1)
variaveis_continuas_12 <- c("Density", "Fat", "Weight_kg", "Height_cm", "Neck", "Chest",
                            "Abdomen", "Hip", "Thigh", "Knee", "Ankle", "Biceps", "Forearm", "Wrist")
for (variavel in variaveis_continuas_12) {
  
  formula <- as.formula(paste(variavel, "~ grupo_idade"))
  teste_t <- t.test(formula, data = w)
  cat(paste("Variável:", variavel, "\n"))
  cat(paste("Teste t p-value:", teste_t$p.value, "\n\n"))
}

