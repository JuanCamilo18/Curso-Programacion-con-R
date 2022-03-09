################################################################################
# SESIÓN 8: CREAR FUNCIONES II.

# GUÍA:  Juan Camilo Panta Ipanaque.
################################################################################

df<-data.frame(edad=sample(c(10:30,NA), 100, T),
               sexo=sample(c("Masculino","Femenino",NA), 100, T),
               ingresos=sample(c(1000:5000,NA), 100, T),
               raza=sample(c("blanco","negro",NA), 100, T),
               ahorro=sample(0:1000,100,T))

# Imputar los NAs con la media ---> V. numéricas.

imp_med<-function(x,y){
  media<-mean(x[,y],na.rm=T)
  for (i in 1:length(x[,y])) {
    x[,y][i]<-if(is.na(x[,y][i])){
      x[,y][i]<-media
    } else{
      x[,y][i]<-x[,y][i]
    }
  }
  x[,y]
}

imp_med(df,"edad") # round()

# haciendo uso ifelse, de vectores
imp_med2<-function(y){
  media<-mean(y,na.rm=T)
  y<-ifelse(is.na(y),media,y)
  y
}
imp_med2(df$edad)


imp_med3<-function(x,y){
  media<-mean(x[,y],na.rm=T)
  x[,y]<-ifelse(is.na(x[,y]),media,x[,y])
  return(x[,y])
}
imp_med3(df,"edad")


#----

imp_med4<-function(x,y){
  if(class(x[,y])=="numeric" | class(x[,y])=="integer"){
    media<-mean(x[,y],na.rm=T)
    x[,y]<-ifelse(is.na(x[,y]),media,x[,y])
    return(x[,y]) 
  } else {
    stop("La variable *y* no es un vector numérico, imputar por la media no es lo correcto")
  }
}
imp_med4(df,"edad")
imp_med4(df,"sexo")


imp_med5<-function(y){
  if(is.numeric(y)){
    media<-mean(y,na.rm=T)
    y<-ifelse(is.na(y),media,y)
    y 
  } else {
    stop("La variable *y* no es un vector numérico, imputar por la media no es lo correcto")
  }
}
imp_med5(df$sexo)


# install.packages("modeest"), hallar moda
library(modeest)
#imputar por la moda
imp_med6<-function(y){
  if(is.numeric(y)){
    media<-mean(y,na.rm=T)
    y<-ifelse(is.na(y),media,y)
  } else if(is.character(y)){
    moda<-mlv(y, method="mfv", na.rm=T)
    y<-ifelse(is.na(y),moda,y)
  } else {
    stop("La variable *y* no es un vector numérico, imputar por la media no es lo correcto")
  }
  y
}
imp_med6(df$edad)
imp_med6(df$sexo)

#-------------------

# Considerando los NULL.

# Solución de pitágoras.
pitagoras<-function(c1=NULL,c2=NULL,h=NULL){
  if(is.null(h) & (is.null(c2) | is.null(c1))){
    stop("Tiene que asignar *2 catetos* o *1 cateto y una hipotenusa*.")
  }
  
  if(is.null(c1) & is.null(c2)){
    stop("Tiene que asignar *2 catetos* o *1 cateto y una hipotenusa*.")
  }
  
  if(is.null(h)){
    r<-sqrt(c1**2+c2**2)
  } else if (is.null(c1)){
    r<-sqrt(h**2-c2**2)
  } else if(is.null(c2)){
    r<-sqrt(h**2-c1**2)
  }
  r
}
pitagoras(c1=3,c2=4)
pitagoras(c1=3,h=5)
pitagoras(c1=4,h=5)
pitagoras(h=5)
pitagoras(c1=5)

# Considerando valores lógicos. 

mul_div<-function(x,y,z=T){
  if(isTRUE(z)){
    x*y
  } else {
    x/y
  }
}
mul_div(8,2)
mul_div(8,2,F)


library(lubridate)

arqueo<-function(x,y=16,delete=T){
  if(hour(Sys.time())>=y){
    x$ahorro2<-x$ahorro+x$ingresos
  } else {
    print("Aún no acaba el día")
  }
  if(isTRUE(delete)){
    x$ingresos<-0
  } 
  x
}
arqueo(df, delete=F)


# Considerando valores caracteres.

monedas<-function(x="bitcoin"){
  library(rvest)
  library(dplyr)
  pg<-read_html(paste0("https://es.investing.com/crypto/",x))
  pg %>% html_nodes("span.inlineblock > span") %>% html_text()
}

monedas()

#------------------
# sumar un numero a todas las columnas
dd<-data.frame(x=sample(1:100,50,T),
               y=sample(2:100,50,T),
               z=sample(1:100,50,T),
               a=sample(1:100,50,T))

sumador<-function(x,ncol=2){
  for (i in 1:ncol) {
    x[,i]<-x[,i]+5
  }
  x
}
sumador(dd)


mediador<-function(x,ncol=2){
  for (i in 1:ncol) {
    x[,i]<-mean(x[,i],na.rm=T)
  }
  x
}
mediador(dd)

#---
sumador2<-function(x,cols=2){
  for (i in cols) {
    x[,i]<-x[,i]+5
  }
  x
}

#--------------------------














