

library(ggplot2)
library(dplyr)

data2_chart2 <- summarise(group_by(data, county_name, year, total_jail_pop, male_jail_pop))
data2_chart2 <- group_by(data, year, county_name) %>% 
  summarise(total_J_pop = sum(total_jail_pop, na.rm = T)) %>% 
  summarise(M_jail_pop = sum(male_jail_pop))

data2_chart2[is.na(data2_chart2)] = 0

ggplot(data2_chart2) +  
  geom_point(mapping = aes( x = total_jail_pop, y = male_jail_pop))


             