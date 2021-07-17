library(ggplot2)
library(dplyr)
library(tidyr)
library(scales)
library(ggthemes)

# data <- read.csv("../data/survey-pilot-3.csv")
data <- read.csv("../data/survey-pilot-3-EN.csv")

ggplot(data, aes(x = MessagingPlatformWhatsApp, group = Sector)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Sector)+ theme(axis.title.y=element_blank())
#ggsave('../figures/sector_whatsapp.pdf', width = 100, height = 70, units = "mm")
ggplot(data, aes(x = MessagingPlatformTelegram, group = Sector)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Sector)+ theme(axis.title.y=element_blank())
#ggsave('../figures/sector_telegram.pdf', width = 100, height = 70, units = "mm")
ggplot(data, aes(x = MessagingPlatformProvided, group = Sector)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Sector)+ theme(axis.title.y=element_blank())
#ggsave('../figures/sector_provided.pdf', width = 100, height = 70, units = "mm")


ggplot(data, aes(x = MessagingPlatformWhatsApp, group = Age)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Age)+ theme(axis.title.y=element_blank())
#ggsave('../figures/age_whatsapp.pdf', width = 100, height = 70, units = "mm")
ggplot(data, aes(x = MessagingPlatformTelegram, group = Age)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Age)+ theme(axis.title.y=element_blank())
#ggsave('../figures/age_telegram.pdf', width = 100, height = 70, units = "mm")
ggplot(data, aes(x = MessagingPlatformProvided, group = Age)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Age)+ theme(axis.title.y=element_blank())
#ggsave('../figures/age_provided.pdf', width = 100, height = 70, units = "mm")


ggplot(data, aes(x = MessagingPlatformWhatsApp, group = Experience)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Experience)+ theme(axis.title.y=element_blank())
#ggsave('../figures/experience_whatsapp.pdf', width = 100, height = 70, units = "mm")
ggplot(data, aes(x = MessagingPlatformTelegram, group = Experience)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Experience)+ theme(axis.title.y=element_blank())
#ggsave('../figures/experience_telegram.pdf', width = 100, height = 70, units = "mm")
ggplot(data, aes(x = MessagingPlatformProvided, group = Experience)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Experience)+ theme(axis.title.y=element_blank())
#ggsave('../figures/experience_provided.pdf', width = 100, height = 70, units = "mm")

#ggplot(data, aes(x = WhatsApp, group = Discipline)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Discipline)

data %>%mutate(Discipline = ifelse(as.character(Discipline) == "No", "Other", as.character(Discipline))) %>%
  mutate(Discipline = ifelse(as.character(Discipline) == "Engineering", "Tech/Engineering", as.character(Discipline))) %>%
  mutate(Discipline = ifelse(as.character(Discipline) == "Technology", "Tech/Engineering", as.character(Discipline)))->data.Discipline
ggplot(data.Discipline, aes(x = MessagingPlatformWhatsApp, group = Discipline)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~factor(Discipline, levels = c("Biomedicine", "Humanities", "Social Sciences", "Sciences", "Tech/Engineering", "Other")))+ theme(axis.title.y=element_blank())
#ggsave('../figures/discipline_whatsapp.pdf', width = 186, height = 77, units = "mm")
ggplot(data.Discipline, aes(x = MessagingPlatformTelegram, group = Discipline)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~factor(Discipline, levels = c("Biomedicine", "Humanities", "Social Sciences", "Sciences", "Tech/Engineering", "Other")))+ theme(axis.title.y=element_blank())
#ggsave('../figures/discipline_telegram.pdf', width = 186, height = 77, units = "mm")
ggplot(data.Discipline, aes(x = MessagingPlatformProvided, group = Discipline)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~factor(Discipline, levels = c("Biomedicine", "Humanities", "Social Sciences", "Sciences", "Tech/Engineering", "Other")))+ theme(axis.title.y=element_blank())
#ggsave('../figures/discipline_provided.pdf', width = 186, height = 77, units = "mm")


#ggplot(data, aes(x = WhatsApp, group = Gender)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Gender)
ggplot(data, aes(x = MessagingPlatformWhatsApp, group = Gender)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~factor(Gender, levels=c('Female','Male','PNTS')))+ theme(axis.title.y=element_blank())
#ggsave('../figures/gender_whatsapp.pdf', width = 100, height = 70, units = "mm")
ggplot(data, aes(x = MessagingPlatformTelegram, group = Gender)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~factor(Gender, levels=c('Female','Male','PNTS')))+ theme(axis.title.y=element_blank())
#ggsave('../figures/gender_telegram.pdf', width = 100, height = 70, units = "mm")
ggplot(data, aes(x = MessagingPlatformProvided, group = Gender)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~factor(Gender, levels=c('Female','Male','PNTS')))+ theme(axis.title.y=element_blank())
#ggsave('../figures/gender_provided.pdf', width = 100, height = 70, units = "mm")


