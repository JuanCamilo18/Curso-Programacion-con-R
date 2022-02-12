
################################################################################
# SESIÓN 3: MATRICES, SELECCIÓN Y OPERACIONES.

# GUÍA: Juan Camilo Panta Ipanaque
################################################################################

#------------------------------------
# MATRICES Y SELECCIÓN DE ELEMENTOS.
#------------------------------------

#---
# Convertir un vector en Matriz:

a<-matrix(1:12, nrow=3)
b<-matrix(1:12, ncol=3)
c<-matrix(1:12, nrow = 3, byrow = TRUE)
d<-matrix(1:12, nrow = 4, ncol = 4, byrow = TRUE)

#--------------------------
matrix(1:3, ncol = 3)
# para graficas
layout(matrix(1:6, ncol = 2))
layout.show(6)
#--------------------------

matrix(1:78, ncol = 10)

x<-seq(1,20, by=2)
x1<-c(x,20,20)

z<-matrix(x1, nrow=4)
z

#---
# Convertir varios vectores en matriz:

# rbind y cbind.

x2<-1:10
x3<-rep(2,10)
x4<-seq(2,5, length.out = 10)
x5<-seq(10,12, length.out = 10)

m1<-rbind(x2,x3)
m2<-cbind(x2,x3)

m3<-rbind(x2,x3,x4,x5)
m4<-cbind(x2,x3,x4)

A<-matrix(1:12, ncol = 3)
B<-matrix(20:31, ncol = 3)

cbind(A,B)
rbind(A,B)

#---
# Para cambiar nombre a las filas y columnas.

t<-rbind(c(2,3,4),c(4,4,4))
t

dimnames(t)=list(c("Periodo 1", "Periodo 2"),
                 c("Persona A", "Persona B", "Persona C"))
t

p<-cbind(seq(1,3,by=1),seq(2,4, by=1))
p
dimnames(p)=list(NULL,
                 c("Colegio A", "Colegio B"))
p

dimnames(p)=list(c("2010","2011","2012"),
                 NULL)
p

n1<-c("Edad","Sexo")
n2<-c("2018","2019","2020")

dimnames(p)=list(n2,n1)
p

set.seed(20)
t<-sample(1:20, 10)
t[6]

#---
# Para seleccionar elementos de una matriz.

p

p[1,]
p[2,]
p[,1]
p[,2]

p[1,2]
p[3,1]

m3

m3[3,4]

m3[,c(5,6,7)]
m3[,5:7]

m3[c(1,2),]

m3[,-3]

m3[-c(1,3),]

m3[-1,-5]

#-------------
set.seed(10000)
sexo<-sample(c("MUJER","VARÓN"), 30, T)
civil<-sample(c("CASADO","SOLTERO"), 30, T)

tab1<-table(sexo, civil)

tab1[tab1=="CASADO"]
tab1[,1]
tab1[,2]
tab1[1,]
tab1[1,2]

#---
# dimensión de la matriz

dim(m3)

dim(p)

dim(m3)[1]  # El número de filas.

dim(m3)[2]  # El número de columnas.

#---------------------------
# OPERACIONES CON MATRICES.
#---------------------------

A<-matrix(1:9, nrow = 3, byrow = TRUE)

a<-c(4,5,4)
b<-c(3,4,4)
d<-c(8,7,7)
B<-rbind(a,b,d)
B

A+B

A-B

4*A

A%*%B # multiplicar matrices

A2 <- A%*%A

A%*%A%*%A%*%A # la matriz a la 4

#==============================================
#Para calcular las potencias de las matrices.

# install.packages("Biodem")
library(Biodem)
#==============================================

AA<-mtx.exp(A,2)
A2==AA

A5<-mtx.exp(A,5)
A5

Biodem::mtx.exp(A,7)

#---
# Álgebra lineal de matrices.

t(A)

diag(A)

sum(diag(A))

# crea funcion q halle la traza
traza <- function(x){
  sum(diag(x))
}
traza(A)


det(B)

A.i<-solve(A)
# no tiene inversa la matriz A
B.i<-solve(B)
B.i

te<-qr(B)


qr(B)$rank
qr(A)$rank

chol(B)  # Sólo para matrices simétricas y definidas positivas.

var(B)

#---
# Solución de sistema de ecuaciones.

# 2x+3y=1
# 3x-7y=2


D<-matrix(c(2,3,3,-7), nrow = 2, byrow = TRUE)
v<-c(1,2)

solve(D,v)

#---
# Valores y Vectores propios.

eigen(D) 
eigen(D)$values  
eigen(D)$vectors

E<-matrix(c(2,3,3,7), nrow = 2)
eigen(E)$values

#---------
# Tablas.
#---------

set.seed(2022)
x<-sample(month.name, 100, T)
y<-sample(1:10,100,T)
z<-sample(0:1,100,T)

table(x)
table(x,y)
table(x,y,z)

set.seed(20221)
año<-sample(2018:2022,100,T)
alumnos<-sample(c("MUJERES","HOMBRES"),100,T)

table(año, alumnos)

prop.table(table(año, alumnos),1)
prop.table(table(año, alumnos),2)

prop.table(table(año, alumnos),c(1,2))


addmargins(table(año, alumnos),1)
addmargins(table(año, alumnos),2)

as.matrix(table(año, alumnos))

#---
# Usando operadores lógicos.

table(año==2018, alumnos)
table(año<2020, alumnos)
table(año, alumnos=="MUJERES", exclude="FALSE")









