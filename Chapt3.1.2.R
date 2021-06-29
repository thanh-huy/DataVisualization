# #Su dung Summarize tra ve 1 gia tri vo huong, dung toan tu %>% va .$ lam placeholder
# The dot operator allows you to access values stored in data that is being piped in using the %>% character. The dot is a placeholder for the data being passed in through the pipe.
# The dot operator allows dplyr functions to return single vectors or numbers instead of only data frames.
# us_murder_rate %>% .$rate is equivalent to us_murder_rate$rate.
# Note that an equivalent way to extract a single column using the pipe is us_murder_rate %>% pull(rate). The pull() function will be used in later course material.
library(dslabs)
library(tidyr)
data("murders")
 murders <- murders %>% mutate(murder_rate = total/population*10^6)
 summarize(murders, mean(murder_rate)) # Cong thuc sai vi tinh TB cong ti le trung binh cua tung bang
 
 #tinh ti le toi pham tra ve dataframe
 us_murder_rate <- murders %>%
    summarize(rate=sum(total)/sum(population)*10^6)
 us_murder_rate
 
 #truy cap vao ti le US murder bang ky tu dot
 us_murder_rate %>% .$rate
 
 #tinh va lay ti le toi pham bang ky tu place holder
 us_murder_rate <- murders %>%
   summarize(rate=sum(total)/sum(population)*10^6) %>% .$rate
 us_murder_rate
 