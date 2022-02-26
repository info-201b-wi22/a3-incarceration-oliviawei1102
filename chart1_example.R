data1_chart1 <- summarize(group_by(data, state, year, total_pop)) %>% 
  filter(state == "AK" |state == "AL" |state == "AR" |state == "AZ" |state == "CA")

data1_chart1 <- group_by(data1_chart1, year, state) %>% 
  summarize(total_pop = sum(total_pop, na.rm = T))

data1_chart1[is.na(data1_chart1)] = 0

ggplot(data1_chart1) +  
  geom_line(mapping = aes( x = year, y = total_pop, color = state))+
  labs(title = "The total population of 5 states change over time",
       x = "year",
       y = "State total population")