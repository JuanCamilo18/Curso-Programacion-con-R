################################################################################
# SESIÓN 12: MANIPULACIÒN DE CARACTERES II - EXPRESIONES REGULARES.

# GUÍA: Juan Camilo Panta Ipanaque.
################################################################################

#------------------------
# Expresiones Regulares.
#------------------------

gsub("Maria","Ana", c("Juan","Ramiro","Maria"))

# Expresión | , (operador o )

gsub("word|excel", "R", c("word es un buen programa", "excel es el mejor"))

gsub("R|A|P|O", "4", c("RAUL","HOY","PADRE","88"))

# Expresión ^ , (empizan con)

gsub("^w", "X", c("walter", "wilson", "waldo", "wawa"))
gsub("^5", "A", c("55","88","456","105"))

# Expresión $ , (que termine con )

gsub("e$", "é", c("Empece", "Pele", "Pate", "soñe", "te", "preste"))

gsub("^azul$","cambio", c("azulejo","azul","azulazul","azu")) # palabra "azul" sola
gsub("^azul","cambio", c("azulejo","azul","azulazul","azu")) # comience en azul
gsub("azul","cambio", c("azulejo","azul","azulazul","azu"))
grepl("azul", c("azulejo","azul","azulazul","azu")) #no

# Expresión [] , (cambia tengan 1 o 2)

gsub("[12]", "Maíz", c("45 kilos de 1", "Exportación de 2"))

gsub("[0-2]", "mama", "1,2,5,6,8,4,58") # Cuando empiece con 0 al 2 cambie con mama

gsub("[a-z]", "99", c("a","azul","8","pedro")) # empize del a hasta z cambie

gsub("^[13]", "mama", c("13","131","331","papa","313")) # cuando empieze con 1 o 3 caambia mama

gsub("^13$", "mama", c("13","131","331","papa","313")) # solo busca el 13

gsub("^1[34]$", "mama", c("13","131","331","papa","313")) # solo 13 o 14 tambien (empiecen en 1 y acaben en 3 o 4)

gsub("^12[34]$", "mama", c("13","121","124","papa","123","3123")) # solo 123 o 124

# Expresión [^ ] , (la potencia dentro corchete es negar)

gsub("[^0-3]", "T", "2,3,4,6,5,3,1,9") # cambia lo q no sea 0,1,2,3
gsub("[^0-3]", "T", c("2","3","4","6","5","3","1","9"))

gsub("[^0-3]", "T", c(2,3,4,6,5,3,1,9))

gsub("[^a]", "4", c("azul","99","raul"))

# Expresión + , (cambia donde hallas 1 o mas veces el caracter por 1 vez)

gsub("4+", "x", c("1,2,3,4", "11,22,33,44", "43,22,444,4444")) # cambia donde halla ek 4 o mas por el x

gsub("a+", "8", c("raul es muy amistoso y amigable, azul")) # 

# Expresión * (cambia donde hallas 1 o mas veces el caracter por varias veces)

gsub("ma*", "5", "Mi mama es mala")

# Expresión {} , (el caracter {n} "n veces o n caracteres juntos" cambia)

gsub("1{2}", "mar", "1,32,11,3,54,65,111,65") # el 1 se repite dos veces cambia

gsub("1{4}", "mar", "1,32,11,3,54,65,111,65,11111,1111,111114")

gsub("1{1,3}", "mar", "2,1,22,34,554,11,23,111,1111") # busca el 1 o 11 o 111, en el ultimo 111, 1 
# R comienza por el mayor osea 111 luego 11 y 1

gsub("1{3,}", "sol", "1,2,1,11,3,111,211,1111,243211") # 3 o mas 1 juntos

gsub("1{3,}", "sol", "1,2,1,11,3,111,211,1111,243211, 111111111") # ultimo 1 vez xq va al mayor

# ---------------

# buca un digito

gsub("\\d", "X", c("azul","2"))

