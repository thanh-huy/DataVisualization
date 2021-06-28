#Su dung summarize cua dplyr/tidyverse
library(tidyr)
library(dslabs)
data("heights")

s <- heights %>%
  filter(sex=="Male") %>%
  summarize(average = mean(height), standard_deviation = sd(height))

#truy cap cac thanh phan cua dataframe su dung $
s$average
s$standard_deviation

#tinh toam mean, min, max

heights %>%
  filter(sex=="Male") %>%
  summarize(median = median(heights), minimum = min(height), maximum = max(height))
# Cach khac tim gia tri min, mean, max bang cach tinh quantile tai 0, 0.5, 1
quantile(heights$height, c(0.25,0.5,0.75))

#Note: summarize chi nhan ham tra ve gia tri vo huong
heights %>%
  filter(sex == "Male") %>%
  summarize(range = quantile(heights$height, c(0.25, 0.5, 0.75)))
