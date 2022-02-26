library(maps)
library(dplyr)
library(ggplot2)

data3_chart3 <- summarise(group_by(data, county_name, year, total_jail_pop)) %>% 
  filter(year == "2018")

data3_chart3 <- group_by(data, state) %>% 
  summarise(total_J_pop = sum(total_jail_pop, na.rm = T)) 


state_shape <- map_data("state")
state_abbrevs <- data.frame(state.abb, state.name)
data3_chart3  <- left_join(data3_chart3 , state_abbrevs, by=c("state"= "state.abb"))
data3_chart3 <- data3_chart3 %>% mutate(region = tolower(state.name))
state_shape <- left_join(state_shape, data3_chart3)



ggplot(state_shape)+
  geom_polygon(mapping = aes(x = long, y = lat, group = group, fill = total_J_pop)) +
  scale_fill_continuous(low = 'pink', high ='red', labels = scales::label_number_si()) +
  labs(title = "The total jail population in 2018 by states")
