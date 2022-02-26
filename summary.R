


library(dplyr)
data <- read.csv("https://raw.githubusercontent.com/vera-institute/incarceration-trends/master/incarceration_trends.csv")


# What is the average value of total population across all the counties in 2003?
# What is the average value of total population across all the counties in 2007?
# When is female population the highest in Pacific division?
# Which county has the highest male population in 2018?
# How much has total jail poluation change over the last 30 years (1988-2018)?
  
avg_tpop_2003 <- data %>% 
  filter(year == "2003") %>% 
  summarise(mean(total_pop))
avg_tpop_2003 

avg_tpop_2007 <- data %>% 
  filter(year == "2007") %>% 
  summarise(mean(total_pop))
avg_tpop_2007

high_fpop_Pcific <- data %>% 
  filter(division == "Pacific") %>% 
  filter(female_pop_15to64 == max(female_pop_15to64)) %>% 
  pull(year)
high_fpop_Pcific

high_mpop_2018 <- data %>% 
  filter(year == "2018") %>% 
  filter(male_pop_15to64 == max(male_pop_15to64)) %>% 
  pull(county_name)
high_mpop_2018

total_jail_pop_2018 <- data %>% 
  filter(year == "2018") %>% 
  summarise(total_jail_pop = sum(total_jail_pop, na.rm = T))
total_jail_pop_1988 <- data %>% 
  filter(year == "1988") %>% 
  summarise(total_jail_pop = sum(total_jail_pop, na.rm = T))
diff_total_jail_pop <- total_jail_pop_2018 - total_jail_pop_1988
diff_total_jail_pop

# To summarize the data, I proposed 5 questions. The average value of total population across all the counties in 2003 is `avg_tpop_2003`. The average value of total population across all the counties in 2007 is `avg_tpop_2007`.  `high_fpop_Pcific` is the time that female population is the the highest in Pacific division. `high_mpop_2018` is the county that has the highest male population. The total jail population has changed `diff_total_jail_pop` over last 30 years, from 1988 to 2018.

 



