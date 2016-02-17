#Analisis descriptivo de datos reales
#y valoracion de modelos

#Librerias
library (MASS)
library (marg)

#Datos 1
geyser
D<-geyser
TE<-geyser$waiting
DE<-geyser$duration

plot(TE,DE)
hist(TE)
hist(DE)

#Datos2
venice
v<-venice
YV<-venice$year
SV<-venice$sea

plot(YV,SV,type = "b", main = "Nivel del mar por año", xlab = "Año", ylab = "Nivel del mar", col="6")
hist(SV)

