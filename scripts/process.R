
data.u <- read.csv("../data/encuesta-edubots-uni.csv")
data.c <- read.csv("../data/encuesta-edubots-ciclos.csv")

data.u$Marca.temporal <- NULL
data.c$Marca.temporal <- NULL

data.c <- data.c[ data.c$X.Imparte.docencia.en.ciclos.formativos.de.grado.medio.o.superior. == "Sí", ]

data.c$X.Imparte.docencia.en.ciclos.formativos.de.grado.medio.o.superior. <- NULL

data.c$Sector <- "Vocational"
data.u$Sector <- "University"

data <- rbind(data.c, data.u)

names(data)[names(data) == "Titulaciones.que.imparte"] <- "Degree"
names(data)[names(data) == "Área"] <- "Area"
names(data)[names(data) == "Edad..años."] <- "Age"
names(data)[names(data) == "Experiencia.docente"] <- "Experience"
names(data)[names(data) == "Sobre.el.uso.de.los.sistemas.de.mensajería.en.clase..prefiero"] <- "Messaging.Preference"
names(data)[names(data) == "X.Qué.plataforma.de.mensajería.GRUPAL.usas.normalmente.para.comunicarte.con.tus.compañeros.y.estudiantes."] <- "Messaging.Platform"
names(data)[names(data) == "X.Qué.tipo.de.bots..programas.que.respondan.automáticamente.a.preguntas.u.órdenes...podrían.resultar.útiles.para.mejorar.los.resultados.de.aprendizaje.de.los.estudiantes.o.ayudarte..en.general..a.gestionar.una.asignatura."] <- "Chatbots.Preference"
names(data)[names(data) == "La.virtualización.de.la.enseñanza.debida.al.COVID.este.año.o.el.anterior...ha.significado.algún.cambio.en.tu.percepción.o.uso.de.mensajería.en.clase."] <- "COVID.Changes"

library(ggplot2)
library(dplyr)
library(tidyr)
library(stringr)

data$Messaging.Platform <- str_replace_all(data$Messaging.Platform, " específica de la universidad, titulación o departamento", "" )
data$Messaging.Platform <- str_replace_all(data$Messaging.Platform, "Ninguna, prefiero", "Ninguna prefiero" )
data <- data %>% separate_rows( Messaging.Platform, sep="," )
data$Messaging.Platform <- trimws( data$Messaging.Platform )

data.messaging <- data %>% group_by(Messaging.Platform) %>% mutate(count_platforms = n())
data.messaging <- data.messaging[ data.messaging$count_platforms > 1, ]
ggplot( data.messaging, aes( x = reorder(Messaging.Platform, -count_platforms ), group=Sector )) + geom_bar( stat="count" ) + theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
