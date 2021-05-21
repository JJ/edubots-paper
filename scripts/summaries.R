library(psych)
library(dplyr)
library(tidyr)

data <- read.csv("../data/survey-pilot-3.csv")

data %>% group_by( Gender, WhatsApp ) %>% summarise ( n = n() ) %>% mutate( freqWhatsApp = n/sum(n)) -> freq.Gender.WhatsApp
data %>% group_by( Experience, WhatsApp ) %>% summarise ( n = n() ) %>% mutate( freqWhatsApp = n/sum(n)) -> freq.Experience.WhatsApp
data %>% group_by( Sector, WhatsApp ) %>% summarise ( n = n() ) %>% mutate( freqWhatsApp = n/sum(n)) -> freq.Sector.WhatsApp

data %>% group_by( Gender, Telegram ) %>% summarise ( n = n() ) %>% mutate( freqTelegram = n/sum(n)) -> freq.Gender.Telegram
data %>% group_by( Experience, Telegram ) %>% summarise ( n = n() ) %>% mutate( freqTelegram = n/sum(n)) -> freq.Experience.Telegram
data %>% group_by( Sector, Telegram ) %>% summarise ( n = n() ) %>% mutate( freqTelegram = n/sum(n)) -> freq.Sector.Telegram

data %>% group_by( Gender, Provided ) %>% summarise ( n = n() ) %>% mutate( freqWhatsApp = n/sum(n)) -> freq.Gender.Platform
data %>% group_by( Experience, Provided ) %>% summarise ( n = n() ) %>% mutate( freqWhatsApp = n/sum(n)) -> freq.Experience.Platform
data %>% group_by( Sector, Provided ) %>% summarise ( n = n() ) %>% mutate( freqWhatsApp = n/sum(n)) -> freq.Sector.Platform
