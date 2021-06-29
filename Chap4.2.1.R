#Su dung facet de so sanh bieu do
library(dslabs)
library(ggplot2)
data("gapminder")

#so sanh cac luc dia theo nam
gapminder %>%
  filter(year %in% c(1962,2012)) %>%
  ggplot(aes(fertility,life_expectancy,color = continent)) +
  geom_point() +
  facet_grid(continent~year) # tu du lieu dinh nghia cac cot so sanh

#fix code

#so sanh theo nam
gapminder %>%
  filter(year %in% c(1962,2012)) %>%
  ggplot(aes(fertility,life_expectancy,color = continent)) +
  geom_point() +
  facet_grid(.~year)

# so sanh theo nhieu nam, su dung wrapped theo nhieu dong

year <- c(1962,1980, 1990, 2000, 2012)
continent <- c("Europe", "Asia")
gapminder %>%
  filter (year %in% year & continent %in% continent) %>%
  ggplot(aes(fertility,life_expectancy,col = continent)) +
  geom_point() +
  facet_wrap(.~year) # chuyen 1D sang khung 2D. - Su dung khi co nhieu bieu do
