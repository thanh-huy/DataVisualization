library(dslabs)
data(heights)
names(heights)
x <- heights$height
length(unique(x))
tab <- table(x)
sum(tab==1)
prop.table(table(heights$sex))

#---
index <- heights$sex == "Male"
x <- heights$height[index]
average <- mean(x)
SD <- sd(x)
c(average=average, SD = SD)