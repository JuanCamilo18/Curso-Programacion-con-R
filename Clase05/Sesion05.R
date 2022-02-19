################################################################################
# SESIÓN 5: CONDICIONALES Y BUCLES.

# GUÍA: Juan Camilo Panta Ipanaque
################################################################################

#------------------
# Condicional if.
#------------------

# if("Condición lógica"){"Se realiza la operación si cumple la condición"}

if(TRUE){
  print("Soy verdadero")
}


## creo un vector, de q numero q este  entre 1 y 5
z<-sample(1:5, size = 1)

if(z==1){
  z1<-"Es Verdadero"
}


# ------------
# Se escoge a 3 ganadores. Cada uno tiene un número que va desde el 1 al 10.
x<-factor(sample(1:10, size = 3),
          levels = 1:10,
          labels = c("Juan","Luis","Pedro","Manuel","Dario",
                     "Marcos","Dante","saul","Jesús","María"))

# si juan pertenece a x, entonces el ganador es juan
# convierte a mayuscula
if(toupper("Juan") %in% toupper(x)){
  print("El ganador es Juan")
}

if(1 %in% as.numeric(x)){
  print("El ganador es Juan")
}
# -----------

#---anteior
y<-c(1,2,3,NA,6,NA,9)
sum(is.na(y))


#---
# Condicional if - else.

# if("Condición lógica"){
# "Se realiza la operación si cumple la condición"
# } else {
# "Se realiza la operación si  no se cumple la condición"
# }

z<-sample(1:5, size = 1)

if(z==1){
  z1<-"Es Verdadero"
} else {
  z1<-"Es Falso"
}

x<-factor(sample(1:10, size = 3),
          levels = 1:10,
          labels = c("Juan","Luis","Pedro","Manuel","Dario",
                     "Marcos","Dante","saul","Jesús","María"))

if(toupper("Juan") %in% toupper(x)){
  print("El ganador es Juan")
} else {
  print("Juan es un perdedor")
}


#-----------
# Condición if - else anidados.

# if("Condición 1"){
# "Se realiza la operación si cumple la condición 1"
# } else if ("Condición 2"){
#     " Se realiza la operación si no se cumple la condición 1 y si la condición 2"
#     }  else {
#     "Se realiza la operación si no se cumple la condición 1 y la condición 2"
#     }
# }

x<-factor(sample(1:10, size = 3),
          levels = 1:10,
          labels = c("Juan","Luis","Pedro","Manuel","Dario",
                     "Marcos","Dante","saul","Jesús","María"))
x

if("Juan" %in% x){
  print("Juan es el ganador")
} else if("Luis" %in% x){
  print("Luis es el ganador")
} else if("Dario" %in% x){
  print("Dario es el ganador")
} else {
  print("Juan, Luis y Dario son unos perdedores")
}


#-----------
# Ciclo for.
#-----------

# for ("iterador" in "vector") {
#  "Operación"
# }

# El uso más común es:

for (i in 1:5){
  print("Impreso")
}

for (i in 1:8) {
  print(paste("La iteración", i))
}

x<-c("Arsenal","Chelsea","M.City","M,United","Liverpool","Tottenham")

for (var in 1:length(x)) {
  print(paste("El mejor equipo es:", x[var]))
}

for (var in 1:length(x)) {
  print(paste("El mejor equipo es:", var))
}

for (var in x) {
  print(paste("El mejor equipo es:", var))
}


x<-c("A","B","C", "D")

for (i in 1:length(x)) {
  print(paste0("La letra: ", x[i]))
}

for (i in c(1,4)) {
  if(x[i]=="D"){
    print(paste("La iteración: ", i))
  } else {
    print("No es la D")
  }
}

x<-c("Arsenal","Chelsea","M.City","M,United","Liverpool","Tottenham")

for (var in 1:length(x)) {
  if(var>3) {
    print("Estos son los 3 mejores equipos")
    break
  } else {
    print(paste("EL mejor equipo es:", x[var]))
  }
}

#--------------
# BUCLE WHILE.
#--------------

