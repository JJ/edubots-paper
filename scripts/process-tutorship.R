library(ggplot2)
library(dplyr)
library(tidyr)
library(scales)
library(ggthemes)

data <- read.csv("../data/survey-student-interaction-pilot-3-2021-EN.csv")

ggplot(data, aes(x = Interaction.Synchrony..or.not., group = Gender)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + xlab("Type of interaction") + ylab("relative frequencies") + facet_grid(~factor(Gender, levels=c('Female','Male','PNTS'))) + theme(axis.title.y=element_blank())
ggsave('../figures/gender_interaction.pdf', width = 100, height = 70, units = "mm")
ggplot(data, aes(x = Interaction.Synchrony..or.not., group = Age)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + xlab("Type of interaction") + ylab("relative frequencies") + facet_grid(~Age) + theme(axis.title.y=element_blank())
ggsave('../figures/age_interaction.pdf', width = 100, height = 70, units = "mm")
ggplot(data, aes(x = Interaction.Synchrony..or.not., group = Experience)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + xlab("Type of interaction") + ylab("relative frequencies") + facet_grid(~Experience) + theme(axis.title.y=element_blank())
ggsave('../figures/experience_interaction.pdf', width = 100, height = 70, units = "mm")
ggplot(data, aes(x = Interaction.Synchrony..or.not., group = Discipline)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count", show.legend = FALSE) + scale_y_continuous(labels=scales::percent) + xlab("Type of interaction") + ylab("relative frequencies") + facet_grid(~factor(Discipline, levels=c('Biomedicine','Humanities','Social Sciences', "Sciences", "Tech/Engineering","No"))) + theme(axis.title.y=element_blank())
ggsave('../figures/discipline_interaction.pdf', width = 186, height = 77, units = "mm")




ggplot(data, aes(x = Familiarity, group = Age)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Age)
ggplot(data, aes(x = Horizontality, group = Age)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Age)
ggplot(data, aes(x = Connectivity, group = Age)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Age)
ggplot(data, aes(x = Sustainability, group = Age)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Age)
ggplot(data, aes(x = OfficialFormation, group = Age)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Age)

ggplot(data, aes(x = Familiarity, group = Experience)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Experience)
ggplot(data, aes(x = Horizontality, group = Experience)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Experience)
ggplot(data, aes(x = Connectivity, group = Experience)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Experience)
ggplot(data, aes(x = Sustainability, group = Experience)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Experience)
ggplot(data, aes(x = OfficialFormation, group = Experience)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Experience)

ggplot(data, aes(x = Familiarity, group = Discipline)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Discipline)
ggplot(data, aes(x = Horizontality, group = Discipline)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Discipline)
ggplot(data, aes(x = Connectivity, group = Discipline)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Discipline)
ggplot(data, aes(x = Sustainability, group = Discipline)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Discipline)
ggplot(data, aes(x = OfficialFormation, group = Discipline)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Discipline)

ggplot(data, aes(x = Familiarity, group = Gender)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Gender)
ggplot(data, aes(x = Horizontality, group = Gender)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Gender)
ggplot(data, aes(x = Connectivity, group = Gender)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Gender)
ggplot(data, aes(x = Sustainability, group = Gender)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Gender)
ggplot(data, aes(x = OfficialFormation, group = Gender)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + scale_y_continuous(labels=scales::percent) + ylab("relative frequencies") + facet_grid(~Gender)


