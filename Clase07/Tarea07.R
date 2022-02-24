################################################################################
# TAREA 07: CURSO R
# Tema: Funciones I
# Nombre: Juan Camilo Panta Ipanaque
################################################################################

#------------------------------------------------------------------------------#

# Crear una función que calcule los percentiles del vector x. El único 
# argumento de esta función es el número que indique si serán terciles, 
# cuartiles, quintiles, etc. 

# Por ejemplo usted ingresará el número 10 en la función, R le calculará
# los deciles. 

# Importante.

# * La función debe contener un mensaje de error si el argumento de esta
# no es un elemento entero positivo
# * El vector x es:
x<-c(1:100,30,30,0,2,12,11,11,23,34,56,77,3,76,45,11,56:100, NA)
# * Si cree que debe de llevar algún otro error o mensaje de advertencia
# se le asignará un mayor puntaje. 

#------------------------------------------------------------------------------#

## SOLUCION:

percentiles<-function(p){
  
  x<-c(1:100,30,30,0,2,12,11,11,23,34,56,77,3,76,45,11,56:100, NA)
  
  if(!is.vector(x)){
    stop("El argumento x de la función no es un vector.")
  }
  if(p<=0){
    stop(" El argumento p debe ser un numero entero positivo.")
  }
  
  percentiles <-quantile(x,probs=seq(0,1, length.out = p+1),na.rm = T)
  return(percentiles)
}

percentiles(10)  
percentiles(4)
percentiles(-4)



