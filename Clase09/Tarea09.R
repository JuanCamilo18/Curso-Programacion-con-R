################################################################################
# TAREA 09: CURSO R
# Tema: Manipulacion de Datos con Dplyr
# Nombre: Juan Camilo Panta Ipanaque
################################################################################

#------------------------------------------------------------------------------#

# Responder solo usando las funciones del paquete dplyr.

# Si tiene el siguiente data frame.

library(dplyr)
library(tibble)

set.seed(9999)
df<-tibble(casas=sample(1:5,500,T),ingresos=sample(1000:5000,500,T),
           sexo=sample(c("M","F"),500,T),estrato=sample(LETTERS[1:5],500,T))


## 1. Filtre las personas que son solo del estrato "A".

## 2. Filtre las personas que tienen ingresos mayores a 3000 y que son 
# del estrato "B",

## 3. Cuántas personas son del sexo femenino, tienen 2 casas y son del 
# estrato "E"?

## 4. Cuántas personas tienen ingresos superiores a 4000?

## 5. Ordene el data frame por número de casas e ingresos y muestre a las 
# 10 primeras observaciones.

#------------------------------------------------------------------------------#

## SOLUCION:


## 1. Filtre las personas que son solo del estrato "A".
df %>% filter(estrato == "A")


## 2. Filtre las personas que tienen ingresos mayores a 3000 y que son 
# del estrato "B",
df %>% filter(ingresos > 3000 & estrato=="B")


## 3. Cuántas personas son del sexo femenino, tienen 2 casas y son del 
# estrato "E"?
df %>% 
  filter(sexo=="F" & casas==2 & estrato=="E") %>%
  count()


## 4. Cuántas personas tienen ingresos superiores a 4000?
df %>% 
  filter(ingresos > 4000) %>% 
  count()


## 5. Ordene el data frame por número de casas e ingresos y muestre a las 
# 10 primeras observaciones.
df %>% arrange(casas, ingresos) %>% 
  head(10)