# Statistical significance
df <-select(data, MessagingPlatformWhatsApp, MessagingPlatformTelegram, MessagingPlatformProvided, Gender, Sector, Age, Experience, Discipline)
df[as.character(df$Gender)!="PNTS", ] -> df1
df1[as.character(df1$Sector)!="No", ] -> df1
df1[as.character(df1$Discipline)!="No", ] -> df1
df1[as.character(df1$Experience)!="No", ] -> df1
df1[as.character(df1$Gender)!="No", ] -> df1
df2<- droplevels(df1)

mytable<-cbind(table(df2$Gender, df2$MessagingPlatformWhatsApp), table(df2$Gender, df2$MessagingPlatformTelegram), table(df2$Gender, df2$MessagingPlatformProvided))
App.vs.Gender<-mytable[,-c(1,3,5)]
colnames(App.vs.Gender)<- c("WhatsApp", "Telegram","Provided")
chisq.test(App.vs.Gender)$p.value

mytable<-cbind(table(df2$Age, df2$MessagingPlatformWhatsApp), table(df2$Age, df2$MessagingPlatformTelegram), table(df2$Age, df2$MessagingPlatformProvided))
App.vs.Age<-mytable[,-c(1,3,5)]
colnames(App.vs.Age)<- c("WhatsApp", "Telegram","Provided")
chisq.test(App.vs.Age)$p.value

mytable<-cbind(table(df2$Sector, df2$MessagingPlatformWhatsApp), table(df2$Sector, df2$MessagingPlatformTelegram), table(df2$Sector, df2$MessagingPlatformProvided))
App.vs.Sector<-mytable[,-c(1,3,5)]
colnames(App.vs.Sector)<- c("WhatsApp", "Telegram","Provided")
chisq.test(App.vs.Sector)$p.value

df2 %>%mutate(Discipline = ifelse(as.character(Discipline) == "No", "Other", as.character(Discipline))) %>%
  mutate(Discipline = ifelse(as.character(Discipline) == "Engineering", "Tech/Engineering", as.character(Discipline))) %>%
  mutate(Discipline = ifelse(as.character(Discipline) == "Technology", "Tech/Engineering", as.character(Discipline)))->df2
mytable<-cbind(table(df2$Discipline, df2$MessagingPlatformWhatsApp), table(df2$Discipline, df2$MessagingPlatformTelegram), table(df2$Discipline, df2$MessagingPlatformProvided))
App.vs.Discipline<-mytable[,-c(1,3,5)]
colnames(App.vs.Discipline)<- c("WhatsApp", "Telegram","Provided")
chisq.test(App.vs.Discipline)$p.value

data %>% group_by( PostCOVID.changes ) %>% filter( n() > 1 ) -> data.postCOVID
data.postCOVID <- within(data.postCOVID, PostCOVID.changes <- factor(PostCOVID.changes, levels=names(sort(table(PostCOVID.changes), decreasing=TRUE))))
ggplot(data.postCOVID, aes( x = PostCOVID.changes, y = ..count.., group=Sector, fill = Sector ) ) + geom_bar()+ theme(axis.text.x = element_text(angle = 90)) +coord_flip()+ theme_tufte()+ theme(axis.title.y=element_blank())
#ggsave('../figures/sector_covid.pdf', width = 190, height = 50, units = "mm")
ggplot(data.postCOVID, aes( x = PostCOVID.changes, y = ..count.., group=Gender, fill = Gender ) ) + geom_bar()+ theme(axis.text.x = element_text(angle = 90)) +coord_flip()+ theme_tufte()+ theme(axis.title.y=element_blank())
#ggsave('../figures/gender_covid.pdf', width = 190, height = 50, units = "mm")
ggplot(data.postCOVID, aes( x = PostCOVID.changes, y = ..count.., group=Experience, fill = Experience ) ) + geom_bar()+ theme(axis.text.x = element_text(angle = 90)) +coord_flip()+ theme_tufte()+ theme(axis.title.y=element_blank())
#ggsave('../figures/experience_covid.pdf', width = 190, height = 50, units = "mm")

