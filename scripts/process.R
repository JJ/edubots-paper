
library(ggplot2)
library(dplyr)
library(tidyr)
library(scales)
library(ggthemes)

# data <- read.csv("../data/survey-pilot-3.csv")
data <- read.csv("../data/survey-pilot-3-EN.csv")

ggplot(data, aes(x = WhatsApp, group = Sector)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Sector)
ggsave('../figures/sector_whatsapp.pdf')
ggplot(data, aes(x = Telegram, group = Sector)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Sector)
ggsave('../figures/sector_telegram.pdf')
ggplot(data, aes(x = Provided, group = Sector)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Sector)
ggsave('../figures/sector_provided.pdf')


ggplot(data, aes(x = WhatsApp, group = Age)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Age)
ggsave('../figures/age_whatsapp.pdf')
ggplot(data, aes(x = Telegram, group = Age)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Age)
ggsave('../figures/age_telegram.pdf')
ggplot(data, aes(x = Provided, group = Age)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Age)
ggsave('../figures/age_provided.pdf')


ggplot(data, aes(x = WhatsApp, group = Experience)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Experience)
ggsave('../figures/experience_whatsapp.pdf')
ggplot(data, aes(x = Telegram, group = Experience)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Experience)
ggsave('../figures/experience_telegram.pdf')
ggplot(data, aes(x = Provided, group = Experience)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Experience)
ggsave('../figures/experience_provided.pdf')

#ggplot(data, aes(x = WhatsApp, group = Discipline)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Discipline)
ggplot(data, aes(x = WhatsApp, group = Discipline)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~factor(Discipline, levels=c('Biomedicine','Humanities','Social Sciences','Sciences','Engineering','Technology','No')))
ggsave('../figures/discipline_whatsapp.pdf')
ggplot(data, aes(x = Telegram, group = Discipline)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~factor(Discipline, levels=c('Biomedicine','Humanities','Social Sciences','Sciences','Engineering','Technology','No')))
ggsave('../figures/discipline_telegram.pdf')
ggplot(data, aes(x = Provided, group = Discipline)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~factor(Discipline, levels=c('Biomedicine','Humanities','Social Sciences','Sciences','Engineering','Technology','No')))
ggsave('../figures/discipline_provided.pdf')


#ggplot(data, aes(x = WhatsApp, group = Gender)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Gender)
ggplot(data, aes(x = WhatsApp, group = Gender)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~factor(Gender, levels=c('Female','Male','PNTS')))
ggsave('../figures/gender_whatsapp.pdf')
ggplot(data, aes(x = Telegram, group = Gender)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~factor(Gender, levels=c('Female','Male','PNTS')))
ggsave('../figures/gender_telegram.pdf')
ggplot(data, aes(x = Provided, group = Gender)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~factor(Gender, levels=c('Female','Male','PNTS')))
ggsave('../figures/gender_provided.pdf')


data <- within(data, Messaging.Organization <- factor(Messaging.Organization, levels=names(sort(table(Messaging.Organization), decreasing=TRUE))))
ggplot(data, aes( x = Messaging.Organization, y = ..count.., group=Sector, fill = Sector ) ) + geom_bar()+ theme(axis.text.x = element_text(angle = 90))+coord_flip()

data %>% group_by( PostCOVID.changes ) %>% filter( n() > 1 ) -> data.postCOVID
data.postCOVID <- within(data.postCOVID, PostCOVID.changes <- factor(PostCOVID.changes, levels=names(sort(table(PostCOVID.changes), decreasing=TRUE))))
ggplot(data.postCOVID, aes( x = PostCOVID.changes, y = ..count.., group=Sector, fill = Sector ) ) + geom_bar()+ theme(axis.text.x = element_text(angle = 90)) +coord_flip()+ theme_tufte()+ theme(axis.title.y=element_blank())
ggsave('../figures/sector_covid.pdf')
ggplot(data.postCOVID, aes( x = PostCOVID.changes, y = ..count.., group=Gender, fill = Gender ) ) + geom_bar()+ theme(axis.text.x = element_text(angle = 90)) +coord_flip()+ theme_tufte()+ theme(axis.title.y=element_blank())
ggsave('../figures/gender_covid.pdf')
ggplot(data.postCOVID, aes( x = PostCOVID.changes, y = ..count.., group=Experience, fill = Experience ) ) + geom_bar()+ theme(axis.text.x = element_text(angle = 90)) +coord_flip()+ theme_tufte()+ theme(axis.title.y=element_blank())
ggsave('../figures/experience_covid.pdf')