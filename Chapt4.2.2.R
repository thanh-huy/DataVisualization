#Times Seires Plot - ve bieu do theo duong thoi gian
library(dslabs)
library(ggplot2)
data("gapminder")
gapminder %>%
    filter(country == "Vietnam") %>%
  ggplot(aes(year, fertility)) +
  geom_point()

# Su dung geom_line() thay geom_point() de the hien time series
gapminder %>%
  filter(country == "Vietnam") %>%
  ggplot(aes(year, fertility)) +
  geom_line()

#So sanh nhieu line
countries <- c("United States", "Vietnam")
gapminder %>%
  filter(country %in% countries) %>%
  ggplot(aes(year, fertility, group=country, color = country)) +
  geom_line()

#Them label vao duong ve thay cho legend
labels <- data.frame(country = countries, x=c(1975,1965), y=c(60,72))
gapminder%>%
  filter(country %in% countries) %>%
  ggplot(aes(year, life_expectancy,col = country)) +
  geom_line() +
  geom_text(data = labels, aes(x,y,label = country),size =5) +
  theme(legend.position = "none")