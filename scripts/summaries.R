library(psych)
library(dplyr)
library(tidyr)
library(ggplot2)
library(forcats)

survey.pilot <- read.csv("../data/survey-pilot-3-EN.csv")
survey.interaction <- read.csv("../data/survey-student-interaction-pilot-3-2021-EN.csv")
#ggplot(survey.pilot,aes(Age,Experience))+geom_point(aes(size=value),colour="green")

survey.pilot %>% group_by( Gender ) %>% summarise ( n = n() ) %>% mutate( freqGender = n/sum(n)) -> freq.Gender
survey.pilot %>% group_by( Age ) %>% summarise ( n = n() ) %>% mutate( freqAge = n/sum(n)) -> freq.Age
survey.pilot %>% group_by( Experience ) %>% summarise ( n = n() ) %>% mutate( freqExperience = n/sum(n)) -> freq.Experience
survey.pilot %>% group_by( Sector ) %>% summarise ( n = n() ) %>% mutate( freqSector = n/sum(n)) -> freq.Sector
survey.pilot %>% group_by( Discipline ) %>% summarise ( n = n() ) %>% mutate( freqDiscipline = n/sum(n)) -> freq.Discipline

survey.pilot %>%
    mutate(Age = fct_relevel(Age,"25-35", "35-45", "45-55", "> 55")) %>%
    mutate(Experience = fct_relevel(Experience, "0-05 years", "06-15 years", "16-25 years", "> 25 years" )) %>%
    group_by( Age, Experience ) %>% summarise( n = n() ) %>% mutate( freq = n/sum(n)) -> Age.vs.Experience

ggplot(Age.vs.Experience,aes(Age,Experience))+geom_point(aes(size=freq),colour="green")



survey.interaction %>% group_by( Gender ) %>% summarise ( n = n() ) %>% mutate( freqGender = n/sum(n)) -> freqInteraction.Gender
survey.interaction %>% group_by( Age ) %>% summarise ( n = n() ) %>% mutate( freqAge = n/sum(n)) -> freqInteraction.Age
survey.interaction %>% group_by( Experience ) %>% summarise ( n = n() ) %>% mutate( freqExperience = n/sum(n)) -> freqInteraction.Experience
survey.interaction %>% group_by( Sector ) %>% summarise ( n = n() ) %>% mutate( freqSector = n/sum(n)) -> freqInteraction.Sector
survey.interaction %>% group_by( Discipline ) %>% summarise ( n = n() ) %>% mutate( freqDiscipline = n/sum(n)) -> freqInteraction.Discipline

freq.Gender$source<-rep("survey1")
freqInteraction.Gender$source<-rep("survey2")
freqbinded.Gender <- rbind(freq.Gender, freqInteraction.Gender)
freqbinded.Gender$source <- factor(freqbinded.Gender$source) 
ggplot(freqbinded.Gender, aes(x = Gender, y=freqGender, fill = source)) + geom_bar(stat="identity", position = "dodge")+scale_y_continuous(labels=scales::percent) + theme(axis.title.y=element_blank())

freq.Age$source<-rep("survey1")
freqInteraction.Age$source<-rep("survey2")
freqbinded.Age <- rbind(freq.Age, freqInteraction.Age)
freqbinded.Age$source <- factor(freqbinded.Age$source) 
ggplot(freqbinded.Age, aes(x = Age, y=freqAge, fill = source)) + geom_bar(stat="identity", position = "dodge")+scale_y_continuous(labels=scales::percent) + theme(axis.title.y=element_blank())

freq.Experience$source<-rep("survey1")
freqInteraction.Experience$source<-rep("survey2")
freqbinded.Experience <- rbind(freq.Experience, freqInteraction.Experience)
freqbinded.Experience$source <- factor(freqbinded.Experience$source) 
ggplot(freqbinded.Experience, aes(x = Experience, y=freqExperience, fill = source)) + geom_bar(stat="identity", position = "dodge")+scale_y_continuous(labels=scales::percent) + theme(axis.title.y=element_blank())


survey.interaction %>% group_by( Vocational ) %>% summarise ( n = n() ) %>% mutate( freqSector = n/sum(n)) -> freqInteraction.Sector
freqInteraction.Sector$Sector <- freqInteraction.Sector$Vocational
freqInteraction.Sector %>% mutate(Sector = ifelse(as.character(Vocational) == "Yes", "Vocational", "University")) -> freqInteraction.Sector
freqInteraction.Sector <- freqInteraction.Sector[-c(1)]
freq.Sector$source<-rep("survey1")
freqInteraction.Sector$source<-rep("survey2")
freqbinded.Sector <- rbind(freq.Sector, freqInteraction.Sector)
freqbinded.Sector$source <- factor(freqbinded.Sector$source) 
ggplot(freqbinded.Sector, aes(x = Sector, y=freqSector, fill = source)) + geom_bar(stat="identity", position = "dodge")+scale_y_continuous(labels=scales::percent) + theme(axis.title.y=element_blank())


