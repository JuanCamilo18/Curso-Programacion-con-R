################################################################################
# TAREA 08: CURSO R
# Tema: Funciones II
# Nombre: Juan Camilo Panta Ipanaque
################################################################################

#------------------------------------------------------------------------------#

# Crear una función que calcule el PBI por el método del gasto. 

# El PBI por el método del gasto viene definido por:
  
#  PBI = CONSUMO + INVERSION + GASTO + EXPORTACIONES - IMPORTACIONES

# Esta función debe tener como argumentos cada uno de los componentes del PBI. 
# Cuando se ejecute la función el resultado debe ser el PBI. 
# Entonces, una vez creado la función calcular el PBI del siguiente data frame.

set.seed(2020202)
pais<-data.frame(CONSUMO=sample(10000:10000,50,T),
                 INVERSION=sample(1000:1000,50,T),
                 GASTO=sample(100:2000,50,T),
                 EXPORTACIONES=sample(5000:10000,50,T),
                 IMPORTACIONES=sample(5000:20000,50,T))

# El resultado debe de ser el data frame "pais" en donde estén estas 
# cinco variables y el PBI.

#------------------------------------------------------------------------------#

## SOLUCION:









