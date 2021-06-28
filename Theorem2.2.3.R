#Code Histogram
library(tidyr)
library(dslabs)
data("heights")

#dinh nghia p
 p <- heights %>%
   filter(sex=="Male") %>%
   ggplot(aes(x=height))
 
 #tao histogram
 p + geom_histogram() #mac dinh binwidth la 30 anh huong den smooth cua histogram
 p + geom_histogram(binwidth = 1)
 
 #do mau blue, vien den, them tieu de va nhan
 p + geom_histogram(binwidth = 1, fill='blue', col="black") +
    xlab("Male heights in inches") +
   ylab("Person unit") +
   ggtitle("Histogram")
 
 #Smooth ham mat do density trong ggplot2
 p + geom_density()
 p + geom_density(fill="blue")
 
 # Ve q-q plot; quantile-quantile plots - duong co ban
 p <- heights %>% filter(sex=="Male") %>%
   ggplot(aes(sample=height))
 p + geom_qq()
 
 #Q-Q plot so giua norm distribution va mean/sd
  params <- heights %>%
    filter(sex=="Male") %>%
    summarize(mean=mean(height), sd=sd(height))
  p + geom_qq(dparams =  params) +
  geom_abline()
  #Q-Q plot cua scaled data so voi norm distri
  heights %>%
    ggplot(aes(sample=scale(height))) +
    geom_qq() +
    geom_abline()
  
# Tao luoit voi goi gridExtra
  p <- heights %>% filter(sex == "Male") %>% ggplot(aes(x = height))
  p1 <- p + geom_histogram(binwidth = 1, fill = "blue", col = "black")
  p2 <- p + geom_histogram(binwidth = 2, fill = "blue", col = "black")
  p3 <- p + geom_histogram(binwidth = 3, fill = "blue", col = "black")
  
  # arrange plots next to each other in 1 row, 3 columns
  library(gridExtra)
  grid.arrange(p1, p2, p3, ncol = 3)
  