# Statistical significance
df <-select(data.postCOVID, PostCOVID.changes, Gender, Sector, Experience, Discipline)
df[as.character(df$Gender)!="PNTS", ] -> df1
df1[as.character(df1$Gender)!="No", ] -> df1
df1[as.character(df1$Discipline)!="No", ] -> df1
df1[as.character(df1$Experience)!="No", ] -> df1
df1[as.character(df1$Sector)!="No", ] -> df1
df2<- droplevels(df1)


covidChanges.vs.Gender<-table(df2$Gender,df2$PostCOVID.changes)
colnames(covidChanges.vs.Gender)<- c("Did/do", "Didn't/do","safer", "Didn't/don't")
covidChanges.vs.Gender<-covidChanges.vs.Gender[,c(3,2,1,4)]
chisq<-chisq.test(t(covidChanges.vs.Gender))


#install.packages("corrplot")
#http://www.sthda.com/english/wiki/chi-square-test-of-independence-in-r
library(corrplot)
chisq$p.value
#round(chisq$residuals,3)

# Dependency residuals
corrplot(chisq$residuals, is.cor=FALSE)
# Contribution in percentage (%)
contrib <- 100*chisq$residuals^2/chisq$statistic
round(contrib, 2)
round(chisq$stdres, 3)
corrplot(contrib, is.cor = FALSE)



covidChanges.vs.Sector<-table(df2$Sector, df2$PostCOVID.changes)
colnames(covidChanges.vs.Sector)<- c("Did/do", "Didn't/do","safer", "Didn't/don't")
chisq<-chisq.test(covidChanges.vs.Sector)
chisq$p.value
corrplot(chisq$residuals, is.corr=FALSE)
# Contribution in percentage (%)
contrib <- 100*chisq$residuals^2/chisq$statistic
round(contrib, 2)
round(chisq$stdres, 3)
corrplot(contrib, is.cor = FALSE)

covidChanges.vs.Experience<-table(df2$Experience, df2$PostCOVID.changes)
colnames(covidChanges.vs.Experience)<- c("Did/do", "Didn't/do","safer", "Didn't/don't")
chisq.test(covidChanges.vs.Experience)$p.value

df2 %>%mutate(Discipline = ifelse(as.character(Discipline) == "No", "Hum/Social Sciences", as.character(Discipline))) %>%
  mutate(Discipline = ifelse(as.character(Discipline) == "Other", "Hum/Social Sciences", as.character(Discipline))) %>%
  mutate(Discipline = ifelse(as.character(Discipline) == "Engineering", "Tech/Engineering", as.character(Discipline))) %>%
  mutate(Discipline = ifelse(as.character(Discipline) == "Technology", "Tech/Engineering", as.character(Discipline))) %>%
  mutate(Discipline = ifelse(as.character(Discipline) == "Humanities", "Hum/Social Sciences", as.character(Discipline))) %>%
  mutate(Discipline = ifelse(as.character(Discipline) == "Social Sciences", "Hum/Social Sciences", as.character(Discipline))) %>%
  mutate(Discipline = ifelse(as.character(Discipline) == "Sciences", "Biomed/Sciences", as.character(Discipline))) %>%
  mutate(Discipline = ifelse(as.character(Discipline) == "Biomedicine", "Biomed/Sciences", as.character(Discipline)))->df2

covidChanges.vs.Discipline<-table(df2$Discipline, df2$PostCOVID.changes)
colnames(covidChanges.vs.Discipline)<-c("Did/do", "Didn't/do","safer", "Didn't/don't")
chisq<-chisq.test(covidChanges.vs.Discipline)
chisq$p.value
corrplot(chisq$residuals, is.cor=FALSE)
# Contibution in percentage (%)
contrib <- 100*chisq$residuals^2/chisq$statistic
round(contrib, 2)
round(chisq$stdres, 3)
corrplot(contrib, is.cor = FALSE)

#Several answers in the same cell: need to split them (use the commas in the original csv in Spanish as separator after translation)
#data <- within(data, Messaging.Organization <- factor(Messaging.Organization, levels=names(sort(table(Messaging.Organization), decreasing=TRUE))))
#ggplot(data, aes( x = Messaging.Organization, y = ..count.., group=Sector, fill = Sector ) ) + geom_bar()+ theme(axis.text.x = element_text(angle = 90))+coord_flip()

