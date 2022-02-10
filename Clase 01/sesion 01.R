
################################################################################
# SESIÓN 1: VECTORES, FACTORES Y LISTAS.

# Juan Camilo Panta
################################################################################

#----------------------
# R COMO CALCULADORA.
#----------------------

# Principales Operadores:

4+3    

5-7    

3*4    

6/2    

10%/%3  

10%%3 

4^3 

4**3

factorial(5)  

choose(5,3)   

sqrt(12)  

exp(1)    

log(3)  

abs(-2) 

#---
# Razones Trigonométricas.

# Los grados tienen que estar en radianes.

sin(pi/6) 
cos(pi/4) 
tan(pi/4)

#---
# Mostrar cifras.

print("operación", "el # de cifras que se desea") 

print(sin(pi/3), 4)

#---
# Redondear cifras.

round("operación", "el # de cifras que se desea")

round(sqrt(3), 5)

round(sqrt(3))

#---
# Definición de Variables.

y<- 4
y=4
4->y

x<-1:15

#---
# Definición de funciones:

f<-function(x){
  x^2+2
}

f(0)

Z<-function(z,y){
  z+4+4*y
}

Z(0,2)


pitagoras <- function(x,y){
  paste("La hipotenusa es: ", sqrt(x**2+y**2))
}
pitagoras(3,4)


area_circulo <- function(r){
  pi*r^2
}

gg <- function(x=2,y=4){
  x+y
}
gg(y=6)


# Imprimir caracteres
tt <- function(x){
  paste("Estas imprimiendo el número: ", x)
}
tt(8)


##################

N<- function(x){
  dnorm(x, mean =0.5, sd=0.1)
}

N(0.2)


N1<-function(q){
  pnorm(q, mean = 0.5, sd=0.1)
}

N1(0.2)

#---
#Gráfica de funciones:

plot(f)
plot(N)
plot(N1)

#---------------------------------------
# DEFINICIÓN DE VECTORES Y LISTAS EN R.
#---------------------------------------

#Vector Integer - Números enteros.

x<-c(1L,2L,3L,4L,5L,6L)
y<-c(1L,3L,5L,7L,9L,11L,13L)

#Vector Numeric - Números reales.

z<-c(1.3, pi, exp(1))
t<-c(sin(pi/4), log(45), tan(pi/3))

# Vector Logical - Caracteres lógicos.

m<-c(TRUE,FALSE,FALSE,TRUE)
p<-c(T,F,F,T,T,T,F)

# Vector Character - Palabras.

p1<-c("Luis", "María", "José")
p2<-c("12", "casa", "pi")

# Vector Complex - Números complejos.

c1<-c(1+2i, 4i, 3+6i)

#---
is.vector(z)
is.vector(p1)

#---
is.integer(v)
is.numeric(v)
is.character(v)
is.complex(v)

#---
# Vector de varias clases.

v<- c(12, "azul", 2+1i)

is.integer(v); is.numeric(v); is.logical(v); is.character(v); is.complex(v)

#---
#Vectores de elementos consecutivos.
x0<-1:5

#---
# Patrones en vectores.

x1<-rep(2,5)
x2<-rep("Luis",10)

#---
# Repetición de vectores.

r1<-rep(x0, time=3)
r2<-rep(x0, each=2)
r3<-rep(x0, each=3, time=2)

r5<-rep(x0, each=2, length=5)
r6<-rep(1:10, each=5, length=3)

# Repetición arbitratia de elementos del vector.
r7<-rep(1:6, c(3,0,1,0,4,2))

#---
# Progresiones aritméticas en vectores

v1<-seq(1, 20, by=2)
v2<-seq(40, 3, by=-4)
v3<-seq(1,50, length.out=10)
V4<-seq(1,10, along.with = x1)

#---
# Concatenar vectores

t2<-seq(1, 20, by=3)

t2<-c(0,t2)

t2<-c(t2, 20, 21)

#---
# Concatenación manual.

fix(t2)

#---
# Listas.

lista1<-list(1:6, c("raul","mario","maria"), c(4+2i, 3i+4))

names(lista1)

names(lista1)<-c("vec1","vec2","vec3")

lista1$vec1
lista1$vec2
lista1$vec3

lista2<-list(t1=1:8,t2=c("a","b","c","d","e"), t3=c(T,F,F,F,T))

names(lista2)

#---
# Contar elemenos de un vector.

x<-1:40
length(x)

y<-c("mar","rio","laguna")
length(y)

z<-c(1,1,1,2,3,4,5,3,2,1,23,5,7,86,2,4,5,6,7,87,6,5,6,54,23,6,452,12,3,3,4,5,7,8,9)
length(z)

#----------