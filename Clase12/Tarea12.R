################################################################################
# TAREA 12: CURSO R
# Tema: Expresiones Regulares II
# Nombre: Juan Camilo Panta Ipanaque
################################################################################

#------------------------------------------------------------------------------#

# En el siguiente df:

df<-data.frame(col1=c("23","-23", "23-25","123-125","-134","3-500","30-500",
                      "3-4","-11","-44","-55","45-76"))
df

## Y deseo quitar el guión cuando va delante de un número que no es un 
# intervalo, es decir -23 lo cambio por 23, pero 23-25 lo dejo tal cual.

## ¿Cómo sería la sintaxis para solucionar este problema.?

#------------------------------------------------------------------------------#

## SOLUCION:

df$col1

gsub("^\\W","", df$col1)

gsub("^\\-","", df$col1)
gsub("^[-]","", df$col1)
gsub("^-","", df$col1)




