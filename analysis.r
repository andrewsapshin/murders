library(tidyverse)
load("rda/murders.rda")

library(dslabs)
data(murders)
murders

murders <- murders %>% mutate(region = factor(region), rate = total/population*10^5)


murders %>% mutate(abb = reorder(abb, rate)) %>%
  ggplot(aes(abb, rate)) +
  geom_bar(width = 0.5, stat = "identity", color = "black") +
  coord_flip()

ggsave("figs/barplot.png")
