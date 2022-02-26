

library(ggplot2)
library(dplyr)

data2_chart2 <- summarise(group_by(data, county_name, year, total_jail_pop, male_jail_pop))
data2_chart2 <- group_by(data, year, county_name) %>% 
  summarise(total_J_pop = sum(total_jail_pop, na.rm = T)) %>% 
  summarise(M_jail_pop = sum(male_jail_pop))


ggplot(data2_chart2) +  
  geom_point(mapping = aes( x = total_jail_pop, y = male_jail_pop))
labs(title = "The relationship between total jail population and male jail popolation",
     x = "Total Jail Population",
     y = "Male Jail Population")


             