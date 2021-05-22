
library(ggplot2)
library(dplyr)
library(tidyr)
library(scales)
library(ggthemes)

# data <- read.csv("../data/survey-pilot-3.csv")
data <- read.csv("../data/survey-pilot-3-EN.csv")

ggplot(data, aes(x = WhatsApp, group = Sector)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Sector)+ theme(axis.title.y=element_blank())
ggsave('../figures/sector_whatsapp.pdf', width = 100, height = 70, units = "mm")
ggplot(data, aes(x = Telegram, group = Sector)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Sector)+ theme(axis.title.y=element_blank())
ggsave('../figures/sector_telegram.pdf', width = 100, height = 70, units = "mm")
ggplot(data, aes(x = Provided, group = Sector)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Sector)+ theme(axis.title.y=element_blank())
ggsave('../figures/sector_provided.pdf', width = 100, height = 70, units = "mm")


ggplot(data, aes(x = WhatsApp, group = Age)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Age)+ theme(axis.title.y=element_blank())
ggsave('../figures/age_whatsapp.pdf', width = 100, height = 70, units = "mm")
ggplot(data, aes(x = Telegram, group = Age)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Age)+ theme(axis.title.y=element_blank())
ggsave('../figures/age_telegram.pdf', width = 100, height = 70, units = "mm")
ggplot(data, aes(x = Provided, group = Age)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Age)+ theme(axis.title.y=element_blank())
ggsave('../figures/age_provided.pdf', width = 100, height = 70, units = "mm")


ggplot(data, aes(x = WhatsApp, group = Experience)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Experience)+ theme(axis.title.y=element_blank())
ggsave('../figures/experience_whatsapp.pdf', width = 100, height = 70, units = "mm")
ggplot(data, aes(x = Telegram, group = Experience)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Experience)+ theme(axis.title.y=element_blank())
ggsave('../figures/experience_telegram.pdf', width = 100, height = 70, units = "mm")
ggplot(data, aes(x = Provided, group = Experience)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Experience)+ theme(axis.title.y=element_blank())
ggsave('../figures/experience_provided.pdf', width = 100, height = 70, units = "mm")

#ggplot(data, aes(x = WhatsApp, group = Discipline)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Discipline)
ggplot(data, aes(x = WhatsApp, group = Discipline)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~factor(Discipline, levels=c('Biomedicine','Humanities','Social Sciences','Sciences','Engineering','Technology','No')))+ theme(axis.title.y=element_blank())
ggsave('../figures/discipline_whatsapp.pdf', width = 186, height = 77, units = "mm")
ggplot(data, aes(x = Telegram, group = Discipline)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~factor(Discipline, levels=c('Biomedicine','Humanities','Social Sciences','Sciences','Engineering','Technology','No')))+ theme(axis.title.y=element_blank())
ggsave('../figures/discipline_telegram.pdf', width = 186, height = 77, units = "mm")
ggplot(data, aes(x = Provided, group = Discipline)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~factor(Discipline, levels=c('Biomedicine','Humanities','Social Sciences','Sciences','Engineering','Technology','No')))+ theme(axis.title.y=element_blank())
ggsave('../figures/discipline_provided.pdf', width = 186, height = 77, units = "mm")


#ggplot(data, aes(x = WhatsApp, group = Gender)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Gender)
ggplot(data, aes(x = WhatsApp, group = Gender)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~factor(Gender, levels=c('Female','Male','PNTS')))+ theme(axis.title.y=element_blank())
ggsave('../figures/gender_whatsapp.pdf', width = 100, height = 70, units = "mm")
ggplot(data, aes(x = Telegram, group = Gender)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~factor(Gender, levels=c('Female','Male','PNTS')))+ theme(axis.title.y=element_blank())
ggsave('../figures/gender_telegram.pdf', width = 100, height = 70, units = "mm")
ggplot(data, aes(x = Provided, group = Gender)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~factor(Gender, levels=c('Female','Male','PNTS')))+ theme(axis.title.y=element_blank())
ggsave('../figures/gender_provided.pdf', width = 100, height = 70, units = "mm")


