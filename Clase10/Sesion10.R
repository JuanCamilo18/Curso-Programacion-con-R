################################################################################
# SESIÓN 10: PROGRAMACIÓN DE FUNCIONES CON DPLYR Y TRANSFORMACIÓN DE TABLAS CON 
#            TIDYR.

# GUÍA: Juan Camilo Panta Ipanaque.
################################################################################

# install.packages("tidyr")
library(tidyr)
library(tibble)
library(dplyr)

#---------------------------
# De formato corto a largo.
#---------------------------
set.seed(11)
df<-tibble(id=1:100,
           año10=sample(1:199,100,T),
           año20=sample(1:300,100,T),
           año30=sample(1:50,100,T))


df %>% gather(key = periodo, value = valor, 2:4)

df %>% gather(key,value,2:4)

df %>% gather(periodo,valor,2:4)

set.seed(11)
df1<-tibble(id=1:100,
            año10=sample(1:199,100,T),
            año20=sample(1:300,100,T),
            año30=sample(1:50,100,T),
            año40=sample(10:50,100,T),
            sexo=sample(c("M","F"),100,T))

df1 %>% gather(key, value, 2:5)

df1 %>% gather(periodo, valor, 2:5)

#-------
df1 %>% pivot_longer(cols = 2:5,names_to = "periodo",values_to = "valor")

#----
# install.packages("reshape2")

library(reshape2)

df1 %>% melt(id.vars=c("id", "sexo"))

melt(df1, id.vars=c("id", "sexo")) %>% head()

melt(df1, id.vars=c("id", "sexo"), variable.name = "periodo", value.name = "valor") %>% head()

#----------------------
# De formato largo a corto.

df2<-melt(df1, id.vars=c("id", "sexo"), variable.name = "periodo", value.name = "valor")

#---
df2 %>% spread(key = periodo, value = valor)

#---
df2 %>% pivot_wider(names_from = "periodo", values_from = "valor")

#---
df2 %>% reshape2::dcast(id+sexo~periodo, value.var = "valor")

#--------------------------------------------------------

# Para 2 keys de formato corto a largo.

df3<-tibble(id = 1:2, año1 = c(30, 35), año2 = c(43, 50),
            peso1 = c(96, 67), peso2 = c(120, 87))

df3 %>% gather(periodo, talla, 2:3) %>% gather(periodo_peso,peso, 2:3)

df3 %>% gather(periodo, talla, 2:3) %>% gather(periodo_peso,peso, 2:3) %>% 
  filter(substring(periodo,4)==substring(periodo_peso,5))

#---
df3<-tibble(id = 1:2, año1 = c(30, 35), año2 = c(43, 50),
            peso1 = c(96, 67), peso2 = c(120, 87))

df3 %>%
  gather(key, value, 2:5) %>% mutate(periodo=gsub("(año|peso)(\\d{1})","\\2",key), #//d{1} un digito
                                     key=gsub("(año|peso)(\\d{1})","\\1",key)) %>% 
  spread(key,value)

df3 %>%
  gather(key, value, 2:5) %>% extract(key,c("key","periodo"),"(año|peso)(\\d{1})") %>% 
  spread(key,value)


set.seed(11)
df4<-tibble(id=1:100,
            año10=sample(1:199,100,T),
            año20=sample(1:300,100,T),
            año30=sample(1:50,100,T),
            año40=sample(10:50,100,T),
            sexo=sample(c("M","F"),100,T),
            seccion_a=sample(1:10,100,T),
            seccion_b=sample(1:20,100,T),
            seccion_c=sample(1:30,100,T),
            seccion_d=sample(1:40,100,T))

set.seed(11)
df4<-tibble(id=1:100,
            año10=sample(1:199,100,T),
            año20=sample(1:300,100,T),
            año30=sample(1:50,100,T),
            año40=sample(10:50,100,T),
            sexo=sample(c("M","F"),100,T),
            seccion_10=sample(1:10,100,T),
            seccion_20=sample(1:20,100,T),
            seccion_30=sample(1:30,100,T),
            seccion_40=sample(1:40,100,T))

df4 %>% gather(años, valor_años, 2:5) %>% gather(secciones, valor_secciones, 3:6) %>% 
  filter(substring(años,4,5)==substring(secciones,9,10))

#----

df4 %>% pivot_longer(names_to = "año", values_to = "año_valor", 2:5) %>% 
  pivot_longer(names_to = "seccion", values_to = "seccion_valor", 3:6) %>% 
  filter(substring(año,4,5)==substring(seccion,9,10))

df4 %>%  
  pivot_longer(cols = -c(id, sexo),
               names_to = c(".value", "grupo"),names_pattern = "(año|seccion_)(\\d{2})")

#----
# install.packages("data.table")
library(data.table)
data.table::melt(setDT(df4),measure.vars= patterns("^año","^seccion"))


#--------
# Con más de 2 keys. 
set.seed(11)
df5<-tibble(id=1:100,
            año10=sample(1:199,100,T),
            año20=sample(1:300,100,T),
            año30=sample(1:50,100,T),
            año40=sample(10:50,100,T),
            sexo=sample(c("M","F"),100,T),
            seccion_10=sample(1:10,100,T),
            seccion_20=sample(1:20,100,T),
            seccion_30=sample(1:30,100,T),
            seccion_40=sample(1:40,100,T),
            salon_10=sample(1:10,100,T),
            salon_20=sample(1:20,100,T),
            salon_30=sample(1:30,100,T),
            salon_40=sample(1:40,100,T))

