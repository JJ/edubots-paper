
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
q
