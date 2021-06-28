library(tidyr)
library(ggrepel) #overlap text_label; thay doi text_label
library(ggthemes) # cai dat theme
library(dslabs)
data("murders")

#dinh nghia ti le toi pham trung binh
r <- murders %>% summarize(rate=sum(total)/sum(population)*10^6) %>% .$rate #.$rate tuong duong pull(rate)

#Tao plot, ket hop

murders %>%
  ggplot(aes(population/10^6,total, label=abb)) +
  geom_abline(intercept = log10(r), lty=2, color = "darkgrey") +
  geom_point(aes(col=region), size = 3) +
  geom_text_repel() + # add text truc tiep vao plot, co mui ten
  scale_x_log10() +
  scale_y_log10() +
  xlab("Population in millions (log scale)") +
  ylab("Total number of murders (log scale)") +
  ggtitle("US Gun Murders in 2020") +
  scale_color_discrete(name = "Region") +
  theme_economist()