# [12] encuentra el 1 o el 2 seguido de 3 numeros
gsub("[12]\\d{3}", "DOS MIL DIECISIETE", "Cambia el año 2049")
gsub("[12]\\d{3}", "DOS MIL DIECISIETE", "Cambia el año 1049")
gsub("[12]\\d{3}", "DOS MIL DIECISIETE", "Cambia el año 3049")

# Expresión . ( el punto busca cualquier caracter)

gsub(".", "4", "9 veces 4")

  # Busco el operador . (punto)
  gsub("\\.", "4", "Mas alla. Me voy.")
  gsub("[.]", "4", "Mas alla. Me voy.")  # igual arriba, entre corchetes los especiales

# Expresión \\d , (busca un digito y la llave de tamaño 2)

gsub("\\d{2}", "si", "1,22,2,4,333,55,66,666")
gsub("\\d{2}", "si", "1,22,2,4,333,55,66,666, 45")

# Expresión \\D , (busca q no sea numero)

gsub("\\D{2}", "no", "ma,12,32,2,321,,23") # q no sea digito de tamaño 2

# Expresión \\w , (w miniscula, cualquier caracter pero q no sea especial $,#,{},[])

gsub("\\w", "_", "},,$,56,,#,5,s,dw,3")

# Expresión \\W ,(w mayuscula, caracter especial)

gsub("\\W", "_", "},,$,56,,#,5,s,dw,3")


x <- c("Mi@##") # cambiar caracteres especiales por vacio
gsub("\\W", " ", x) # queremos eliminar espacios


# Expresión \\s   " " , (\\s busca espacios)

gsub("\\s", "_", "María y José")

# que comience on 1 o mas espacios o termine con 1 o mas espacios reemplaza por nada
gsub("(^\\s+|\\s+)", "", c("    azul me voy", " tete ior    ")) 

# que tenga 1 o mas espacios reemplaza por 1 espacio
gsub("(\\s+)", " ", c("    azul me voy", " tete ior    ")) 

gsub("[ab]", "\\t", "abc and ABC") # a o b


# --------
# Unión de expresiones.

x<-c("Fruta1;Mango", "Fruta2;Naranja",
     "Fruta3;Mandarina", "Fruta4;Plátano")


x <- strsplit(x, ";")
unlist(x)


x<-c("Fruta1;Mango", "Fruta2;Naranja",
     "Fruta3;Mandarina", "Fruta4;Plátano")

gsub(";.*", "", x) # todos los caracteres despues de ; reemplaza por nada
gsub(".*;", "", x) # todos los caracteres antes de ; reemplaza por nada


gsub("\\w{6};", "", x) # cualquier caracter de tamaño 6 y ; cambia por nada

gsub(".*;", "",x)

gsub(";.*","",x)



x<-c("MARIA BELLIDO PORRAS", "JOSÉ MARTOS CORREA",
     "PABLO TACO MANSILLA", "PABLO LUIS TACO MANSILLA")

nombre<-gsub("\\s.*","",x)
apellido<-gsub("(.*)\\s(.*)\\s(.*)", "\\2 \\3", x) 
# busca cualquier carateres, espacio, caracteres, espacio, caracteres
t1<-data.frame(nombre, apellido)
t1


gsub("(.*)\\s(.*)\\s(.*)", "\\2 \\3", x)

ifelse(grepl("(.*)\\s(.*)\\s(.*)\\s(.*)", x), gsub("(.*)\\s(.*)\\s(.*)\\s(.*)", "\\1 \\2",x),
       gsub("(.*)\\s(.*)\\s(.*)", "\\1", x))

# apellidos
# 4 palabras selecciona 3 y 4 sino selecciona 2 y 3
ifelse(grepl("(.*)\\s(.*)\\s(.*)\\s(.*)", x), gsub("(.*)\\s(.*)\\s(.*)\\s(.*)", "\\3 \\4",x),
       gsub("(.*)\\s(.*)\\s(.*)", "\\2 \\3", x))