df5 %>% gather(años, valor_años, 2:5) %>% gather(secciones, valor_secciones, 3:6) %>% 
  gather(salones, valor_salon, 3:6) %>% 
  filter(substring(años,4,5)==substring(secciones,9,10)) %>% 
  filter(substring(salones,7,8)==substring(secciones,9,10))

#------

df5 %>%  
  pivot_longer(cols = -c(id, sexo),
               names_to = c(".value", "grupo"),
               names_pattern = "(^año|^seccion_|^salon_)(\\d{2})") %>% #//d{2} dos digito 11, 22,33 (no)
  filter(id==1)

#------
data.table::melt(setDT(df5),measure.vars= patterns("^año","^seccion","^salon"))

#-------------------------------------------------------------------------------

# Con 2 values de formato largo a corto

df6<-df3 %>% gather(periodo, talla, 2:3) %>% gather(periodo_peso,peso, 2:3) %>% 
  filter(substring(periodo,4)==substring(periodo_peso,5))
df6

df6 %>% spread(key = periodo, value = talla) %>% spread(key=periodo_peso, value = peso)

df6 %>% select(-periodo_peso) %>% gather(key, value, 3:4) %>% 
  mutate(key=paste0(key,substring(periodo,4))) %>% select(-periodo) %>% 
  spread(key,value)

#---

df6 %>% pivot_wider(names_from = "periodo", values_from = "talla") %>% 
  pivot_wider(names_from = "periodo_peso", values_from = "peso") 

df6 %>% select(-periodo_peso) %>% pivot_longer(names_to = "key", cols=3:4) %>% 
  mutate(key=paste0(key,substring(periodo,4))) %>% select(-periodo) %>% 
  pivot_wider(names_from = "key", values_from = "value")

df6 %>% mutate(key=ifelse(grepl("1",periodo),periodo,periodo_peso)) %>% 
  select(-periodo,-periodo_peso) %>% 
  pivot_wider(names_from = key, values_from = c("talla", "peso"), names_sep="")

df6 %>% pivot_wider(names_from = c("periodo","periodo_peso"), values_from = c("talla","peso"))


#---

data.table::dcast(setDT(df6 %>% mutate(key=ifelse(grepl("1",periodo),periodo,periodo_peso))),
                  id ~ key, value.var = c("talla", "peso"), sep = "")

#-------------------------------------------------------------------------------
# Con más de 2 values de formato largo a corto.

df7<-df5 %>%  
  pivot_longer(cols = -c(id, sexo),
               names_to = c(".value", "grupo"),names_pattern = "(^año|^seccion_|^salon_)(\\d{2})")
df7

df7 %>%  gather(key, value, 4:6) %>% mutate(key=paste0(key,grupo)) %>% select(-grupo) %>% 
  spread(key, value)

#---

df7 %>% pivot_wider(names_from = c("grupo"), values_from = c("año","seccion_","salon_"), names_sep = "")

#---

data.table::dcast(setDT(df7), id+sexo ~ grupo, value.var = c("año","seccion_","salon_"), sep = "")

#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
# Programación de funciones con dplyr. 

# install.packages("rlang")
library(rlang)
library(dplyr)

set.seed(11)
df8<-tibble(id=1:100,
            año10=sample(1:199,100,T),
            año20=sample(1:300,100,T),
            año30=sample(1:50,100,T),
            año40=sample(10:50,100,T),
            sexo=sample(c("M","F"),100,T),
            seccion_10=sample(1:10,100,T),
            seccion_20=sample(1:20,100,T),
            seccion_30=sample(1:30,100,T),
            seccion_40=sample(1:40,100,T),
            salon_10=sample(1:10,100,T),
            salon_20=sample(1:20,100,T),
            salon_30=sample(1:30,100,T),
            salon_40=sample(1:40,100,T))

f1<-function(x,y){
  x %>% mutate(media=mean(y))
  x
}
f1(df8, año10)


f2<-function(y){
  df8 %>% mutate(media=mean(!!y))
}
f2(df8, sym("año10"))


f3<-function(x,y){
  x %>% mutate(media=mean(!!y))
}

f4<-function(x,y,z){
  x %>% summarise(media_y=mean(!!y), media_z=mean(!!z))
}
f4(df8, sym("año10"), sym("año20"))


#---
# Argumento como caracter. 

f5<-function(df1,df2, x, y){
  df1 %>% left_join(df2, by=x) %>% summarise(media=mean(!!y, na.rm=T))
}

aa<-tibble(id=1:5,
           ventas=10:14)

bb<-tibble(id=1:3,
           acciones=c(10,20,30))

f5(aa, bb, "id", sym("acciones"))


f6<-function(df, x, y){
  df %>% mutate(hola=x, pegado=paste0(!!y,hola))
}

f7<-function(df,x,y){
  df %>% group_by(!!x) %>% summarise(media=mean(!!y))
}

f7(df8,sym("sexo"),sym("año10"))


tt<-names(df8)[-c(1,6)]

for (i in tt) {
  assign(paste0("var_",i),f7(df8,sym("sexo"),sym(i)))
}
#miramos el inviroment y se crearon los objetos


# sin for
df8 %>% select(-id) %>% 
  group_by(sexo) %>% 
  summarise_all(list(mean))



#---

f8<-function(df,x,y){
  df %>% mutate(p1=!!y/!!x, .keep="used")
}

for (i in c("seccion_10","seccion_40","salon_20")) {
  f8(df8,sym("año10"),sym(i)) %>% print()
}





