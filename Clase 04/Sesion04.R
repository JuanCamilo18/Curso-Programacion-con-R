################################################################################
# SESIÓN 4: CREACIÓN DE DATA FRAMES.

# GUÍA: Juan Camilo Panta Ipanaque
################################################################################

#-----------------------------
# Creación de un Data Frame.
#-----------------------------

set.seed(5)
edad<-sample(10:30, size = 100, replace = TRUE)
sexo<-sample(c("Masculino","Femenino"), size = 100, replace = TRUE)
ingresos<-sample(1000:5000, size = 100, replace = TRUE)
raza<-sample(c("blanco","negro"), size = 100, replace = TRUE)

datos<-data.frame(edad,sexo,ingresos,raza)

# para no almacenar vectores en la memoria, hacemos:
set.seed(5)
datos <- data.frame(edad=sample(10:30, size = 100, replace = TRUE),
                    sexo=sample(c("Masculino","Femenino"), size = 100, replace = TRUE),
                    ingresos=sample(1000:5000, size = 100, replace = TRUE),
                    raza=sample(c("blanco","negro"), size = 100, replace = TRUE))
View(datos) 

sapply(datos, class) # Para saber las clases
datos$sexo

# trabajar otra base de datos:
set.seed(6)
datos2 <- data.frame(edad=sample(10:30, size = 100, replace = TRUE),
                    sexo=sample(c("Masculino","Femenino"), size = 100, replace = TRUE),
                    ingresos=sample(1000:5000, size = 100, replace = TRUE),
                    raza=sample(c("blanco","negro"), size = 100, replace = TRUE))
datos2$raza


is.factor(datos$sexo)
is.factor(datos$raza)

str(datos)

table(datos$raza) # tabla de la raza

head(datos) # primeros datos
head(datos, n=2L)   
head(datos, n=-90L)

tail(datos) # los ultimos datos

names(datos)
# Cambiar nombres...
names(datos) <- c("Edad","Sexo","Ingreso","Raza")

names(datos)[1] <- "edad" # cambiar solo la primera
names(datos)[c(2,4)] <- c("SEXO", "RAZA")
names(datos)

# Cambiar nombres con secuencias...
# p1, p2, p3, ........
variables <- paste0("P",1:100)


dim(datos)

#------------------------------
# Selección de subdata frame.
#------------------------------

# Recordar.
matrix(1:12,ncol = 3)

datos[1:10,]
datos[,1:2]
datos[1:20,1:3]

#---
# Filtro (filas).

datos[datos$sexo=="Masculino",] # selecciona solos los masculinos

datos[datos$sexo=="Masculino" & datos$raza=="blanco",] # masculinos y blancos

datos[datos$sexo=="Femenino" & datos$ingresos>=4000,] #femenino y ingreso > 4000

datos[datos$edad>=24 & datos$raza=="negro",][1:7,]

datos[1:20,][datos$edad>=24 & datos$raza=="negro",]

# Usando función subset()
# quiero comparacion logica de filas
subset(datos, sexo=="Masculino")

subset(datos, sexo=="Masculino" & raza=="blanco")

subset(datos, sexo=="Femenino" & ingresos>=4000)

subset(datos, edad>=24 & raza=="negro")

#---
# Seleccionar (columnas).

datos[,1]

datos[,"edad"]

datos[,c("ingresos","raza")]

datos[,-2]

datos[,-"edad"] # invalid

# Usando la función subset()

subset(datos, select = "edad")

subset(datos, select = c("ingresos","raza"))

subset(datos, select = -2)

subset(datos, select = -"edad")

# Filtro y selección.

datos[1:10,2]

datos[2:5,c(2,3)]

datos[1:5,"edad"]

datos[datos$sexo=="Masculino", c("sexo","ingresos")]

datos[datos$edad>20,-c(2,4)]

# Usando la función subset().

subset(datos[1:10,], select = 2)

subset(datos[2:5,], select = 2:3)

subset(datos[1:5,], select = "edad")

subset(datos, sexo=="Masculino", select = c("sexo","ingresos"))

subset(datos, edad>20, select = -c(2,4))


#---
# Teniendo en consideración a los valores missing.
set.seed(1234)
df<-data.frame(edad=sample(c(10:30,NA), size = 100, replace = TRUE),
               sexo=sample(c("Masculino","Femenino",NA), size = 100, replace = TRUE),
               ingresos=sample(c(1000:5000,NA), size = 100, replace = TRUE),
               raza=sample(c("blanco","negro",NA), size = 100, replace = TRUE))


# Solo datos completos...

na.omit(df) # elimina los NA
dim(na.omit(df)) # eliminó filas y solo quedaron

df[is.na(df$edad),]

df[is.na(df$sexo) & is.na(df$raza),]

df[!is.na(df$edad),] # df donde no halla na en edad

df[!is.na(df$sexo), c("edad","raza")]

# Usando la función subset()

subset(df, is.na(edad))

subset(df, is.na(sexo) & is.na(raza))

subset(df, !is.na(edad))

subset(df, !is.na(sexo), select = c("edad","raza"))


# que sean espacios en blanco, no na
tt <- data.frame(x=sample(c("A","B",""),10,T),
           y=sample(1:10,10,T))
subset(tt, x=is.na(x))
subset(tt, x=="")


#---
# Añadiendo filas y columnas a los data frame.
# anteior bd
set.seed(5)
datos <- data.frame(edad=sample(10:30, size = 100, replace = TRUE),
                    sexo=sample(c("Masculino","Femenino"), size = 100, replace = TRUE),
                    ingresos=sample(1000:5000, size = 100, replace = TRUE),
                    raza=sample(c("blanco","negro"), size = 100, replace = TRUE))

# Añadiendo columnas.
set.seed(6)
casa<-sample(c("si","no"), size = 100, replace = TRUE)

datos<-cbind(datos,casa)

View(datos)

str(datos)


# Añadiendo filas.
tail(datos) # vemos como son los datos
# los datos tienen q tener el mismo str y  nombre de las variables
z<-data.frame(edad=c(20,24),
              sexo=c("Femenino", "Femenino"),
              ingresos=c(3000,5000),
              raza=c("negro", "blanco"),
              casa=c("si","si"))  

datos<-rbind(datos,z)

View(datos)


#--- 
# Crear columnas. 

df<-na.omit(df)

df$seccion <- paste(df$raza, df$edad) #union de 2 columnas

df$ing_edad<-df$ingresos/df$edad # con numericos
df$h_negro<-df$sexo=="Masculino" & df$raza=="negro" # si cumple v sino f
df$h_negro_num<-as.numeric(df$h_negro) # convertir a numerico el vector logico
df

# otra forma
df$dicot <- as.numeric(df$edad>=30 & df$sexo=="Masculino")
df


#---
# Elementos duplicados.

df<-data.frame(id=sample(1:1000,1000,T),
               ventas=sample(1000:4000, size = 1000, replace = TRUE))

# ordenamos para ver mejor los duplicados
df<-df[with(df, order(df$id)),] # -df$id decreciente

# De forma decreciente?...

# se ve cual duplicados, toma el primero no duplicadp
df$rep1<-duplicated(df$id) # todos los verdaderos se repiten, son duplicados
df1 <- df[!duplicated(df$id),] # quedate con los falsos, (no repiten)

# se ve cual duplicados, toma el ultimo no duplicadp
df$rep2<-duplicated(df$id, fromLast = T)
df2 <- df[!duplicated(df$id, fromLast = T),]

df$rep3<-df$rep1==T | df$rep2==T


# eliminar columna
df$rep3 <- NULL







