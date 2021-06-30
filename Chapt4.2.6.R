#logistic transform
library(tidyr)
library(dslabs)
data("gapminder")

#Them cac nhom voi case_when
gapminder <- gapminder %>%
  mutate(group = case_when(
    .$region %in% west ~ "The West",
    .$region %in% "Northern Africa" ~ "Northern Africa",
    .$region %in% c("Eastern Asia", "South-Eastern Asia") ~ "East Asia",
    .$region == "Southern Asia" ~ "Southern Asia",
    .$region %in% c("Central America", "South America", "Caribbean") ~ "Latin America",
    .$continent == "Africa" & .$region != "Northern Africa" ~ "Sub-Saharan Africa",
    .$region %in% c("Melanesia", "Micronesia", "Polynesia") ~ "Pacific Islands"))

#tao datarame voi nhom TB income va TB infant survial
suv_income <- gapminder%>%
  filter(year %in% present_year & !is.na(gdp) & ! is.na(infant_mortality) & !is.na(group)) %>%
  group_by(group) %>%
  summarize(income = sum(gdp)/sum(population)/365,
            infant_surviral_rate = 1- sum(infant_mortality/1000*population)/sum(population))

suv_income %>% arrange(income)

#Ve infant survial vs income, transformed axes

suv_income %>% ggplot(aes(income, infant_surviral_rate, label = group, color = group)) +
  scale_x_continuous(trans = "log2", limit = c(0.25,150)) +
  scale_y_continuous(trans = "log2", limit = c(0.875, .9981),
                     breaks = c(.85, .90, .95, .99, .995, .998)) +
  geom_label(size = 3, show.legend = TRUE)
