# Summarize voi group khai thac dplyr
library(dslabs)
library(tidyr)
library(dplyr)
data("heigts")
data("murders")

# tinh trung binh va sd cho cac cot chieu cao cua nam/nu
heights %>%
  group_by(sex) %>%
  summarize(average = mean(height), standard_deviation = sd(height))

#tinh ti le trung binh toi pham tai 4 vung trong nuoc
murders <- murders %>%
  mutate(murder_rate=total/population*10^6) # tao them cot voi mutate
murders %>%
  group_by(region) %>%
  summarize(median_rate = median(murder_rate))