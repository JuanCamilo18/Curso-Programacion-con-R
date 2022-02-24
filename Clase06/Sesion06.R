################################################################################
# SESIÓN 6: IMPORTAR Y EXPORTAR DATA FRAMES.

# GUÍA: Juan Camilo Panta Ipanaque
################################################################################

# Ubicación del directorio.
getwd()     

# Para cambiar el directorio.
#setwd("C:/OTROS/CURSO PMDR3/Clase 6/")  

# archivos en el directorio
list.files()

#--------------------------------
# Importación de base de datos.
#--------------------------------

#***************************************************
# PAra archivos de texto ASCII.  (.txt  .dat  ...)
#***************************************************

# read.table(file, header = , sep = "", dec = ".", row.names, col.names,
#            as.is = FALSE, na.strings = "NA", ...)

datos1<-read.table(file="Clase06/pbi_trimestre.txt", header = TRUE, sep = "\t")

View(datos1)   # Para ver la base de datos.

datos2<-read.table(file = "Clase06/monedas.txt", header = T,
                   sep = "\t",
                   col.names = c("Periodo","Euro","Libra","Peso_mexicano"))

View(datos2)

plot(datos2$Euro, type = "l")


#*********************
# Para archivos csv.
#*********************

datos4<-read.csv("Clase06/Enaho01-2020-100.csv",
                 sep=",",
                 header = TRUE)
View(datos4)


#***********************************************
# Para archivos de stata, spss, excel y otros.
#***********************************************
#----
# Para SPSS
#install.packages("Clase06/foreign")
library(foreign)

datos5<-read.spss("Clase06/Trim Mar-Abr-May21.sav", to.data.frame = TRUE)

View(datos5)

#install.packages("haven")
library(haven)
# no arroja etiquetas, internamente
datos6<-read_spss("Clase06/Trim Mar-Abr-May21.sav")
View(datos6)


#install.packages("memisc")
library(memisc)

datos7<-as.data.frame(as.data.set(spss.system.file("Clase06/Trim Mar-Abr-May21.sav")))

#---
# Para stata

datos8<-read.dta("Clase06/enaho01-2020-200.dta")

View(datos8)

#++++++++++++++++++++++++++
install.packages("haven")
library(haven)
#++++++++++++++++++++++++++

datos9<-read_dta("Clase06/enaho01-2020-200.dta")

View(datos9)

#install.packages("readstata13")
library(readstata13)

datos10<-read.dta13("Clase06/enaho01-2020-200.dta")

# Para excel.

#++++++++++++++++++++++++++
#install.packages("readxl")
#install.packages("openxlsx")
library(readxl)
library(openxlsx)
#++++++++++++++++++++++++++

datos11<-read_xls("Clase06/datos_nombres.xls")


datos12<-read_xlsx("Clase06/empleo.xlsx")
datos13<-read.xlsx("Clase06/empleo.xlsx")

#-------------------------
# Importar desde la web.
#-------------------------

datos14<-read_dta("http://stats.idre.ucla.edu/stat/stata/dae/binary.dta")


#-------------------------
# Importar archivos dbf.
#-------------------------
# de foreign, comprime
datos15<-read.dbf("Clase06/votos.dbf")


#-------------------------
# Importar archivos rds.
#-------------------------
datos16<-readRDS("Clase06/votos.rds")


#--------------------------
# Exportar base de datos.
#--------------------------

write.table(datos1, file = "Clase06/dExportados/datos1.m.txt")  # Para exportarlo en un archivo txt.

write_dta(datos5, path = "Clase06/dExportados/mundotee.dta")

tab1<-paste0(round(prop.table(table(datos8$sexo))*100,2), "%")

write.csv(tab1, "Clase06/dExportados/tab1.csv")

write.xlsx(tab1, "Clase06/dExportados/tab2.xlsx")

#--------------------------------
# Exportar a latex y página web.
#--------------------------------
#install.packages("xtable")
library(xtable)

xtable(datos2)
print(xtable(datos2), type = "html")

#--------------------------------
# Exportar a word.
#--------------------------------
#install.packages("rtf")
library(rtf)

mdoc<- RTF("Clase06/dExportados/miarchivo.doc")
addTable(mdoc, datos2)
done(mdoc)


#-----------------------------------------------------------------------
# IMPORTAR VARIOS ARCHIVOS A LA VEZ.
#-----------------------------------------------------------------------

list.files()

for (i in 1:length(num_p)) {
  
  if(grepl(".xlsx", num_p[i])){
    assign(paste0("tabla_",i), read.xlsx(num_p[i]))
  }else if(grepl(".dta", num_p[i])){
    assign(paste0("tabla_",i), read_dta(num_p[i]))
  } else if(grepl(".txt", num_p[i])){
    assign(paste0("tabla_",i), read.table(num_p[i]))
  }
}



