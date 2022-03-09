################################################################################
# SESIÓN 9: MANIPULACIÓN DE DATOS CON DPLYR.

# GUÍA: Juan Camilo Panta Ipanaque
################################################################################

# install.packages("dplyr")
library(dplyr)

# Pipe ---> %>%    --->  Ctrl - shift - m 

df<-data.frame(id=sample(1:100,100,T),
               edad=sample(c(10:30), 100, T),
               sexo=sample(c("Masculino","Femenino"), 100, T),
               ingresos=sample(c(4000:5000), 100, T),
               raza=sample(c("blanco","negro"), 100, T),
               ahorro=sample(0:1000,100,T),
               experiencia=sample(0:30,100,T),
               estrato=sample(c("A","B","C","D","E","F"),100,T),
               salon_1=sample(10:100,100,T),
               salon_2=sample(10:100,100,T),
               salon_3=sample(10:100,100,T),
               salon_4=sample(10:100,100,T),
               salon_5=sample(10:100,100,T))

# install.packages("tibble")
library(tibble)

tb<-tibble(id=sample(1:100,100,T),
           edad=sample(c(10:30), 100, T),
           sexo=sample(c("Masculino","Femenino"), 100, T),
           ingresos=sample(c(4000:5000), 100, T),
           raza=sample(c("blanco","negro"), 100, T),
           ahorro=sample(0:1000,100,T),
           experiencia=sample(0:30,100,T),
           estrato=sample(c("A","B","C","D","E","F"),100,T),
           salon_1=sample(10:100,100,T),
           salon_2=sample(10:100,100,T),
           salon_3=sample(10:100,100,T),
           salon_4=sample(10:100,100,T),
           salon_5=sample(10:100,100,T))

tb<-as_tibble(df)
# un tibble es una df

#----
library(haven)

tb<-read.csv("https://perso.telecom-paristech.fr/eagan/class/igr204/data/SpeedDating.csv")

tb<-as_tibble(tb)

tb %>% print(n=5)

tb %>% print(n=5, width=Inf)

#------------------
# Seleccionar columnas.

tb<-as_tibble(df)

tb %>% .$edad

tb %>% .[["edad"]]

tb %>% select(edad)

tb %>% select(ingresos, ahorro)

tb %>% select(raza, sexo, edad)

tb %>% select(-edad)

tb %>% select(!edad)

tb %>% select(sexo:salon_1) # desde sexo hasta salon_1

tb %>% select(!(sexo:salon_1))

tb %>% select(!c(salon_2,salon_4))

# Cuando el nombre de las columnas empiezan en:

tb %>% select(starts_with("s"))

tb %>% select(starts_with("S"))

tb %>% select(starts_with("e"))

# Cuando el nombre de las columnas terminan en:

tb %>% select(ends_with("a"))

tb %>% select(ends_with("ia"))

tb %>% select(ends_with("o"))

tb %>% select(ends_with("d"))

# Cuando el nombre de las columnas contienen:

tb %>% select(contains("a"))

tb %>% select(contains("b"))

tb %>% select(contains("i"))

# Para seleccionar columnas usando expresiones regulares.

tb %>% select(matches("^a")) # empiezan en A

tb %>% select(matches("a$")) # termina en A

tb %>% select(matches("^se")) # empiezan con se

tb %>% select(matches("\\d")) # que tienen numeros

# Para seleccionar variables que cambian por números.

tb %>% select(num_range("salon_",1:2))

tb %>% select(num_range("salon_",c(3,5)))

# Para seleccionar por índice.

tb %>% select(1:4) # selecciona las columnas 1 al 4

tb %>% select(5:9)

tb %>% select(c(1,6))


###----
# Filtrar.

tb %>% filter(edad==25)

tb %>% filter(raza=="negro")

tb %>% filter(sexo=="Femenino", experiencia>20) # la coma es "Y" (femenino y <20)

tb %>% filter(sexo=="Femenino" & experiencia>20)

tb %>% filter(sexo!="Masculino" & ahorro>699)

tb %>% filter(sexo=="Masculino" | ahorro>699)

tb %>% filter(estrato %in% c("A","C","D")) # pertencen a A,C,D

tb %>% filter(!estrato %in% c("A","C","D")) # no pertenecen !(estrato ...)

tb %>% filter(ahorro > mean(ahorro))

tb %>% filter(ahorro > median(ahorro))


###----
# Crear nuevas columnas.

tb %>% mutate(salon_1y2=salon_1+salon_2) %>% View()

tb %>% mutate(ing_ahor=ingresos/ahorro, ahorro2=ahorro/100)

tb %>% mutate(promedio=ahorro/mean(ahorro), hola="Hola") %>% View()

tb %>% mutate(caracter="Hola",
              numero=12.5,
              logico=T,
              entero=3L) %>% View()

