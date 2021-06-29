library(dslabs)
library(ggplot2)
data("gapminder")
head(gapminder) # head() va tail() dua con tro ve dau va cuoi danh sach
gapminder
#Dat loc filter va select 2 column nhu SQL
gapminder %>%
  filter(year==2015 & country %in% c("Sri Lanka", "Turkey")) %>%
  select(country, infant_mortality)


#Ve scatter plot ve fertility va life_expectancy (ti le sinh va tuoi tho)
ds_theme_set() # su dung theme
gapminder %>%
  filter(year==1962) %>%
  ggplot(aes(fertility, life_expectancy, color = continent)) +
 theme_bw() +
  geom_point()
