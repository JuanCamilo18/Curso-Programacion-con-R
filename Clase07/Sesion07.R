################################################################################
# SESIÓN 7: CREAR FUNCIONES I.

# GUÍA: Juan Camilo Panta Ipanaque
################################################################################

# Funciones de una variable. 

f1<-function(x){
  2*x**2+4*x
}
f1(2)

f2<-function(x){
  r<-2*x**2+4*x
  return(r)
}
f2(2)

f3<-function(x){
  paste0("Hola soy el elemento ",x," que evalua la función f3")
}
f3(8)

# Valores por defecto. 
f4<-function(x=2){
  3*x-2
}
f4()

f5<-function(x=10){
  if(x<=18){
    print("Eres menor de edad")
  } else {
    print("Eres mayor de edad")
  }
}
f5()

library(lubridate)

# Calculador de edad.
f6<-function(año){
  year(Sys.Date())-año
}
f6(2010)

f7<-function(x){
  set.seed(1010101)
  df<-data.frame(id=sample(1:100,50,F),
                 ahorro=sample(0:100,50,F))
  if(x %in% df$id){
    paste("Cliente con id:",x, "usted tiene una cuenta en nuestro servicio")
  } else {
    paste("Disculpe, no está registrado en nuestras bases de datos")
  }
}
f7(2)

f8<-function(x="22"){
  set.seed(1010101)
  df<-data.frame(id=as.character(sample(1:100,50,F)),
                 ahorro=sample(0:100,50,T))
  if(x %in% df$id){
    list(paste0("Cliente con id:",x, ", usted tiene una cuenta en nuestro servicio"),
         paste("Sus ahorros son:",df$ahorro[df$id==x])) #with[]
  } else {
    paste("Disculpe, no está registrado en nuestras bases de datos")
  }
}
f8()


# Uso de la función stop().

f9<-function(x="10"){
  if(is.character(x)){
    paste("Muy bien puede continuar")
  } else{
    stop("Usted no puede continuar, porque la variable x no es caracter")
  }
}
f9()

f10<-function(x){
  r<-mean(x, na.rm=T)
  return(r)
}
f10(c(3,4,5,2,3))

f11<-function(x){
  if(!is.vector(x)){
    stop("El argumento x no es un vector")
  }
  r<-mean(x, na.rm=T)
  return(r)
}
f11(c(1:10,NA,4))


resumen<-function(x){
  list(media=mean(x, na.rm=T), mediana=median(x, na.rm = T),
       min=min(x, na.rm = T), max=max(x, na.rm = T),
       varianza=var(x, na.rm = T), des.est=sd(x, na.rm = T),
       coef.var=sd(x, na.rm = T)/mean(x, na.rm=T), cuartiles=quantile(x, na.rm=T))
}
resumen(1:10)

resumen<-function(x){
  if(!is.vector(x)){
    stop("El argumento x de la función no es un vector.")
  }
  
  list(media=mean(x, na.rm=T), mediana=median(x, na.rm = T),
       min=min(x, na.rm = T), max=max(x, na.rm = T),
       varianza=var(x, na.rm = T), des.est=sd(x, na.rm = T),
       coef.var=sd(x, na.rm = T)/mean(x, na.rm=T), cuartiles=quantile(x, na.rm=T))
}
resumen(df)


resumen<-function(x){
  
  if(!is.vector(x)){
    stop("El argumento x de la función no es un vector.")
  }
  
  r<-cbind(media=mean(x, na.rm=T), mediana=median(x, na.rm = T),
           min=min(x, na.rm = T), max=max(x, na.rm = T),
           varianza=var(x, na.rm = T), des.est=sd(x, na.rm = T),
           coef.var=sd(x, na.rm = T)/mean(x, na.rm=T))
  
  if(sd(x, na.rm = T)/mean(x, na.rm=T)>=.2){
    list(r,paste("El estadístico de tendencia central a considerar es la mediana."))
  } else {
    list(r,paste("El estadístico de tendencia central a considerar es la media."))
  }
}
resumen(1:10)


