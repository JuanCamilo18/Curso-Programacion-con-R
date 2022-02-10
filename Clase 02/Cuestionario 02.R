

# Cuestionario 02
#----------------------------------------------------------------------#
# Ejemplo 1
# Si se tiene el siguiente vector:
tt<-c(1,1,1,2,3,4,5,3,2,1,23,5,7,86,2,4,5,6,7,87,6,5,6,54,23,6,452,12,3,3,4,5,7,8,9)

tt[8]  
# Y desea obtener el octavo elemento. Usaría...

#----------------------------------------------------------------------#

# Ejemplo 2:
# Si deseo calcular los quintiles del vector x.
# ¿Usando la siguiente sintaxis obtendría los quintiles?

x <- c(3,6,3,7,9,4,5,7)
quantile(x, probs=seq(0,1,by=5))

# Es verdadero o falso?
# FALSO

#----------------------------------------------------------------------#

# Ejemplo 3:
# ¿Si tengo dos elementos lógicos y los sumo obtendré como resultado
# un elemento numérico?

# VERDADERO

#----------------------------------------------------------------------#

# Ejemplo 4:
# Si deseo calcular la suma total de elementos de un vector numérico x. 

# Entonces usaría...
x <- c(3,6,3,7,9,4,5,7)
sum(x[1:length(x)-1])+x[length(x)]
sum(x)





