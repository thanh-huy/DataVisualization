library(tidyr)
library(dslabs)
library(ggplot2)
data("murders")
#-- %>% gui doi tuong ra file
murders %>% ggplot() + geom_point(aes(x=population/10^6,y=total)) # gui doi tuong murders dang table sang ggplot

#them layer points vao doi tuong ggplot
p <- ggplot(data=murders)
p  + geom_point(aes(population/10^6, total))

#them text layer vao bieu do scatter nay
p + geom_point(aes(population/10^6,total)) +
  geom_text(aes(population/10^6,total, label = abb), nudge_x = 1) #nudge_x = 1, dich text len 1 don vi theo x

# Su dung global aes giam thieu code
 p <- murders %>% ggplot(aes(population/10^6,total, label = abb))
 p + geom_point(size=3) + geom_text(nudge_x = 1.5) #them 2 layer point va Text
 
 #Ghi de ham ase local len golal
 p + geom_point(size = 3) +
   geom_text(aes(x = 10, y = 800, label = "Hello there!")) #tao ham aes rieng