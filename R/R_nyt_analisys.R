
library(dplyr)
library(ggplot2)


data1 <- read.csv("../data/dds_datasets/dds_ch2_nyt/nyt1.csv")

#categorize
data1$age_group <- cut(data1$Age, c(-Inf, 19, 24, 34, 44, 54, 64, +Inf),
                       labels = c("<18", "18–24", "25–34", "35-44", "45-54", "55-64", "65+"))

ggplot(data1, aes(x=Impressions, fill=age_group))+geom_histogram(binwidth=1)
ggplot(data1, aes(x=age_group, y=Impressions, fill=age_group))+geom_boxplot()


summary(data1)


data1 %>%
  group_by(age_group) %>%
  summarise(CTR = sum(Clicks)/sum(Impressions))




