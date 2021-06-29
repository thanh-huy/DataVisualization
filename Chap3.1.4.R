#Su dung arrange() de sap xep du lieu
library(tidyr)
library(dplyr)
library(dslabs)
data("murders")

#tao murder object
murders <- murders %>%
  mutate(murder_rate = total/population*10^6)

#sap xep theo population
murders %>% arrange(population) %>% head() #head(): lay 6 ban ghi dau tien, khong goi head() lay all

#sap xep theo murder_rate
murders %>% arrange(desc(murder_rate)) %>% head()

#sap xep theo region roi den murder_rate
murders %>% arrange(region, murder_rate) %>% head()

#lay top 10 murder_rate
murders %>% top_n(10, murder_rate)

#dung slice_max lay top 10 theo murder_rate
murders %>% slice_max(murder_rate, n=10)