freqInteraction.Discipline %>%mutate(Discipline = ifelse(as.character(Discipline) == "No", "Other", as.character(Discipline))) -> freqInteraction.Discipline2
freq.Discipline %>% mutate(Discipline = ifelse(as.character(Discipline) == "No", "Other", as.character(Discipline))) %>%
                    mutate(n = ifelse(as.character(Discipline) =="Engineering", sum(n[as.character(Discipline)=="Engineering" | as.character(Discipline)=="Technology"]), n)) %>%
                    mutate(Discipline = ifelse(as.character(Discipline) == "Engineering", "Tech/Engineering", as.character(Discipline))) %>%
                    subset(as.character(Discipline) != "Technology")-> freq.Discipline2

freq.Discipline2$source<-rep("survey1")
freqInteraction.Discipline2$source<-rep("survey2")
freqbinded.Discipline <- rbind(freq.Discipline2, freqInteraction.Discipline2)
freqbinded.Discipline$source <- factor(freqbinded.Discipline$source) 
freqbinded.Discipline$Discipline <- factor(freqbinded.Discipline$Discipline, levels = c("Biomedicine", "Humanities", "Social Sciences", "Sciences", "Tech/Engineering", "Other"))
ggplot(freqbinded.Discipline, aes(x = Discipline, y=freqDiscipline, fill = source)) + geom_bar(stat="identity", position = "dodge")+scale_y_continuous(labels=scales::percent) + theme(axis.title.y=element_blank())


#ggplot(freq.Gender, aes(x=Gender, y=freqGender, fill=Gender)) + geom_bar(stat="identity")+scale_y_continuous(labels=scales::percent) + theme(axis.title.y=element_blank(),axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank())
#ggsave('../figures/gender.pdf', width = 80, height = 55, units = "mm")
#ggplot(freq.Age, aes(x=Age, y=freqAge, fill=Age)) + geom_bar(stat="identity")+scale_y_continuous(labels=scales::percent) + theme(axis.title.y=element_blank(),axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank())
#ggsave('../figures/age.pdf', width = 80, height = 55, units = "mm")
#ggplot(freq.Experience, aes(x=Experience, y=freqExperience, fill=Experience)) + geom_bar(stat="identity")+scale_y_continuous(labels=scales::percent) + theme(axis.title.y=element_blank(),axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank())
#ggsave('../figures/experience.pdf', width = 80, height = 55, units = "mm")
#ggplot(freq.Sector, aes(x=Sector, y=freqSector, fill=Sector)) + geom_bar(stat="identity")+scale_y_continuous(labels=scales::percent) + theme(axis.title.y=element_blank(),axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank())
#ggsave('../figures/sector.pdf', width = 80, height = 55, units = "mm")
#ggplot(freq.Discipline, aes(x=Discipline, y=freqDiscipline, fill=Discipline)) + geom_bar(stat="identity")+scale_y_continuous(labels=scales::percent) + theme(axis.title.y=element_blank(),axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank())
#ggsave('../figures/discipline.pdf', width = 150, height = 62, units = "mm")


survey.pilot %>% group_by( Gender, WhatsApp ) %>% summarise ( n = n() ) %>% mutate( freqWhatsApp = n/sum(n)) -> freq.Gender.WhatsApp
survey.pilot %>% group_by( Experience, WhatsApp ) %>% summarise ( n = n() ) %>% mutate( freqWhatsApp = n/sum(n)) -> freq.Experience.WhatsApp
survey.pilot %>% group_by( Sector, WhatsApp ) %>% summarise ( n = n() ) %>% mutate( freqWhatsApp = n/sum(n)) -> freq.Sector.WhatsApp

survey.pilot %>% group_by( Gender, Telegram ) %>% summarise ( n = n() ) %>% mutate( freqTelegram = n/sum(n)) -> freq.Gender.Telegram
survey.pilot %>% group_by( Experience, Telegram ) %>% summarise ( n = n() ) %>% mutate( freqTelegram = n/sum(n)) -> freq.Experience.Telegram
survey.pilot %>% group_by( Sector, Telegram ) %>% summarise ( n = n() ) %>% mutate( freqTelegram = n/sum(n)) -> freq.Sector.Telegram

survey.pilot %>% group_by( Gender, Provided ) %>% summarise ( n = n() ) %>% mutate( freqWhatsApp = n/sum(n)) -> freq.Gender.Platform
survey.pilot %>% group_by( Experience, Provided ) %>% summarise ( n = n() ) %>% mutate( freqWhatsApp = n/sum(n)) -> freq.Experience.Platform
survey.pilot %>% group_by( Sector, Provided ) %>% summarise ( n = n() ) %>% mutate( freqWhatsApp = n/sum(n)) -> freq.Sector.Platform
