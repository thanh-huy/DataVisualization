library(dslabs)
library(tidyr)
library(dplyr)
data("gapminder")

#Ve Boxplot cua GDP theo vung
gapminder <- gapminder %>%
  mutate(dollar_per_day = gdp/population/365)

# Lay so luong cac khu vuc
length((levels(gapminder$region)))

#ve boxplot cua GDP nam 1970
past_year <- 1970
p <- gapminder %>%
  filter(year==past_year & !is.na(gdp)) %>%
  ggplot(aes(region,dollar_per_day))
p + geom_boxplot() +
  #xoay text 90 do
  theme(axis.text.x = element_text(angle=90, hjust = 1))

#Sap xep lai GDP theo cac vung truoc khi ve, scale do thi va to mau
p <- gapminder %>%
  filter(year==past_year & !is.na(gdp)) %>%
  mutate(region = reorder(region,dollar_per_day, FUN=median)) %>% # sap xep lai
  ggplot(aes(region,dollar_per_day, fill= continent)) + # to mau theo continent
  geom_boxplot() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  xlab("")
#log2 scale theo y
p+ scale_y_continuous(trans = "log2")
# them cac diem data point vao boxplot
p + scale_y_continuous(trans = "log2") + geom_point(show.legend = FALSE) # them cac diem data vao boxplot, rieng vung legend thi khong them data point