resumen<-function(x){
  
  if(!is.vector(x)){
    stop("El argumento x de la función no es un vector.")
  }
  
  r<-cbind(media=mean(x, na.rm=T), mediana=median(x, na.rm = T),
           min=min(x, na.rm = T), max=max(x, na.rm = T),
           varianza=var(x, na.rm = T), des.est=sd(x, na.rm = T),
           coef.var=sd(x, na.rm = T)/mean(x, na.rm=T))
  
  if(sd(x, na.rm = T)/mean(x, na.rm=T)>=.2){
    tex<-paste("El estadístico de tendencia central a considerar es la mediana.")
  } else {
    tex<-list(r,paste("El estadístico de tendencia central a considerar es la media."))
  }
  out<-boxplot(x)$out
  dev.off()
  return(list(resumen_estadistico=r,tendencia_central=tex,outliers=out))
}
resumen(c(1:10,50))
boxplot(c(1:10,50)) # vemos


resumen<-function(x){
  
  if(!is.vector(x)){
    stop("El argumento x de la función no es un vector.")
  }
  
  if(is.list(x)){
    stop(" El argumento x de la función es una lista, el argumento debe ser un vector.")
  }
  
  r<-cbind(media=mean(x, na.rm=T), mediana=median(x, na.rm = T),
           min=min(x, na.rm = T), max=max(x, na.rm = T),
           varianza=var(x, na.rm = T), des.est=sd(x, na.rm = T),
           coef.var=sd(x, na.rm = T)/mean(x, na.rm=T))
  
  if(sd(x, na.rm = T)/mean(x, na.rm=T)>=.2){
    tex<-paste("El estadístico de tendencia central a considerar es la mediana.")
  } else {
    tex<-list(r,paste("El estadístico de tendencia central a considerar es la media."))
  }
  out<-boxplot(x)$out
  dev.off()
  return(list(resumen_estadistico=r,tendencia_central=tex,outliers=out))
}
resumen(c(1:10,50))


resumen<-function(x){
  
  if(!is.vector(x)){
    stop("El argumento x de la función no es un vector.")
  }
  
  if(is.list(x)){
    stop(" El argumento x de la función es una lista, el argumento debe ser un vector.")
  }
  
  r<-cbind(media=mean(x, na.rm=T), mediana=median(x, na.rm = T),
           min=min(x, na.rm = T), max=max(x, na.rm = T),
           varianza=var(x, na.rm = T), des.est=sd(x, na.rm = T),
           coef.var=sd(x, na.rm = T)/mean(x, na.rm=T))
  
  if(T %in% is.na(x)){
    m<-paste("El vector contiene valores missings.")
  } else {
    m<-paste("El vector no contiene valores missings. ")
  }
  
  if(sd(x, na.rm = T)/mean(x, na.rm=T)>=.2){
    tex<-paste("El estadístico de tendencia central a considerar es la mediana.")
  } else {
    tex<-list(r,paste("El estadístico de tendencia central a considerar es la media."))
  }
  out<-boxplot(x)$out
  dev.off()
  return(list(resumen_estadistico=r,missings=m,tendencia_central=tex,outliers=out))
}
resumen(c(1:10,50))


# Uso de warning.

f12<-function(x){
  mean(x, na.rm=T)
}
f12(1:10)

f13<-function(x){
  if(is.matrix(x)){
    warning("El argumento x es una matriz. Debería ser un vector, pero igual se muestran los cálculos.")
  }
  mean(x, na.rm=T)
}
f13(1:10)
f13(matrix(1:9,ncol = 9))


f14 <- function(x){
  message("Hola estoy haciendo el calculo")
  x*2
}
f14(5)


library(data.table)

datametria::area_quantile



#-----------------------------------------------------------------------
# funcion IMPORTAR VARIOS ARCHIVOS A LA VEZ.
#-----------------------------------------------------------------------

list.files()

leer_archivos <- function(num_p){
  library(openxlsx)
  library(haven)
  for (i in 1:length(num_p)) {
    
    if(grepl("Clase06/.xlsx", num_p[i])){
      assign(paste0("Clase06/tabla_",i), read.xlsx(num_p[i]))
    }else if(grepl("Clase06/.dta", num_p[i])){
      assign(paste0("Clase06/tabla_",i), read_dta(num_p[i]))
    } else if(grepl("Clase06/.txt", num_p[i])){
      assign(paste0("Clase06/tabla_",i), read.table(num_p[i]))
    }
  }
}
# falta
archis <- leer_archivos(num_p = list.files())








