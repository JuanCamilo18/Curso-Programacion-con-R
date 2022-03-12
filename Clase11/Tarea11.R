################################################################################
# TAREA 11: CURSO R
# Tema: Expresiones Regulares 01
# Nombre: Juan Camilo Panta Ipanaque
################################################################################

#------------------------------------------------------------------------------#

# Usted tiene el siguiente data frame

library(dplyr)
library(tibble)


set.seed(111111111)
df<-tibble(id=1:50,
           casa=sample(c("SI","NO"),50,T),
           semana_1=sample(c("SI", "NO"),50,T),
           semana_2=sample(c("SI", "NO"),50,T),
           semana_3=sample(c("SI", "NO"),50,T),
           semana_4=sample(c("SI", "NO"),50,T),
           semana_5=sample(c("SI", "NO"),50,T),
           semana_6=sample(c("SI", "NO"),50,T))
df

## La variable casa indica si se hizo o no una fiesta en su casa, y la variable 
# semana_* indica si se celebró o no la fiesta en la semana_1, semana_2, etc.

## Del formato corto en el que se encuentra pasar a formato largo. 
# Posteriormente calcular cuantas fiestas se realizaron en cada una de las semanas.

#------------------------------------------------------------------------------#

## SOLUCION:

df2 <- df %>% tidyr::gather(key = "Semana", value = "Valor", 3:8)
df2

# vemos cuantas fiestas
df2 %>% group_by(Semana) %>% count(Valor)


# cuantas fiestas si se realizaron
df2 %>% group_by(Semana) %>% 
  filter(Valor == "SI") %>% count(Valor)



