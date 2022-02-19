################################################################################
# TAREA 04: CURSO R
# Tema: Creación de data frames.
# Nombre: Juan Camilo Panta Ipanaque
################################################################################

#------------------------------------------------------------------------------#

#Si tiene el siguiente data frame

set.seed(9999)
df<-data.frame(casas=sample(1:5,500,T),
               ingresos=sample(1000:5000,500,T),
               sexo=sample(c("M","F"),500,T),
               estrato=sample(LETTERS[1:5],500,T))
df
## Filtre las personas que son solo del estrato "A".
## Filtre las personas que tienen ingresos mayores a 3000 y 
# que son del estrato "B",
## Cuántas personas son del sexo femenino, tienen 2 casas y son 
# del estrato "E"?
## Cuántas personas tienen ingresos superiores a 4000?
## Ordene el data frame por número de casas e ingresos y muestre a 
# las 10 primeras observaciones.
#------------------------------------------------------------------------------#

## SOLUCION:
str(df)

## Filtre las personas que son solo del estrato "A".
df[df$estrato=="A",]
subset(df, subset = estrato=="A")


## Filtre las personas que tienen ingresos mayores a 3000 y 
# que son del estrato "B",
df[df$ingresos > 3000 & df$estrato=="B", ]
subset(df, ingresos>3000 & estrato=="B")

## Cuántas personas son del sexo femenino, tienen 2 casas y son 
# del estrato "E"?
df[df$sexo=="F" & df$casas==2 & df$estrato=="E", ]
subset(df, sexo=="F" & casas==2 & estrato=="E")

## Cuántas personas tienen ingresos superiores a 4000?
dim(df[df$ingresos>4000,])[1]

## Ordene el data frame por número de casas e ingresos y muestre a 
# las 10 primeras observaciones.
df2<-df[with(df, order(df$casas, df$ingresos)),]
head(df2,10)




