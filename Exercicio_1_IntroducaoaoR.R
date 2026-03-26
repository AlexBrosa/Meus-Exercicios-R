##########################################
# Lista de exercícios 1
# Autor: Alexandre Bentaberry-Rosa
# Data: 23/03/2026
##########################################

####### 1. Escreva como você pode usar o programa R para encontrar os resultados das expressões: #######

######  a) - 3 + 4 × 8 ###### 
a<- 3
b<- 4
c <- 8
resultadoa<- a + b * c
print(resultadoa)

######  (b) - (3 + 4) * 8 ###### 

#Criando o vetor
resultadob <- (a+b)*C

#Visualizando o resultado
print(resultadoB)

###### (c) -  8 × 5 + 2 × 3 ###### 
# Definindo os parâmetros
valor_1 <- 8
valor_2 <- 5
valor_3 <- 2

# Executando a primeira multiplicaçao
multip1 <- valor_1 * valor_2
# Executando a segunda multiplicaçao
multip2 <- valor_3 * a
# Obtendo o resultado final
resultadofinalc <- multip1 + multip2

# Visualizando o resultado final
resultadofinalc

###### d) - 8 × (5 + 2) × 3 ###### 

#Primeiro os parenteses
soma <- valor_2 + valor_3

#Multiplicando
resultadod <- valor_1 * soma * a

#Visualizando o resultado
print(resultadod)


###### E) - 23 + 2√3   ###### 

#Atribuiçao dos valores
Valore <- 23
#Calculando a raiz
raiz<- sqrt(3)
#Multiplicando e somando
resultadoe <- Valore + 2 * raiz
#Visualizando o resultado
print(resultadoe)


###### F) - (2 * 8) / 3 + 5 / (6 + 8)  ###### 

#Atribuiçao
valor_1 <- 8
valor_2 <- 5
valor_3 <- 2
a<- 3
valor_4 <- 6

# Calculando as duas frações
resultadof <- (valor_3 * valor_1) / a + valor_2 / (valor_4 + valor_1)

# Para ver o resultado
print(resultadof)


###### G) - 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8  ###### 

# Criando a sequência e somando
resultadoG <- sum(1:8)  #Soma de 1 a 8

# Mostrando o resultado
print(resultadoG)


###### H) - 1 × 2 × 3 × 4 × 5 × 6 × 7 × 8 ###### 

# Multiplicando de 1 a 8
resultadoH.1 <- prod(1:8) #Multiplicação de 1 a 8

# Mostrando o resultado
resultadoH.1

# Multiplicando de 1 a 8 de uma segunda maneira possivel 
resultadoH.2 <- 1 * 2 * 3 * 4 * 5 * 6 * 7 * 8

# Mostrando o resultado
resultadoH.2

###### I) - i) (1 + 1/8)^3 ###### 
base <- (1 + 1/8)
resultadoI <- base^3

# Exibindo o resultado
resultadoI


###### J) - (j) cos(𝜋) ###### 
resultadoJ <- cos(pi) #Cosseno de pi (180°)

# Exibindo o resultado
resultadoJ


###### K) - sen2(𝜋) + cos2(𝜋) ###### 
resultadoK <- sin(pi)^2 + cos(pi)^2

# Exibindo o resultado
print(resultadoK)


###### L) - sen2(𝜋) + cos2(𝜋) ###### 
#Atribuindo o vetor
resultadoL <- log(9)

# Exibindo o resultado
resultadoL

###### M) -  |8 − 19|######  
#Atribuiçao
subtraçao <- 8 - 19          #Primeiramente é preciso fazer a conta interna: 8 - 19 = -11

#Aplica o módulo: transforma -11 em 11
resultadoM <- abs(subtracao)  

#Exibe o resultado positivo
resultadoM        


###### N) -  |8 − 19|######  
parte_a <- factorial(27)    #Calcula o fatorial de 27 
parte_b <- sqrt(22)         #Calcula a raiz quadrada de 22 
resultadoN <- parte_a + parte_b #Soma os dois valores
#Visualiza o resultado
resultadoN                   



###### --- Exercício 2: Matrizes --- ######  

# Criar a matriz
matrix2 <- matrix(c(5,0,6, 9,6,4, 3,5,2), nrow = 3, byrow = TRUE)

# Para descobrir a Dimensão da matriz basta usar dim(X)
dim(matrix2)

#Para descobrir a Diagonal principal basta usar diag(x)
diag(matrix2)


#####Exercício 3 :Use as funções mode e class para encontrar o modo e a classe de cada um dos objetos abaixo #### 

# Criando os objetos do exercício
a3 <- 1:10
b3 <- letters[1:6]
c3 <- matrix(letters[1:6], ncol=2)
d3 <- c("verde", "azul", "rosa")
e3 <- c(4i, 8i, 9i)
f3 <- c(5>2, 7<2, 8>3)
g3 <- date()

# --- Verificando o mode e class ---

# (a) 
mode(a3); class(a3)   

# (b) 
mode(b3); class(b3) 

# (c) 
mode(c3); class(c3)   

# (d) 
mode(d3); class(d3)   

# (e)
mode(e3); class(e3)   

# (f) 
mode(f3); class(f3)   

# (g) 
mode(g3); class(g3)  

