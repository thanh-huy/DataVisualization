#Vaccine case presentation
#import data and inspect
library(tidyr)
library(dslabs)
library(ggplot2)
library(dplyr)
library(RColorBrewer)
data("us_contagious_diseases")
str(us_contagious_diseases)

#gan cho dat 10,000 ti le mac benh soi, loai bo hai bang Alaska va Hawaii
the_disease <- "Measles"
dat <- us_contagious_diseases %>%
  filter(!state %in% c("Hawaii", "Alaska") & disease == the_disease) %>%
  mutate(rate = count/population*1000*52/weeks_reporting) %>%
  mutate(state = reorder(state,rate))

#ve bieu do benh hang nam o Caifornia
dat %>% filter(state=="California" & !is.na(rate)) %>%
  ggplot(aes(year,rate)) +
  geom_line() +
  ylab("Case per 10,000") +
  geom_vline(xintercept = 1970, col = "blue") # duong ke dung ve nam can doi chieu

#Bieu do bieu dien ti le benh theo bang qua tung nam
dat %>% ggplot(aes(year,state,fill=rate)) +
  geom_tile(color = "blue") +
  scale_x_continuous(expand=c(0,0)) +
  scale_fill_gradientn(colors = RColorBrewer::brewer.pal(9,"Reds"), trans = "sqrt") +
  geom_vline(xintercept = 1963, col = "blue") +
  theme_minimal() + theme(panel.grid = element_blank()) +
  ggtitle(the_disease) +
  ylab("") +
  xlab("")

# Ve duong thang cua ti le benh soi theo nam va bang

avg <- us_contagious_diseases  %>%
  filter(disease == the_disease) %>% group_by(year) %>%
  summarize(us_rate = sum(count, na.rm = TRUE)/sum(population, na.rm = TRUE) *10000)

# Ve bieu do line cua benh soi theo nam roi theo bang

dat %>%
  filter(!is.na(rate)) %>%
  ggplot() +
  geom_line(aes(year,rate, group = state), color = "grey50", show.legend = FALSE, alpha = 0.2, size = 1) +
  geom_line(mapping = aes(year, us_rate),data = avg, size = 1, col = "black") +
  scale_y_continuous(trans = "sqrt", breaks = c(5,25,125,300)) + 
  ggtitle("Case per 10,000 by state") +
  xlab("") +
  ylab("") +
  geom_text(data = data.frame(x=1955, y=50),
            mapping = aes(x,y, label="US average"), color = "black") +
  geom_vline(xintercept = 1963, color = "blue")

