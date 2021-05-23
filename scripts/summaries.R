library(psych)
library(dplyr)
library(tidyr)
library(ggplot2)

data <- read.csv("../data/survey-pilot-3-EN.csv")

data %>% group_by( Gender ) %>% summarise ( n = n() ) %>% mutate( freqGender = n/sum(n)) -> freq.Gender
data %>% group_by( Age ) %>% summarise ( n = n() ) %>% mutate( freqAge = n/sum(n)) -> freq.Age
data %>% group_by( Experience ) %>% summarise ( n = n() ) %>% mutate( freqExperience = n/sum(n)) -> freq.Experience
data %>% group_by( Sector ) %>% summarise ( n = n() ) %>% mutate( freqSector = n/sum(n)) -> freq.Sector
data %>% group_by( Discipline ) %>% summarise ( n = n() ) %>% mutate( freqDiscipline = n/sum(n)) -> freq.Discipline

#aes(y = ..prop.., fill = factor(..x..)),
ggplot(freq.Gender, aes(x=Gender, y=freqGender, fill=Gender)) + geom_bar(stat="identity")+scale_y_continuous(labels=scales::percent) + theme(axis.title.y=element_blank(),axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank())
ggsave('../figures/gender.pdf', width = 80, height = 55, units = "mm")
ggplot(freq.Age, aes(x=Age, y=freqAge, fill=Age)) + geom_bar(stat="identity")+scale_y_continuous(labels=scales::percent) + theme(axis.title.y=element_blank(),axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank())
ggsave('../figures/age.pdf', width = 80, height = 55, units = "mm")
ggplot(freq.Experience, aes(x=Experience, y=freqExperience, fill=Experience)) + geom_bar(stat="identity")+scale_y_continuous(labels=scales::percent) + theme(axis.title.y=element_blank(),axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank())
ggsave('../figures/experience.pdf', width = 80, height = 55, units = "mm")
ggplot(freq.Sector, aes(x=Sector, y=freqSector, fill=Sector)) + geom_bar(stat="identity")+scale_y_continuous(labels=scales::percent) + theme(axis.title.y=element_blank(),axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank())
ggsave('../figures/sector.pdf', width = 80, height = 55, units = "mm")
ggplot(freq.Discipline, aes(x=Discipline, y=freqDiscipline, fill=Discipline)) + geom_bar(stat="identity")+scale_y_continuous(labels=scales::percent) + theme(axis.title.y=element_blank(),axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank())
ggsave('../figures/discipline.pdf', width = 150, height = 62, units = "mm")


data %>% group_by( Gender, WhatsApp ) %>% summarise ( n = n() ) %>% mutate( freqWhatsApp = n/sum(n)) -> freq.Gender.WhatsApp
data %>% group_by( Experience, WhatsApp ) %>% summarise ( n = n() ) %>% mutate( freqWhatsApp = n/sum(n)) -> freq.Experience.WhatsApp
data %>% group_by( Sector, WhatsApp ) %>% summarise ( n = n() ) %>% mutate( freqWhatsApp = n/sum(n)) -> freq.Sector.WhatsApp

data %>% group_by( Gender, Telegram ) %>% summarise ( n = n() ) %>% mutate( freqTelegram = n/sum(n)) -> freq.Gender.Telegram
data %>% group_by( Experience, Telegram ) %>% summarise ( n = n() ) %>% mutate( freqTelegram = n/sum(n)) -> freq.Experience.Telegram
data %>% group_by( Sector, Telegram ) %>% summarise ( n = n() ) %>% mutate( freqTelegram = n/sum(n)) -> freq.Sector.Telegram

data %>% group_by( Gender, Provided ) %>% summarise ( n = n() ) %>% mutate( freqWhatsApp = n/sum(n)) -> freq.Gender.Platform
data %>% group_by( Experience, Provided ) %>% summarise ( n = n() ) %>% mutate( freqWhatsApp = n/sum(n)) -> freq.Experience.Platform
data %>% group_by( Sector, Provided ) %>% summarise ( n = n() ) %>% mutate( freqWhatsApp = n/sum(n)) -> freq.Sector.Platform
