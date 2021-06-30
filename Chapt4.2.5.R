#Boxplot va histogram so sanh theo vung qua tung nam

# Use intersect() to find the overlap between two vectors.
# To make boxplots where grouped variables are adjacaent, color the boxplot by a factor instead of faceting by that factor. This is a way to ease comparisons.
# The data suggest that the income gap between rich and poor countries has narrowed, not expanded.
library(dslabs)
library(tidyr)
library(dplyr)
library(ggplot2)
data("gapminder")

gapminder <- gapminder %>%
  mutate(dollar_per_day = gdp/population/365)
past_year <- 1970

#tao danh sach cac nuoc Chau Au
west <- c("Western Europe", "Northern Europe", "Southern Europe", "Northern America", "Australia and New Zealand")

# So sanh dung facet West voi Developing
gapminder %>%
  filter(year==past_year & !is.na(gdp)) %>%
  mutate(group = ifelse(region %in% west, "West", "Developing")) %>%
  ggplot(aes(dollar_per_day)) +
  geom_histogram(binwidth = 1, color = "black", fill = "grey") +
  scale_x_continuous(trans = "log2") +
  facet_grid(.~group)

#So sanh West va Developing trong 2 nam 1970 va 2010 (4 bieu do)
present_year <- 2010
gapminder %>%
  filter(year %in% c(past_year, present_year) & !is.na(gdp)) %>%
  mutate(group= ifelse(region %in% west, "West", "Developing")) %>%
  ggplot(aes(dollar_per_day)) +
  geom_histogram(binwidth = 1, col = "black", fill = "grey") +
  scale_x_continuous(trans = "log2") +
  facet_grid(year~group)

#Tao histogram so sanh 
country_list_1 <- gapminder %>% 
  filter(year == past_year & !is.na(dollar_per_day)) %>% .$country
country_list_2 <- gapminder %>%
  filter(year == present_year & !is.na(dollar_per_day)) %>% .$country
#loc ra cac nuoc co du lieu gdp trong ca 2 nam 1970 va 2010
country_list <- intersect(country_list_1, country_list_2) #ham intersect: loc phan giao cua 2 vector

#tao histogram bao gom cac nuoc co du lieu trong ca 2 nam
gapminder %>%
  filter(year %in% c(past_year,present_year) & country %in% country_list) %>%
  mutate(group = ifelse(region %in% west, "West", "Developing")) %>%
  ggplot(aes(dollar_per_day)) +
  geom_histogram(binwidth = 1, col="black", fill="grey") +
  scale_x_continuous(trans = "log2") +
  facet_grid(year~group)

#ve boxplot so sanh West va Developing trong nam 1970 va 2020
p <- gapminder %>%
  filter(year %in% c(past_year,present_year) & country %in% country_list) %>%
  mutate(region = reorder(region,dollar_per_day,FUN=median)) %>%
  ggplot() +
  theme(axis.text.x = element_text(angle = 90, hjus = 1)) +
  xlab("") + scale_y_continuous(trans="log2")

p + geom_boxplot(aes(region, dollar_per_day, fill = continent)) +
  facet_grid(year~.)

#sap xep khop cac boxplot, to mau theo nam
p + geom_boxplot(aes(region, dollar_per_day, fill=factor(year)))


#Ve ham mat do density
gapminder %>%
  filter(year==past_year & country %in% country_list) %>%
  mutate(group=ifelse(region %in% west, "West", "Developing")) %>% group_by(group) %>%
  summarize(n = n()) %>% knitr::kable()

# ve ham mat do density - vien counts tren truc y
p <- gapminder %>%
  filter(year==past_year & country %in% country_list) %>%
  mutate(group=ifelse(region %in% west, "West", "Developing")) %>%
  ggplot(aes(dollar_per_day, y= ..count.., fill=group)) +
  scale_x_continuous(trans = "log2")
p + geom_density(alpha=0.2, bw = 0.75) +
  facet_grid(year~.)

# them moi nhom region su dung case_when
gapminder <- gapminder %>%
  mutate(group = case_when(
    .$region %in% west ~ "West",
    .$region %in% c("Eastern Asia", "South-Eastern Asia") ~ "East Asia",
    .$region  %in% c("Caribbean", "Central America", "South America") ~ "Latin America",
    .$continent == "Africa" & .$region != "Northern Africa" ~ "Sub-Saharan Africa",
    TRUE ~ "Others"))
# sap xep lai theo factor group
gapminder <- gapminder %>%
  mutate(group = factor(group, levels = c("Others", "Latin America", "East Asia", "Sub-Saharan Africa", "West")))

#Hien thi cac ham mat do theo stack
p <- gapminder%>%
  filter(year %in% c(past_year, present_year) & country %in% country_list) %>%
  ggplot(aes(dollar_per_day, fill = group)) +
  scale_x_continuous(trans="log2")
#chong stack cac ham mat do
p+ geom_density(alpha=0.2, bw=0.75, position = "stack") +
  facet_grid(year~.)

#Danh trong so cac stack density
gapminder %>%
  filter(year %in% c(past_year, present_year) & country %in% country_list) %>%
  group_by(year) %>%
  mutate(weight = population/(sum(population*2))) %>%
  ungroup() %>%
  ggplot(aes(dollar_per_day, fill = group, weight = weight)) +
  scale_x_continuous(trans = "log2") +
  geom_density(alpha = .2, bw = .75, position = "stack") +
  facet_grid(year~.)
