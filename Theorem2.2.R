#Customize ggplot
# Convert the x-axis to log scale with scale_x_continuous(trans = "log10") or scale_x_log10(). Similar functions exist for the y-axis.
# Add axis titles with xlab() and ylab() functions. Add a plot title with the ggtitle() function.
# Add a color mapping that colors points by a variable by defining the col argument within aes(). To color all points the same way, define col outside of aes().
# Add a line with the geom_abline() geometry. geom_abline() takes arguments slope (default = 1) and intercept (default = 0). Change the color with col or color and line type with lty.
# Placing the line layer after the point layer will overlay the line on top of the points. To overlay points on the line, place the line layer before the point layer.
# There are many additional ways to tweak your graph that can be found in the ggplot2 documentation, cheat sheet, or on the internet. For example, you can change the legend title with scale_color_discrete().
library(tidyr)
library(dslabs)
library(ggplot2)

data("murders")
p < murders %>% ggplot(aes(population/10^6,total,label=abb))

#scale theo log_10
p + geom_point(size=3) +
    geom_text(nudge_x = 0.075) +
    scale_x_continuous(trans="log10") +
    scale_y_continuous(trans = "log10") # co the thay ban scale_x_log10() va scale_y_log10()

# Add label va title
p + geom_point(size=3) +
    geom_text(nudge_x = 0.075) +
    scale_x_log10() +
    scale_y_log10() +
    xlab("Population in millions (log scale)") +
    ylab("Total number of murders (log scale)") +
    ggtitle("US Gun Murders in 2020")
#Change color of the points
 p <- murders %>% 
   ggplot(aes(population/10^6,total,label=abb)) +
   geom_text(nudge_x = 0.075) +
   scale_x_log10() +
   scale_y_log10() +
   xlab("Population in millions (log scale)") +
   ylab("Total number of murders (log scale)") +
   ggtitle("US Gun Murders in 2020")
 # chuyen mau  point sang blue
p + geom_point(size=3, color="blue")

# Chuyen mau point theo vung
p + geom_point(aes(col=region),size=3)


# Them duong thang ti le pham toi trung binh

#dinh nghia ti le trung binh
# define average murder rate
r <- murders %>%
  summarize(rate=sum(total)/sum(population)*10^6) %>% pull(rate) # tinh tich luy ti le total/population vao r
# basic line with average murder rate for the country
p <- p + geom_point(aes(col = region), size = 3) +
  geom_abline(intercept = log10(r))    # slope is default of 1

# change line to dashed and dark grey, line under points
#abline phai goi truoc point
p + 
  geom_abline(intercept = log10(r), lty = 2, color = "darkgrey") +
  geom_point(aes(col = region), size = 3)

p <- p + scale_color_discrete(name = "Region")    # capitalize legend title

