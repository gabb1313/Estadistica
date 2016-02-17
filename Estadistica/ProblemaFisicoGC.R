#PROGRAMA: SIMULACION DE DATOS NORMALES EN UN CONTEXTO FISICO
#Se suelta una esfera de acero de radio 'r' con densidad 'rho_a'
#en un tanque con glicerina con densidad 'rho_g' y viscosidad 'eta_g'
#para obtener un perfil de velocidades terminales 'vT' 

#ESCENARIO DE SIMULACION DETERMINISTA
r=0.5       #en metros
rho_a=7.800  #en kg/m^3
rho_g=1.260  #en kg/m^3
eta_g=1.49    #en Paxs
g=9.81       #en m/s^2

#LEY DE STOKES
V=(4*pi*r^3)/3
m=V*rho_a

A=(6*pi*r*eta_g)/m
B=(1-(rho_g/rho_a))*g

#VELOCIDAD TERMINAL
vt1=2*r*r*g*(rho_a-rho_g)
vt2=9*eta_g
vT=vt1/vt2

#ANALIZANDO LA VELOCIDAD
t=seq(0,0.99,0.01)
v=(B/A)*(1-exp(-A*t))

#CREANDO LA GRAFICA
plot(t,v,type="l",lty=1,lwd=1,col=1,xlim=c(0,2),ylim=c(0,4),
     xlab="t",ylab="v", main="Perfil de velocidades", cex.main=1.5,
     cex.lab=1.25,cex.axis=1.25)

###################################################################
###################################################################
###################################################################
###################################################################

#ESCENARIO DE SIMULACION ALEATORIO
#r se comporta como una normal
mr=0.5     
dr=0.1       
n=100
nr=rnorm(n,mean=mr,sd=dr)

#LEY DE STOKES
VV=(4*pi*nr^3)/3
mm=VV*rho_a

#VELOCIDAD TERMINAL
vtt1=2*nr*nr*g*(rho_a-rho_g)
vTT=vtt1/vt2

#CREANDO LA GRAFICA
plot(t,v,type="l",lty=1,lwd=1,col=1,xlim=c(0,2),ylim=c(0,4),
     xlab="t",ylab="v", main="Perfil de velocidades", cex.main=1.5,
     cex.lab=1.25,cex.axis=1.25)
for(i in 1:n)
{
  vv=(B/((6*pi*nr[i]*eta_g)/mm))*(1-exp(-((6*pi*nr[i]*eta_g)/mm)*t))
  points(t,vv,type="l",lty=3,lwd=1,col=4)
}

summary(nr)
sd(nr)
var(nr)
min(nr)
max(nr)
hist(nr)
text(nr,0,"*",cex=2,col=2)
