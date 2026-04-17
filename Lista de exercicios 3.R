##########################################
# Lista de exercícios 3
# Autor: Alexandre Bentaberry-Rosa
# Data: 16/04/2026
##########################################

##################  LISTA DE EXERCÍCIOS 3 ################## 

Clima <- "https://codeberg.org/edsonzmartinez/CursoR/raw/branch/main/dadosclimaticosRP.csv"
Clima   <- read.csv2(Clima, fileEncoding = "Windows-1252")


# (a) Escreva a função R que mostra o nome das variáveis da base de dados.
head(Clima)  # Opçao 1
names(Clima) # Opçao 2

# (b) Escreva a função R que mostra as seis primeiras linhas da base de dados
(Clima[1:6, ])

# (c) Escreva a função R que mostra as seis últimas linhas da base de dados.
tail(Clima)

# (d) Escreva a função R que mostra as linhas 20 a 40 da base de dados.
(Clima[20:40, ])# Opçao 1

linhas_20_40 <- function(df) df[20:40, ] # Opçao 2

# (e) Escreva a função R que mostra somente as linhas correspondentes ao ano de 1993
Clima[Clima$ano == 1993, ] # Opçao 1

linhas_1993 <- function(df) {subset(df, ano == 1993)} # Opçao 2

linhas_1993(Clima) #visualizar


# (F) Para mostrar quais são os meses com mais chuva e com menos chuva em Ribeirão Preto, escreva
#um código R para construir um box-plot para a variável precipitação, igual a este:

Clima$mes <- factor(Clima$mes,
                    levels = c("janeiro", "fevereiro", "março", "abril",
                               "maio", "junho", "julho", "agosto",
                               "setembro", "outubro", "novembro", "dezembro")) #Quando rodo esse codigo, a variavel mês fica NA.

#Verificar o que esta acontecendo
unique(Clima$mes)
#Isso acontece por conta dos espaços entre os nomes e as aspas --> "Janeiro  "

#Retirando os espaços
Clima$mes <- trimws(Clima$mes)

#Tentando novamente...
Clima$mes <- factor(Clima$mes,
                    levels = c("janeiro", "fevereiro", "marÃ§o", "abril",
                               "maio", "junho", "julho", "agosto",
                               "setembro", "outubro", "novembro", "dezembro"))

boxplot(Clima$precipitacao ~ Clima$mes,
        xlab = "mês",
        ylab = "precipitação")

#Entretando o mês de março ainda esta com a grafica errada
Clima$mes <- gsub("marÃ§o", "março", Clima$mes)

#Refazendo os graficos com a grafa correta
Clima$mes <- factor(Clima$mes,
                    levels = c("janeiro", "fevereiro", "março", "abril",
                               "maio", "junho", "julho", "agosto",
                               "setembro", "outubro", "novembro", "dezembro"))

boxplot(Clima$precipitacao ~ Clima$mes,
        xlab = "mês",
        ylab = "precipitação")


# (g) Usando esta base de dados, escreva um código R para gerar uma figura igual a esta:

# Criar índice de tempo 
t <- 1:nrow(Clima)

# Obter anos únicos
anos <- unique(Clima$ano)

# Posições no eixo x 
pos_anos <- seq(1, length(t), by = 12)

# Ajustar margens
par(mar = c(6, 4, 4, 2))

# Gráfico da temperatura mínima
plot(t, Clima$tempminabs,
     type = "l",
     col = "blue",
     lwd = 2,
     ylim = c(0, 40),
     xaxt = "n",   
     yaxt = "n",
     xlab = "",
     ylab = "Temperatura (°C)",
     main = "Temperaturas mensais em Ribeirão Preto (1991–2021)",
     bty = "n")

# Adicionar temperatura máxima
lines(t, Clima$tempmaxabs,
      col = "red",
      lwd = 2)

# Eixo Y
axis(2, las = 1)

# Eixo X (meses + anos)
axis(1, at = pos_anos, labels = rep("JAN", length(pos_anos)), line = 1, cex.axis = 0.7)
axis(1, at = pos_anos, labels = anos, line = 3, cex.axis = 0.8)

# Legenda (forma mais simples e correta)
legend("bottom",
       legend = c("Temperatura mínima", "Temperatura máxima"),
       col = c("blue", "red"),
       lwd = 2,
       horiz = TRUE,
       bty = "n")
