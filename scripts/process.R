
library(ggplot2)
library(dplyr)
library(tidyr)
library(scales)

data <- read.csv("../data/survey-pilot-3.csv")

ggplot(data, aes(x = WhatsApp, group = Sector)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Sector)
ggplot(data, aes(x = Telegram, group = Sector)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Sector)
ggplot(data, aes(x = Provided, group = Sector)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Sector)

ggplot(data, aes(x = WhatsApp, group = Age)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Age)
ggplot(data, aes(x = Telegram, group = Age)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Age)
ggplot(data, aes(x = Provided, group = Age)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Age)

ggplot(data, aes(x = WhatsApp, group = Experience)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Experience)
ggplot(data, aes(x = Telegram, group = Experience)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Experience)
ggplot(data, aes(x = Provided, group = Experience)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Experience)

ggplot(data, aes(x = WhatsApp, group = Discipline)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Discipline)
ggplot(data, aes(x = Telegram, group = Discipline)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Discipline)
ggplot(data, aes(x = Provided, group = Discipline)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Discipline)

ggplot(data, aes(x = WhatsApp, group = Gender)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Gender)
ggplot(data, aes(x = Telegram, group = Gender)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Gender)
ggplot(data, aes(x = Provided, group = Gender)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Gender)

data <- within(data, Messaging.Organization <- factor(Messaging.Organization, levels=names(sort(table(Messaging.Organization), decreasing=TRUE))))

ggplot(data, aes( x = Messaging.Organization, y = ..count.., group=Sector, fill = Sector ) ) + geom_bar()+ theme(axis.text.x = element_text(angle = 90))+coord_flip()
