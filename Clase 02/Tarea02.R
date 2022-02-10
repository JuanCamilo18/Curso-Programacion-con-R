
################################################################################
# TAREA 02: CURSO R
# Nombre: Juan Camilo Panta Ipanaque
################################################################################

#------------------------------------------------------------------------------#
# Si tiene el siguiente vector:
  
x<-c(1,2,2,3,2,1,3,2,1,2,1,NA,3,4,2,3,5,6,4,NA,3,2,4,6,4,2,3,4,5,6,NA,4)
  
# Calcular la media, mediana, máximo, mínimo, varianza, desviación 
# estándar, el tamaño del vector y el coeficiente de variación. 
# Y mostrar los resultados en una lista con sus nombres respectivos.
  
# RECOMENDACIÓN: 
# El coeficiente de variación es la división entre la desviación 
# estándar y la media. Si tiene dudas puede consultarlo en internet.
#------------------------------------------------------------------------------#

## SOLUCION:

media <- mean(x, na.rm = T)
media
mediana <- median(x, na.rm = T)
maximo <- max(x, na.rm = T)
minimo <- min(x, na.rm = T)
varianza<- var(x, na.rm = T)
Desv_Estandar <- sd(x, na.rm = T)
Tamano <- length(x)
Coef_Var <- Desv_Estandar/media*100


# Lista 

lista_Estadisticos<-list(media, mediana, maximo, minimo, varianza,
                         Desv_Estandar, Tamano, Coef_Var)


names(lista_Estadisticos) <-c("Media", "Mediana", "Maximo", "Minimo", 
                              "varianza","Desviacion_Estandar", "Tamano",
                              "Coeficente_Variacion")

lista_Estadisticos


