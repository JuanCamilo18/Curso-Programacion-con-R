################################################################################
# Sesión 2: Vectores, selección y operaciones.

# Juan Camilo Panta
################################################################################

#----------------------
# Vectores aleatorios.
#----------------------
sample(x=1:10, size = 5)

set.seed(10)
sample(x=1:10, size = 5)

set.seed(12)
sample(x=c("LUIS","MARÍA","JUAN","ROBERTH","CARLOS","FLOR"), size = 2)

set.seed(1805)
sexo<-sample(x=c("HOMBRE", "MUJER"), size = 100, replace = T)

table(sexo)

prop.table(table(sexo))

set.seed(1805)
sexo<-sample(x=c("HOMBRE", "MUJER"), size = 100, replace = T, prob = c(0.3,0.7))
#sexo
prop.table(table(sexo))


set.seed(2020)
experimento<-sample(c("CARA","SELLO"), 200, T)
round(prop.table(table(experimento))*100,4)

experimento<-sample(c("CARA","SELLO"), 1000, T)
round(prop.table(table(experimento))*100,4)

experimento<-sample(c("CARA","SELLO"), 10000, T)
round(prop.table(table(experimento))*100,4)

experimento<-sample(c("CARA","SELLO"), 100000, T)
round(prop.table(table(experimento))*100,4)

#--------------------------------------
# FACTORES - CODIFICACIÓN DE VECTORES.
#--------------------------------------

# El vector de género de un salón:

g<-c(1,2,1,2,2,2,2,1,2,1,2,1,
     2,1,2,1,1,2,1,2,1,1,1,2,2)  # Vector de 1 y 2 que representan el género.

table(g)
set.seed(1)
g<-sample(1:2, 5000, T)

table(g)


g1<-factor(g)   
View(g1)

g2<-factor(g,
           levels = c(1,2),
           labels = c("Masculino","Femenino")) 
# vemos datos etiquetados
g2
table(g2)

#---
# Otro ejemplo.

# genero 500 numeros entre 1 y 10 con remplazo.
base<-sample(1:10,500,T)

table(base)

base<-factor(base,levels = 1:10,labels = c("Sin Nivel","Inicial","Primaria Incompleta",
                                           "Primaria Completa","Secundaria Incompleta",
                                           "Secundaria Completa","S.NU. Incompleta",
                                           "S.NU. Completa","S.U. Incompleta",
                                           "S.U. Completa"))

table(base)


#---
res<-c("a","b","b","d","e","a","c","d","a","e")

# pasamos a numero
as.numeric(factor(res,levels = c("a","b","c","d","e"), 
       labels = c("A", "B", "C", "D", "E")))

# con orden de las etiquetas
factor(res,levels = c("a","b","c","d","e"), 
       labels = c("A", "B", "C", "D", "E"), ordered = T)
# otra forma
res<-ordered(res, levels=c("a","b","c","d","e"))

str(res)

levels(res)

r<-1:29

t2<-as.character(r)
as.numeric(t2)


res1<-as.numeric(res)

#---
set.seed(2021)
sexo<-sample(c("MASCULINO", "FEMENINO"), 33, T)
sexo1<-as.factor(sexo)
str(sexo1)
levels(sexo1)

sexo2<-factor(sexo, levels = c("MASCULINO","FEMENINO"))
str(sexo2)

# tener en cuenta q sea el mismo nombre y mayuscula sino sale NA
sexo3<-factor(sexo, levels = c("masculino","FEMENINO"))

sexo4<-factor(sexo, levels = c("MASCULINO", "FEMENINO"),
              labels = c("masculino", "femenino"))

set.seed(2021)
x<-sample(c("A","B","C","D"), 30, T)
factor(x)

factor(x, exclude = "B")

#---------------------------
# Operaciones con vectores.
#---------------------------

x<-1:8
y<-seq(3,27, length.out = 8)

#---
# Operaciones básicas.

x+y           

x-y

x%*%y        

x*y          

sum(x*y)   

#---
# Operaciones estadísticas.

t1<-c(1,4,5,6,13,8,9,10)

mean(t1)       

median(x)     

max(x)        

min(x)        

prod(x)       

sum(x)        

cumsum(x)     

diff(t1)       

quantile(t1)   
quantile(t1, probs = c(0, 0.33, 0.66))  

quantile(x, probs = c(0, 0.2,0.4,0.6,0.8,1))
quantile(x, probs = seq())

# seq, saca secuencia 
quantile(x,probs=seq(0,1, length.out = 11))

quantile(t1, seq(0,1, length.out = 4), na.rm = T)

#---
# Para ordenar los elementos del vector.

t<-c(1,3,4,2,10,7,5,18,6)

sort(t)     

sort(t, decreasing = TRUE)  

# cambiar el orden del vector
rev(t)    

#---
# GRÁFICO.

# Definiendo los vectores:
m<-c(3,8)
m
p<-c(10,2)
p

# Suma de vectores.
a<-m+p
a

# Para poder graficarlo, la sintaxis es la siguiente:

# Para graficar el primer vector (vector m):
plot(3,8, xlim=c(0,14), ylim=c(0,12),
     xlab="Eje x", ylab="Eje y", lwd=3,
     col="blue", bty="n")
axis(side = 1, 0:14)
axis(side = 2, 0:12)
arrows(0,0,3,8,col="blue")
abline(h = pretty(0:12, 12), v = pretty(0:14, 14), col = "lightgray")

# Para graficar el segundo vector (vector p):
points(10,2,lwd=3,col="green")
arrows(0,0,10,2,col="green")

# Para graficar el vector resultante de la adición de los 2 vectores (a=m+p)
points(13,10,lwd=3,col="black")
arrows(0,0,13,10,col="black")

# Agregando las líneas imaginarias para formar el paralelogramo que representa la adición de 2 vectores.
arrows(3,8,13,10,col="blue",lty=3)
arrows(10,2,13,10,col="green",lty=3)

#---------------------------------
# Selección y operadores lógicos.
#---------------------------------

x<-c(2,1,3,12,43,43,6,8,62,9,0,5,23,42,4,1,3)

x[11]

#---
# Selección de elementos.

x[4]                
x[12]               
x[length(x)]        
x[3:6]              
x[-2]               
x[-(3:6)]

#---
# Operadores Lógicos.

# Igualdad "==".

x[x==43]
x[x==17]            

# Mayor que ">".

x[x>3]              
x[x>100]            

# Menor que "<".

x[x<5]              

# Mayor igual que ">=".

x[x>=8]             

# Menor igual que "<=".

x[x<=8]             

# Diferente "!=".

x[x!=3]             

# Negación "!".

x[!x<5]

# y "&".

x[x>3 & x<10]       

# o "|".

x[x>3 | x<10]       
x[x!=0 | x>5]

# Pertenece "%in%"

5 %in% x #  pertenece a x?

x %in% 5

set.seed(20)
x<-sample(c("A","B","C","D"),20,T)

x=="A" | x=="B" | x=="C"

x %in% c("A","B","C") # mejor

# tambien && ... y ... ||


#---
# Para la posición tras cumplimiento de la condición lógica.

x<-c(2,1,3,12,43,43,6,8,62,9,0,5,23,42,4,1,3)


set.seed(12)
ro<-sample(1:3000, 3000, T)

which(ro==821)
ro[c(350,1462,2110,2828)]


which(x==3)     
which(x!=3 & x<5)

x[c(1,2,11,15,16)]

#---
# Para cambiar valores de elementos del vector.

x[5]<-1000

x[7]<-2000

x[c(1,5)]<-x[c(1,5)]+5

x[which(x==3)]<-x[which(x==3)]+100

#---