library(tidyverse)
data %>%  mutate(Messaging.Organization =str_split(Messaging.Organization, ", ")) %>% unnest(cols = c(Messaging.Organization)) -> data.MessagingOrganization
data.MessagingOrganization <- within(data.MessagingOrganization, Messaging.Organization <- factor(Messaging.Organization, levels=names(sort(table(Messaging.Organization), decreasing=TRUE))))
ggplot(data.MessagingOrganization, aes( x = Messaging.Organization, y = ..count.., group=Sector, fill = Sector ) ) + geom_bar()+ theme(axis.text.x = element_text(angle = 90))+coord_flip()+ theme(axis.title.y=element_blank())
#ggsave('../figures/messaging_organization.pdf', width = 190, height = 50, units = "mm")


df <-select(data.MessagingOrganization, Messaging.Organization, Gender, Sector, Experience, Discipline)
df[as.character(df$Gender)!="PNTS", ] -> df1
df1[as.character(df1$Gender)!="No", ] -> df1
df1[as.character(df1$Discipline)!="No", ] -> df1
df1[as.character(df1$Experience)!="No", ] -> df2
df1[as.character(df1$Sector)!="No", ] %>% droplevels -> df2
#df2 %>%mutate(Sector = ifelse(as.character(Sector) == "No", "Vocational", as.character(Sector)))->df2
#df2[as.character(df2$Gender)!="PNTS", ] -> df1

df2 %>%mutate(Messaging.Organization = ifelse(as.character(Messaging.Organization) == "A chat with all the students and teachers in my Faculty/School", "A chat with all the students and teachers in my Faculty/School/all years", as.character(Messaging.Organization))) %>%
  mutate(Messaging.Organization = ifelse(as.character(Messaging.Organization) == "A chat with all the students and teachers in the same studies (all years)", "A chat with all the students and teachers in my Faculty/School/all years", as.character(Messaging.Organization)))->df2
df2 %>%mutate(Messaging.Organization = ifelse(as.character(Messaging.Organization) == "A chat with all the students and teachers in my Faculty/School/all years", "Chat interactions among all students, teachers of the School/Faculty", as.character(Messaging.Organization))) %>%
  mutate(Messaging.Organization = ifelse(as.character(Messaging.Organization) == "I'd rather leave students self-organize and not be part of the chat", "Teacher not being part of the interaction", as.character(Messaging.Organization)))%>%
  mutate(Messaging.Organization = ifelse(as.character(Messaging.Organization) == "A chat with my students in the same course", "Chat interactions among students in the same course", as.character(Messaging.Organization)))%>%
  mutate(Messaging.Organization = ifelse(as.character(Messaging.Organization) == "A chat with all students and teachers in the same semester/year", "Chat interactions among students of the same study year and teachers", as.character(Messaging.Organization)))->df2

df2 <- within(df2, Messaging.Organization <- factor(Messaging.Organization, levels=names(sort(table(Messaging.Organization), decreasing=TRUE))))
ggplot(df2, aes( x = Messaging.Organization, y = ..count.., group=Sector, fill = Sector ) ) + geom_bar()+ theme(axis.text.x = element_text(angle = 90))+coord_flip()+ theme(axis.title.y=element_blank())


# Statistical significance
Messaging.vs.Gender<-table(df2$Gender, df2$Messaging.Organization)
chisq<-chisq.test(Messaging.vs.Gender)
chisq$p.value
Messaging.vs.Sector<-table(df2$Sector, df2$Messaging.Organization)
chisq<-chisq.test(Messaging.vs.Sector)
chisq$p.value
Messaging.vs.Experience<-table(df2$Experience, df2$Messaging.Organization)
chisq<-chisq.test(Messaging.vs.Experience)
chisq$p.value
Messaging.vs.Discipline<-table(df2$Discipline, df2$Messaging.Organization)
chisq<-chisq.test(Messaging.vs.Discipline)
chisq$p.value


data %>%  mutate(ChatbotType = ifelse(AgendaBot == "No","","AgendaBot,")) %>%
  mutate(ChatbotType = ifelse(ClassMaterialBot == "No", paste(ChatbotType, "",sep=""), paste(ChatbotType, "ClassMaterialBot,",sep=""))) %>%
  mutate(ChatbotType = ifelse(FAQBot == "No",paste(ChatbotType, "",sep=""), paste(ChatbotType, "FAQBot,",sep=""))) %>%
  mutate(ChatbotType = ifelse(GradesBot == "No", paste(ChatbotType, "",sep=""), paste(ChatbotType, "GradesBot,",sep=""))) %>%
  mutate(ChatbotType = ifelse(OtherBot == "No", paste(ChatbotType, "",sep=""), paste(ChatbotType, "OtherBot,",sep=""))) %>%
  mutate(ChatbotType = substr(ChatbotType,1,nchar(ChatbotType)-1))-> df1

