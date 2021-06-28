library(dslabs)
data(heights)
#E1. get lenght of vetor male and female
male <- heights$height[heights$sex=="Male"]
female <- heights$height[heights$sex=="Female"]
length(male)
length(female)

#E2. Create data frame compare quantile male and female
p <- seq(0.1, 0.9, 0.2)

male_percentiles <- quantile(male,p)
female_percentiles <- quantile(female,p)

df <- data.frame(female = female_percentiles, male = male_percentiles)

#E3. Draw Boxplots-1 answer the questionaire