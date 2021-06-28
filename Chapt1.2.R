#install package tidyr
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

# tinh don vi chuan, quy data ve dang phan phoi chuan
z <- scale(x)

#tinh ti le cua gia tri trong vong 2 SD so voi trung tinh
mean(abs(z)<2)
#-----
#-- E1.Tinh toan phan phoi chuan
x <- heights$height[heights$sex=="Male"] #Loc chieu cao cua Nam
mean(x<=72) - mean(x<=69) # tinh ti le nhung nguoi cao tu 69 den 72 inches
mean(x>69 & x<=72)
#E2--- tinh ti le cao tu 69-72 theo pnorm - phan phoi chuan de tinh xap xi tot hon dung trung binh cdf
x <- heights$height[heights$sex=="Male"]
avg <- mean(x)
stdev <- sd(x)
pnorm(72,avg, stdev, TRUE) - pnorm(69, avg, stdev, TRUE)
#E3. Tinh xap xi, so sanh voi chinh xac va xap xi hon nhau bao nhieu lan chenh lech
library(dslabs)
data(heights)
x <- heights$height[heights$sex == "Male"]
exact <- mean(x > 79 & x <= 81)
stdev <- sd(x)
approx <- pnorm(exact,stdev)
exact/ approx
#E4. Dung pnorm tinh xap xi chieu cao cua cac cau thu tren 7 feet (7*12 inches)
# Gia thiet mean = 69, sd = 3
pnorm(7*12,69, 3, FALSE)

#E5. Uoc luong ti le trong 1 ti nguoi trong do tuoi 18-40 co bao nhieu nguoi co chieu cao tren 7 feet
p <- pnorm(7*12, 69,3,FALSE)
round(p*10^9)
#E6. Co 10 cau thu NBA cao tren 7 feet, ti le bao nhieu cau thu NBA tren 7 feet so voi the gioi
p <- pnorm(7*12, 69,3,FALSE)
N <- round(p*10^9)
10/N
#E7. Tuong tu tim ti le cac cau thu cao bang Lebron Jame 6.8 feet voi khoang 150 cau thu co chieu cao tuong tu
## Change the solution to previous answer
p <- 1- pnorm(6*12+8, 69, 3)
N <- round(p*10^9)
150/N
