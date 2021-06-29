library(dslabs)
data("heights")
heights$height
summary(heights$height) # ham tong ket cho gia tri min, max va cac luong tu (quartiles) trong mot vector
#Tim phan tram percentiles theo cac luong tu
p <- seq(0.01, 0.99, 0.01) 
# tao chuoi lap tu 0.01 den 0.99
percentiles <- quantile(heights$height, p)
#truy cap den gia tri cua 25% va 75%
percentiles[names(percentiles)=="25%"] 
percentiles[names(percentiles)=="75%"]
#test qnorm(); qnorm la ham nghich dao cua pnorm()
theoretical_quantiles <- qnorm(p, 69, 3)

#Code 1.3
library(tidyr)
library(dslabs)
data("heights")
index <- heights$sex="Male" #lay index cua gioi tinh Nam
x <- heights$height[index] #loc chieu cao gioi tinh Nam
z <- scale(x) # lam smooth, z - don vi chuan standard units

#ti le du lieu duoi 69.5
mean(x<=69.5)

#tinh toan luong tu quan sat duoc va luong tu ly thuyet
p <- seq(0.05, 0.95, 0.05) # tao percentile voi buoc nhay 0,05
observed_quantiles <- quantile(x,p)
theoretical_quantiles <- qnorm(p, mean=mean(x), sd = sd(x))

#ve voi QQ-plot
plot(theoretical_quantiles,observed_quantiles)
abline(0,1)

#Tao QQ-plot voi gia tri lam smooth z, khong can mean va sd
observed_quantiles <- quantile(z,p)
theoretical_quantiles <- qnorm(p)
plot(theoretical_quantiles, observed_quantiles)
abline(0,1)
#-----------
#Code 1.4 ggplot
library(tidyr)
library(dslabs)
data(murders)
ggplot(data=murders)
murder %>% ggplot()
p <- ggplot(data=murders) #creat ggplot object
class(p)
print(p)
p

