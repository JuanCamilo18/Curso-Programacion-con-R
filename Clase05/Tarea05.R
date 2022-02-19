################################################################################
# TAREA 05: CURSO R
# Tema: Condicionales y bucles.
# Nombre: Juan Camilo Panta Ipanaque
################################################################################

#------------------------------------------------------------------------------#

# A usted le entregan el siguiente data frame.

set.seed(101010101)
df<-data.frame(id=sample(1:1000,500,T),
               edad=sample(18:70,500,T),
               sexo=sample(c("HOMBRE","MUJER"),500,T),
               ingreso=sample(1000:10000,500,T))
df
# Le indican que tiene que convertir el ingreso en una variable categórica. 

## Donde, si el ingreso es menor a 2000, entonces, su etiqueta será 
# "Menos de 2000"; si el ingreso es mayor o igual a 2000 y menor a 5000, 
# entonces, su etiqueta será "Entre 2000 y 5000"; por último, si el 
# ingreso es mayor o igual 5000, entonces, su etiqueta será "Mayor a 5000".

# Una vez que ha codificado, mostrar una tabla de esta nueva variable. 

# Importante. 

# Solo usar las funciones if(), else if(), else() y for(). Si usa otra 
# función tendrá una nota igual 0.
#------------------------------------------------------------------------------#

## SOLUCION:

df$ingre2 <- c(1:length(df$ingreso))
for (i in 1:length(df$ingreso)){
  if(df$ingreso[i] < 2000){
    df$ingre2[i] <- "<2000"
  } else if(df$ingreso[i]>=2000 & df$ingreso[i]<=5000){
    df$ingre2[i] <- "Entre 2000 y 5000"
  } else{
    df$ingre2[i] <- ">5000"}}


## tabla
df$ingre2 <- factor(df$ingre2,levels = c("<2000","Entre 2000 y 5000",">5000"),
                    labels =c("<2000","Entre 2000 y 5000",">5000"), 
                    ordered = T)
table(df$ingre2)