# colocar la nueva columna antes del 1
tb %>% select(edad, sexo, ingresos) %>% mutate(ing2=ingresos/1000, .before=1)
# colocar la nueva columna antes de sexo
tb %>% select(edad, sexo, ingresos) %>% mutate(ing2=ingresos/1000, .before=sexo)
# colocar la nueva columna despues del 1
tb %>% select(edad, sexo, ingresos) %>% mutate(ing2=ingresos/1000, .after=1)
# colocar la nueva columna despues de sexo
tb %>% select(edad, sexo, ingresos) %>% mutate(ing2=ingresos/1000, .after=sexo)

# muestre todas las columnas
tb %>% mutate(edad2=edad*2, .keep="all")
# muestre las columnas usadas, edad, edad2
tb %>% mutate(edad2=edad*2, .keep="used")
# muestre las columnas no usadas
tb %>% mutate(edad2=edad*2, .keep="unused")
# muestre las columna creada
tb %>% mutate(edad2=edad*2, .keep="none")


### ---
# Resumenes de datos.

tb %>% summarise(media=mean(edad))

tb %>% summarise(media=mean(edad), mediana=median(edad),
                 desv.est=sd(edad), CV=desv.est/media)

tb %>% summarise(N=n())

tb %>% summarise(suma=sum(ingresos), varianza=var(ingresos))


###---
# Agrupando por categorías.

tb %>% group_by(sexo) %>% summarise(media=mean(edad))

tb %>% group_by(sexo) %>% summarise(media=mean(edad), mediana=median(edad))

tb %>% group_by(sexo, raza) %>% summarise(media=mean(edad), mediana=median(edad))

tb %>% group_by(estrato) %>% summarise(media_ing=mean(ingresos),
                                       mediana_ing=median(ingresos))

tb %>% group_by(sexo) %>% summarise(N=n()) %>% mutate(p=N/sum(N))

tb %>% group_by(sexo, estrato) %>% summarise(N=n()) %>% mutate(p=N/sum(N))

tb %>% group_by(sexo, raza) %>% summarise(N=n()) %>% mutate(p=N/sum(N))

# porcentaje del total, desagrupamos primero
tb %>% group_by(sexo, raza) %>% summarise(N=n()) %>% ungroup() %>% 
  mutate(p=N/sum(N))

tb %>% group_by(sexo, raza) %>% summarise(N=n()) %>% ungroup() %>% 
  mutate(p=N/sum(N)) %>% filter(raza=="blanco")


###---
# Contar.

tb %>% count(sexo) # es igual a tb %>% group_by(sexo) %>% summarise(n=n())

tb %>% count(sexo, raza)

tb %>% count(sexo, raza) %>% mutate(SUMA=sum(n)) # count no agrupa


###---
# Ordenar.

tb %>% select(edad) %>% arrange(edad)

tb %>% select(edad) %>% arrange(-edad) # descendente, solo numericos

tb %>% select(edad) %>% arrange(desc(edad)) # descendente

tb %>% select(edad, sexo, raza) %>% arrange(edad, sexo)

tb %>% select(edad, sexo, ingresos) %>% arrange(edad, ingresos)

tb %>% select(edad, sexo, ingresos) %>% arrange(-edad, ingresos)

tb %>% select(edad, sexo, ingresos) %>% arrange(-edad, -ingresos)

tb %>% select(edad, sexo, ingresos) %>% arrange(desc(edad), ingresos)


###---
# Elementos distintos.

tb %>% distinct(edad)

tb %>% distinct(sexo)

tb %>% distinct(sexo, .keep_all = T)

tb %>% distinct(id, .keep_all = T)

tb %>% group_by(sexo) %>% distinct(raza)

tb %>% distinct(sexo, across(ends_with("a")))

tb %>% summarise(dist_edad=n_distinct(edad))

tb %>% summarise(dist_id=n_distinct(id))

tb %>% summarise(dist_sexo=n_distinct(sexo))


###---
# Case when.

tb %>% mutate(ing_cat=ifelse(ingresos<4500,"Menor a 4500",
                             ifelse(ingresos<4800,"Más de 4500 y menos de 4800",
                                    "Más de 4800")), .keep="used") # muestre

tb %>% mutate(ing_cat=case_when(ingresos<4500~"Menor a 4500",
                                ingresos<4800~"Más de 4500 y menos de 4800",
                                TRUE~"Más de 4800"), .keep="used")

set.seed(96)
tb<-tibble(id=sample(1:100,100,T),
           edad=sample(c(10:30,NA), 100, T),
           sexo=sample(c("Masculino","Femenino"), 100, T),
           ingresos=sample(c(4000:5000,NA), 100, T),
           raza=sample(c("blanco","negro"), 100, T),
           ahorro=sample(0:1000,100,T),
           experiencia=sample(0:30,100,T),
           estrato=sample(c("A","B","C","D","E","F",NA),100,T),
           salon_1=sample(10:100,100,T),
           salon_2=sample(10:100,100,T),
           salon_3=sample(10:100,100,T),
           salon_4=sample(10:100,100,T),
           salon_5=sample(10:100,100,T))