df1 %>%  mutate(ChatbotType =str_split(ChatbotType, ",")) %>% unnest(cols = c(ChatbotType)) -> data.ChatbotType
data.ChatbotType <- within(data.ChatbotType, ChatbotType <- factor(ChatbotType, levels=names(sort(table(ChatbotType), decreasing=TRUE))))
ggplot(data.ChatbotType, aes( x = ChatbotType, y = ..count.., group=Sector, fill = Sector ) ) + geom_bar()+ theme(axis.text.x = element_text(angle = 90)) +coord_flip()+ theme_tufte()+ theme(axis.title.y=element_blank())
#ggsave('../figures/sector_chatbottype.pdf', width = 190, height = 50, units = "mm")
ggplot(data.ChatbotType, aes( x = ChatbotType, y = ..count.., group=Gender, fill = Gender ) ) + geom_bar()+ theme(axis.text.x = element_text(angle = 90)) +coord_flip()+ theme_tufte()+ theme(axis.title.y=element_blank())
#ggsave('../figures/gender_chatbottype.pdf', width = 190, height = 50, units = "mm")
ggplot(data.ChatbotType, aes( x = ChatbotType, y = ..count.., group=Experience, fill = Experience ) ) + geom_bar()+ theme(axis.text.x = element_text(angle = 90)) +coord_flip()+ theme_tufte()+ theme(axis.title.y=element_blank())
#ggsave('../figures/experience_chatbottype.pdf', width = 190, height = 50, units = "mm")

# Statistical significance
df <-select(data.ChatbotType, ChatbotType, Gender, Sector, Experience, Discipline)
df[as.character(df$Gender)!="PNTS", ] -> df1
df1[as.character(df1$Gender)!="No", ] -> df1
df1[as.character(df1$Discipline)!="No", ] -> df1
df1[as.character(df1$Experience)!="No", ] -> df1
df1[as.character(df1$Sector)!="No", ] -> df1
df2<- droplevels(df1)

ChatbotType.vs.Gender<-table(df2$Gender, df2$ChatbotType)
#colnames(covidChanges.vs.Gender)<- c("Did/do", "Didn't/do","safer", "Didn't/don't")
chisq<-chisq.test(ChatbotType.vs.Gender)
chisq$p.value
ChatbotType.vs.Sector<-table(df2$Sector, df2$ChatbotType)
#colnames(covidChanges.vs.Gender)<- c("Did/do", "Didn't/do","safer", "Didn't/don't")
chisq<-chisq.test(ChatbotType.vs.Sector)
chisq$p.value
ChatbotType.vs.Experience<-table(df2$Experience, df2$ChatbotType)
#colnames(covidChanges.vs.Gender)<- c("Did/do", "Didn't/do","safer", "Didn't/don't")
chisq<-chisq.test(ChatbotType.vs.Experience)
chisq$p.value

df2 %>%mutate(Discipline = ifelse(as.character(Discipline) == "No", "Hum/Social Sciences", as.character(Discipline))) %>%
  mutate(Discipline = ifelse(as.character(Discipline) == "Other", "Hum/Social Sciences", as.character(Discipline))) %>%
  mutate(Discipline = ifelse(as.character(Discipline) == "Engineering", "Tech/Engineering", as.character(Discipline))) %>%
  mutate(Discipline = ifelse(as.character(Discipline) == "Technology", "Tech/Engineering", as.character(Discipline))) %>%
  mutate(Discipline = ifelse(as.character(Discipline) == "Humanities", "Hum/Social Sciences", as.character(Discipline))) %>%
  mutate(Discipline = ifelse(as.character(Discipline) == "Social Sciences", "Hum/Social Sciences", as.character(Discipline))) %>%
  mutate(Discipline = ifelse(as.character(Discipline) == "Sciences", "Biomed/Sciences", as.character(Discipline))) %>%
  mutate(Discipline = ifelse(as.character(Discipline) == "Biomedicine", "Biomed/Sciences", as.character(Discipline)))->df2
ChatbotType.vs.Discipline<-table(df2$Discipline, df2$ChatbotType)
#colnames(covidChanges.vs.Gender)<- c("Did/do", "Didn't/do","safer", "Didn't/don't")
chisq<-chisq.test(ChatbotType.vs.Discipline)
chisq$p.value


