
library(tidyverse)
library(purrr)
dice <- function() {
  sample(1:6, 1)
}


roll_dice <- function(rolls=1){
map_int(1:rolls, ~ dice()+dice())
}


x <- tibble(rolls = roll_dice(10000)) 
x %>% mutate(include_sev_or_elev = ifelse(rolls %in% c(7, 11), TRUE, FALSE)) %>%
  summarise(prop=sum(include_sev_or_elev)/n())
  
tibble_2 <- tibble(replication = 1:100,
       throws= map(1:100, ~roll_dice(3))) 

tibble_2 %>% 
  mutate(one_winners = ifelse(7 %in% unlist(throws), TRUE, FALSE)

