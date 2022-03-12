
################################################################################
# SESIÓN 11: MANIPULACIÒN DE CARACTERES I.

# GUÍA: Juan Camilo Panta Ipanaque.
################################################################################

# A mayúsculas. 
toupper("maiz")

# A minúsculas.
tolower("RAYA")

x<-"manipulación de caracteres"
y<-c("Arsenal", "Chelsea", "Tottenham",
     "Manchester City", "Manchester United", "Liverpool")


#---
# Contar Caracteres.

# Para contar cuantos caracteres

nchar(x)

nchar(y)


# table(dni)
# ifelse(nchar(dni==7), paste("0",dni), dni)


#---
# Para extraer subcadenas.

# substr("vector", "star=", "stop=")

substr(x, start = 3, stop = 6)

substr(x, 4, 9)

substr(y, 1, 3)

z<-substr(y, 1, 3)
z

# substring("vector", "first=", "last=10^6")

substring(x, first = 10)

substring(y, 4)

substring(y, 1, 3)


# El inicio y el final también pueden ser vectores (sólo substring).

substring(x, c(1,2,3), c(1,2,3))

substring(y, c(1,2,3), c(2,3,4)) # comienza en 1 y termina en 2; c2t3, c3t4

# También se puede modificar.
x

substr(x, 1, 1)<-"M"  
x

substr(x, 2, 4)<-"123"
x


substring(z[c(4,5)], 2, 3)<-c(".C", ".U")    # Para distinguir a los
# dos manchester.
z

w<-"yo como papel"

substring(w,9)<-"galleta"
w # cambia el mismo tamaño de caracteres

w<-"yo como papel"
gsub("papel", "galleta", w)


# Ejemplo para datos con la ENAHO.

library(haven)
library(dplyr)

df<-read_dta("G:/Cursos22/ProgramacionR/CursoProgR/Clase06/enaho01-2020-200.dta")

df %>% select(ubigeo)

# Para crear la variable departamento.

df$region<-substring(df$ubigeo, 1,2)

table(df$region)

datametria::dpto_peru(df$region)

#-------------------------------------------------------------------------------
#---
# Separar una cadena en partes.

x<-c("Fruta1;Mango", "Fruta2;Naranja",
     "Fruta3;Mandarina", "Fruta4;Plátano")

x %>% as.data.frame()

x<-strsplit(x, ";")   

unlist(x)
x

#---
# sustituir caracteres.

# chartr("old", "new", "Vector")

w<-c("bailo","nado","camino")

chartr("o","ó",w)

z<-c("Manana", "nandu","nono", "Ano", "Canon",
     "Senor", "Bano","Cano", "Tamano", "Estano")

chartr("n", "ñ", z) # reemplaza todos n

#---
# Función sub y gsub.

# sub("Pattern", "Replacement", "Vector", "Ignore.case= T o F")

# gsub("Pattern", "Replacement", "Vector", "Ignore.case= T o F") ; usa Exp Reg

# Pero si sólo se desea reemplazar las primeras n por ñ.

sub("n", "ñ", z)

# Usos básicos de sub y gsub.

p<-c("Excel es el mejor programa",
     "Las mejores tablas estadísticas se desarrollan en Excel",
     "Los gráficos de Excel son lo máximo",
     "Excel es todo para mi", "¿Excel?, sí Excel es el mejor")

sub("Excel", "R", p)

# Pero si deseamos cambiar todos los Excel.

gsub("Excel", "R", p)

t<-c("Realizo mis documentos en word",
     "Word es muy fácil")

gsub("word", "Latex", t) # mayuscula, minuscula
gsub("word", "Latex", t, ignore.case = TRUE) # iggnora mayuscula y minusculas


#---
# Función grep: devuelve posicion se encuentra en caracter
y<-c("azul","amarillo","naranja","rojo","morado","violeta","marrón")

grep("a",y)

grep("e",y)

grep("i",y)

grep("i",y, invert = T) # donde no esta la i

# Función Grepl.
y<-c("La tierra es el tercer planeta del sistema solar",
     "La tierra es, hasta ahora, el único planeta habitable")

grepl("tierra", y)

grepl("sol", y)

grepl(c("tierra", "ah"), y)

# un problema solo busca un elemento, para eso usamos expresiones regulares Prx Clase

#---
# Comando cat.

# cat("Objetos", "sep =")

z<-c("Luis", "Juan", "Hector")

cat("Mi mejor amigo es: ", z[1])
cat("Mi peor amigo es:", z[2], sep = "")



# mas usados
# grepl, gsub, nchar

