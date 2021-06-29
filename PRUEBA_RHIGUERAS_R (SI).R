library(readxl)
library(view)
library(ggplot2)
library(modeest)
library(print)

#######################################################################
### IMPORTAMOS BASE DE DATOS DE EXCEL DE PROFESIONES / SUELDOS Y EDADES
########################################################################
datos<-read_excel("C:/Users/Oscar/Desktop/BASE_R (3).xlsx")
datos

#######################################################################
### EJECUTAMOS COMANDO View
########################################################################
View(datos)

######################################
##SE SETEA EL NOMBRE DE LAS COLUMNAS##
#####################################
colnames(datos)=c("RUT","SEXO","FECHA_NACI","EDAD","PROFESION","ISE","CARGAS","RENTAS")
datos

######################################################################################################################
### GRAFICA 1 RENTA DIFERENCIADA  POR SEXO ( LA RENTA ESTA EN M$) ####################################################
### RESPUESTA: DE ACUERDO AL ANÁLISIS COMPARATIVO SE PUEDE EVIDENCIAR QUE LOS SUELDOS MAS ALTOS SEGÚN BASE ANALIZADA
##  SON RECIBIDOS POR PERSONAS DE SEXO FEMENINO                                                                                  ###
######################################################################################################################
ggplot(datos, aes(x=SEXO, y=(RENTAS/1000), fill=EDAD)) + geom_bar(stat="identity", position="dodge") +  ggtitle("RENTA POR SEXO")

######################################################################################################################
### GRAFICA 2 SUELDOS POR PROFESION ( LA RENTA ESTA EN M$)############################################################
### RESPUESTA : DE ACUERDO AL ANÁLISIS SE PUEDE EVIDENCIAR QUE LOS SUELDOS MÁS ALTOS SE ENCUENTRAN EN LAS CARRERAS ###
### DE INGENIERIA EN ADMIN. EMPRESAS DESTACANDO EL SEXO FEMENINO POR SOBRE EL MASCULINO                            ###
######################################################################################################################

ggplot(datos, aes(x=SEXO, y=(RENTAS/1000), fill=PROFESION)) +   geom_bar(stat="identity", position="dodge") +  ggtitle("SUELDOS POR PROFESION")

######################################################################################################################
### GRAFICA 3 CARGAS POR EDAD  #######################################################################################
### RESPUESTA: EL SEXO MASCULINO ES QUIEN POSEE MAYOR   N° DE CARGAS CON UN MAXIMO DE 7,                           ###
### PREDOMINANDO LAS PERSONAS CON PROFESIÓN INGENIERO EN ADMINISTRACIÓN DE EMPRESAS                                ###
######################################################################################################################
ggplot(datos, aes(SEXO, CARGAS,color=PROFESION)) +  geom_point() + ggtitle("TOTAL CARGAS POR EDADES")

####################################################
### Datos Estadisticas columna de rentas    #########
###################################################
min(datos$RENTAS)
max(datos$RENTAS)
median(datos$RENTAS)
range(datos$RENTAS)

####################################################
### Datos Estadisticas columna de edades    #########
###################################################
min(datos$EDAD)
max(datos$EDAD)
median(datos$EDAD)
range(datos$EDAD)
## FUNCIONES COMPARATivas de edad
ifelse(a>b,print("a es mayor que b"),print("b es mayor que a"))



############################# CONDICION CLASIFICACIÓN ADULTO / VS ADULTO JOVEN
ifelse(datos$EDAD<45,rbind("ADULTO JOVEN : ", datos$EDAD) ,rbind("ADULTO",datos$EDAD))