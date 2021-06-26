library(tidyr)
library(dslabs)
data("heights")
index <- heights$sex=="Male"
x <- heights$height[index]

# tinh trung binh va phuong sai theo cong thuc
average <- sum(x)/length(x)
SD <- sqrt(sum((x-average)^2)/length(x))
c(average=average, SD = SD)
print(c)
#dung ham cua R
average <- mean(x)
SD <- sd(x)
c(average=average, SD = SD)
print(c)

# tinh don vi chuan
z <- scale(x)

#tinh ti le cua gia tri trong vong 2 SD so voi trung tinh
mean(abs(z)<2)