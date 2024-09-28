library(nycflights13)
library(tidyverse)

head(flights)

## 1. Which flights on october

flights %>% 
  select(1:5) %>%
  filter(month == 10)

## 2. Which months most flights in 2013

flights %>%
  select(1:5) %>%
  group_by(month) %>%
  count(month) %>%
  arrange(desc(n))


## 3. Order flights went to NYC (Desc)
flights %>%
  count(carrier) %>%
  arrange(-n) %>%
  head(5) %>%
  left_join(airlines)


## 4. What hours flights delays most in top 5
flights %>%
  count(dep_delay) %>%
  arrange(n) %>%
  head(5)


## 5. Which flights have longest distance
flights %>%
  inner_join(airlines, by = "carrier") %>%
  select(carrier, distance) %>%
  group_by(carrier) %>%
  summarise(total_distance = sum(distance),
            count_planes = n()) %>%
  arrange(desc(total_distance))
