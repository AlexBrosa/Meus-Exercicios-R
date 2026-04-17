##########################################
# Lista de exercícios 1
# Autor: Alexandre Bentaberry-Rosa
# Data: 16/04/2026
##########################################

################## Exercicio Lista 5 ################## 

# a 

ldl_funcao <- function(CT, HDLc, TG) {
  
  # Verifica se TG é alto
  if (TG >= 400) {
    warning("TG >= 400 mg/dL: resultado impreciso")
  }
  
  VLDLc <- TG / 5
  LDLc <- CT - HDLc - VLDLc
  
  return(LDLc)
}

#Testando a funçao
ldl_funcao(192, 54, 150) #Se TG < 400, nenhum alerta aparece
ldl_funcao(192, 54, 450)  #Se TG>= 400, alerta aparece


#b

hiperlipidemia_mista <- function(LDLc, TG, jejum = TRUE) {
  
  limite_TG <- ifelse(jejum, 150, 175)
  
  if (LDLc >= 160 && TG >= limite_TG) {
    warning("Hiperlipidemia mista detectada")
  }
}

hiperlipidemia_mista(170, 160, TRUE) #Aqui o paciente esta em jejum
hiperlipidemia_mista(170, 160, FALSE) #Aqui o paciente nao esta em jejum, ou seja, sem alerta.


#C

LDLc <- 170
TG <- 140
limite_TG <- 150

if (LDLc > 160 && TG < limite_TG) {
  warning("Hipercolesterolemia isolada detectada")
} # O alerta vai se ativar pois LDLc > 160