sum(is.na(tb$ingresos))

# para tablas con NA
tb %>% mutate(ing_cat=case_when(ingresos<4500~"Menor a 4500",
                                ingresos<4800~"Más de 4500 y menos de 4800",
                                ingresos>=4800~"Más de 4800",
                                TRUE~NA_character_), .keep="used") %>% filter(is.na(ingresos))
# na caracter

sum(is.na(tb$edad))
tb %>% mutate(edad2=case_when(edad<20~1,
                              edad<25~2,
                              edad>=25~3,
                              TRUE~NA_real_), .keep="used") %>% filter(is.na(edad))
# na real para numeros


### Pendiente para la última clase. 

# mutate_all, mutate_if, mutate_at, summarise_all, summarise_if, ...


###---
# Seleccionar muestras.

tb %>% sample_n(10)

tb %>% sample_n(10, replace = T)

tb %>% sample_n(10, replace = T, weight_by = estrato) # pesos

tb %>% sample_frac(.05, replace = T) # muestra del  5% del total


#---------------
# Unir tibbles.
#---------------

#******************************
# Solo considerando 2 tibbles.
#******************************
library(tibble)

set.seed(10)
df1<-tibble(id=1:20,
            pais=sample(c("Perú", "Argentina", "Brasil", "Chile",
                          "Colombia", "Bolivia"),20,T))
df1

set.seed(11)
df2<-tibble(id=sample(1:30, 15),
            educación=sample(c("Economía", "Contador", "Administrador",
                               "Ingeniero", "Doctor"),15,T))
df2

#---
# Intersección - inner_join()

df_int<-inner_join(df1,df2, by="id")
View(df_int)

df1 %>% inner_join(df2, by="id") # Con el operador pipe %>%.

#---
# Los individuos del primer tibble - left_join()

df_left<-left_join(df1,df2, by="id")

#---
# Los individuos del segundo tibble - right_join()

df_right<-right_join(df1,df2, by="id")

#---
# Todos los individuos - full_join()

df_full<-full_join(df1,df2, by="id")

#---
# Todas las filas del primer tibble con un match en el segundo tibble - semi_join()

df_x<-semi_join(df1,df2, by="id")

#---
# Todas las filas del primer tibble sin un match en el segundo tibble - anti_join()

df_nointrx<-anti_join(df1,df2, by="id")


#************************
# Para más de 2 tibbles.
#************************

set.seed(12)
df3<-tibble(id=sample(1:30, 20),edad=sample(20:40, 20, T))

set.seed(13)
df4<-tibble(id=sample(1:30, 20),sexo=factor(sample(1:2, 20, T), 
                                            levels = c(1,2),
                                            labels = c("Masculino", "Femenino")))

set.seed(14)
df5<-tibble(id=sample(1:30, 25), ingresos=sample(2000:5000, 25, T))

df_all<-plyr::join_all(list(df3,df4,df5), by = "id", type = "left")

plyr::join_all(list(df1,df2,df3,df4,df5), type = "left")

plyr::join_all(list(df1,df2,df3,df4,df5), type = "inner")


#*************************************
# Distintos nombres de las variables. 
#*************************************

# Variables con datos comunes con distinto nombre:

set.seed(15)
bd1<-tibble(contribuyente=sample(1:20, 15),
            ingresos=sample(2000:5000, 15))

set.seed(16)
bd2<-tibble(id=sample(1:20, 10),trabajo=factor(sample(1:2, 10, T),
                                               levels = c(1,2),
                                               labels = c("Independiente", "Dependiente")))

# En la primera base "contribuyente", en la segunda base "id".
# Para la intersección:

df_dnin<-inner_join(bd1, bd2, by=c("contribuyente"="id"))


#****************************************
# Más de una variable de emparejamiento.
#****************************************

set.seed(17)
datos1<-tibble(ubigeo=sample(1:25, 50, T),
               estrato=factor(sample(1:2, 50, T),levels = c(1,2),labels = c("Rural", "Urbano")),
               condicion=factor(sample(1:3, 50, T),levels = 1:3,labels = c("Jefe", "Cónyuge", "Hijo")),
               edad=sample(1:50, 50, T))

set.seed(18)
datos2<-tibble(ubigeo=sample(1:25, 40, T),
               estrato=factor(sample(1:2, 40, T),levels = c(1,2),labels = c("Rural", "Urbano")),
               condicion=factor(sample(1:3, 40, T),levels = 1:3,labels = c("Jefe", "Cónyuge", "Hijo")),
               ingresos=sample(1000:5000, 40, T))


# Tres variables iguales (ubigeo, estrato y condición).

datos_3<-inner_join(datos1, datos2, by=c("ubigeo", "estrato", "condicion"))

inner_join(datos1, datos2, by=c("ubigeo", "estrato", "condicion"="condicion"))