# while ("condición") {
#  "Operación si la condición se cumple"
# }

#---
# Usando sólo una condición.

z<-5

while (z<9) {
  print("Es verdad")
  z<-z+1
}


while(TRUE){
  print("Detenme")
}

# Para Calcular los valores que toma el rango de una función hasta
# que alcance el mínimo o máximo valor.

# Definimos la función:

fx<-function(x){
  3*x^2+4*x
}

plot(fx, xlim = c(-6,6))

f<-expression(3*x^2+4*x) # expresion matematica programa

df<-D(f,"x") # funcion y variable a derivar

d2f<-D(df,"x") # volvemos derivar

x<- -3
y<- fx(-3)

while (x<=-0.75) {
  x<- x+0.25
  y<- c(y,3*x^2+4*x)
}

plot(y, type = "l", xlab = "Iteracciones", ylab = "Rango de la Función f")

#---
# Usando dos condiciones.

z1<-4
y1<-4

while (z1>=0 & z1<=10) {
  z1<-z1+sample(c(-1,1), size = 1)
  y1<-c(y1,z1)
}

plot(y1, type = "l")

#---

z1<-4
z2<-4
y2<-4
y3<-4

while (z1>=0 | z2<=7) {
  z1<-z1+sample(c(-1,1), size = 1)
  z2<-z2+sample(c(-1,1), size = 1)
  y2<-c(y2,z1)
  y3<-c(y3,z2)
}

plot(y2, type = "l")
plot(y3, type = "l")


#---
# Uso de la Función break y next.

# Función Break:

r<-1
ganadores<-0
while (TRUE) {
  ganador<-factor(sample(1:10, size=r),
                  levels=1:10,
                  labels=c("Arsenal","chelsea","M.United","M.City",
                           "Tottenham","Liverpool","Everton","Burnley",
                           "Watford","Wolves"))
  ganadores<-c(ganadores,ganador)
  if(toupper("Arsenal") %in% toupper(ganador)) {
    break
  }
  else {
    r<-r+1
  }
}

# Función next:

t<-1
while(t<10){
  t<-t+1
  if(t==3){
    next
  }
  print(t)
}

#---
# La ecuación a encontrar solución.
# x^2+2*x-3=0

# EL ciclo while.
x<-0
while (TRUE) {
  y<-x**2+2*x
  if(round(y,3)==3){
    print(paste0("La raíz o solución de la ecuación es: ", x))
    break
  }
  x<-x+0.001
}

#---
set.seed(2021)
t<-sample(1:50, 20)
t

r<-0
while(r<=length(t)-1){
  r<-r+1
  if(t[r]%%5==0){
    next
  } else{
    t[r]<-t[r]+1000
  }
}

t

#---
# P=600−4Q ---> 600Q -4Q**2  ----> Ing Marginal: 600-8Q
# CT=Q**2+8000   -----> C Marginal2Q

produccion<-10
beneficios<-c()

while (produccion<=110) {
  IMg<-600-8*produccion
  CMg<-2*produccion
  IT<-600*produccion-4*produccion^2
  CT<-produccion^2+8000
  beneficios<-c(beneficios,IT-CT)
  if(IMg-CMg==0){
    print(paste0("La producción máxima se alcanza cuando se produce: ",
                 produccion," unidades"))
  }
  produccion<-produccion+1
}


df<-data.frame(produccion=10:110,
               beneficios=beneficios)

library(ggplot2)
library(ggrepel)

ggplot(df, aes(x=produccion,y=beneficios))+
  geom_line(size=1.3)+
  scale_x_continuous(breaks = seq(10,110,10))+
  scale_y_continuous(breaks = seq(min(beneficios),max(beneficios),1000))+
  geom_vline(xintercept = 60, color="red")+
  geom_label(x=70, y=max(beneficios)-500,label="Máximo\nBeneficio")+
  geom_point(x=60,y=max(beneficios), size=5, color="blue")+
  labs(title = "MAXIMIZACIÓN DE BENEFICIOS DEL PRODUCTOR")+
  theme_bw()