data %>% group_by( PostCOVID.changes ) %>% filter( n() > 1 ) -> data.postCOVID
data.postCOVID <- within(data.postCOVID, PostCOVID.changes <- factor(PostCOVID.changes, levels=names(sort(table(PostCOVID.changes), decreasing=TRUE))))
ggplot(data.postCOVID, aes( x = PostCOVID.changes, y = ..count.., group=Sector, fill = Sector ) ) + geom_bar()+ theme(axis.text.x = element_text(angle = 90)) +coord_flip()+ theme_tufte()+ theme(axis.title.y=element_blank())
ggsave('../figures/sector_covid.pdf', width = 190, height = 50, units = "mm")
ggplot(data.postCOVID, aes( x = PostCOVID.changes, y = ..count.., group=Gender, fill = Gender ) ) + geom_bar()+ theme(axis.text.x = element_text(angle = 90)) +coord_flip()+ theme_tufte()+ theme(axis.title.y=element_blank())
ggsave('../figures/gender_covid.pdf', width = 190, height = 50, units = "mm")
ggplot(data.postCOVID, aes( x = PostCOVID.changes, y = ..count.., group=Experience, fill = Experience ) ) + geom_bar()+ theme(axis.text.x = element_text(angle = 90)) +coord_flip()+ theme_tufte()+ theme(axis.title.y=element_blank())
ggsave('../figures/experience_covid.pdf', width = 190, height = 50, units = "mm")


#Several answers in the same cell: need to split them (use the commas in the original csv in Spanish as separator after translation)
#data <- within(data, Messaging.Organization <- factor(Messaging.Organization, levels=names(sort(table(Messaging.Organization), decreasing=TRUE))))
#ggplot(data, aes( x = Messaging.Organization, y = ..count.., group=Sector, fill = Sector ) ) + geom_bar()+ theme(axis.text.x = element_text(angle = 90))+coord_flip()

library(tidyverse)
data %>%  mutate(Messaging.Organization =str_split(Messaging.Organization, ", ")) %>% unnest(cols = c(Messaging.Organization)) -> data.MessagingOrganization
data.MessagingOrganization <- within(data.MessagingOrganization, Messaging.Organization <- factor(Messaging.Organization, levels=names(sort(table(Messaging.Organization), decreasing=TRUE))))
ggplot(data.MessagingOrganization, aes( x = Messaging.Organization, y = ..count.., group=Sector, fill = Sector ) ) + geom_bar()+ theme(axis.text.x = element_text(angle = 90))+coord_flip()+ theme(axis.title.y=element_blank())
ggsave('../figures/messaging_organization.pdf', width = 190, height = 50, units = "mm")


data %>%  mutate(ChatbotType = ifelse(Agenda == "No","","Agenda,")) %>%
  mutate(ChatbotType = ifelse(ClassMaterial == "No", paste(ChatbotType, "",sep=""), paste(ChatbotType, "ClassMaterial,",sep=""))) %>%
  mutate(ChatbotType = ifelse(FAQ == "No",paste(ChatbotType, "",sep=""), paste(ChatbotType, "FAQ,",sep=""))) %>%
  mutate(ChatbotType = ifelse(Grades == "No", paste(ChatbotType, "",sep=""), paste(ChatbotType, "Grades,",sep=""))) %>%
  mutate(ChatbotType = ifelse(OtherBot == "No", paste(ChatbotType, "",sep=""), paste(ChatbotType, "OtherBot,",sep=""))) %>%
  mutate(ChatbotType = substr(ChatbotType,1,nchar(ChatbotType)-1))-> df1

df1 %>%  mutate(ChatbotType =str_split(ChatbotType, ",")) %>% unnest(cols = c(ChatbotType)) -> data.ChatbotType
data.ChatbotType <- within(data.ChatbotType, ChatbotType <- factor(ChatbotType, levels=names(sort(table(ChatbotType), decreasing=TRUE))))
ggplot(data.ChatbotType, aes( x = ChatbotType, y = ..count.., group=Sector, fill = Sector ) ) + geom_bar()+ theme(axis.text.x = element_text(angle = 90)) +coord_flip()+ theme_tufte()+ theme(axis.title.y=element_blank())
ggsave('../figures/sector_chatbottype.pdf', width = 190, height = 50, units = "mm")
ggplot(data.ChatbotType, aes( x = ChatbotType, y = ..count.., group=Gender, fill = Gender ) ) + geom_bar()+ theme(axis.text.x = element_text(angle = 90)) +coord_flip()+ theme_tufte()+ theme(axis.title.y=element_blank())
ggsave('../figures/gender_chatbottype.pdf', width = 190, height = 50, units = "mm")
ggplot(data.ChatbotType, aes( x = ChatbotType, y = ..count.., group=Experience, fill = Experience ) ) + geom_bar()+ theme(axis.text.x = element_text(angle = 90)) +coord_flip()+ theme_tufte()+ theme(axis.title.y=element_blank())
ggsave('../figures/experience_chatbottype.pdf', width = 190, height = 50, units = "mm")


