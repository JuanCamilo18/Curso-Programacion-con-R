
################################################################################
# TAREA 03: CURSO R
# Tema: Matrices, selección y operaciones.
# Nombre: Juan Camilo Panta Ipanaque
################################################################################

#------------------------------------------------------------------------------#
# Usted tiene las siguientes matrices.

set.seed(22222)

x<-cbind(rep(1,40),sample(1000:4000,40,T),sample(1:10,40,T))
x
y<-matrix(sample(1000:4000,40,T),ncol = 1)
y
# Cuál es el resultado si calcula

# (X′X)^(−1)* X′Y
#------------------------------------------------------------------------------#

## SOLUCION:

solve(t(x)%*%x)%*%t(x)%*%y

# comprobando
lm(y~x[,c(2,3)])






