#import libs
library(tidyverse)
library(patchwork)

#retrieves data
characters <- read.csv("~/Desktop/teste/Characters.csv", header = T, sep = ";")

#set working directory
setwd("~/Desktop/teste")

#color palette defined
house_colors <- c("deeppink4", "honeydew4", "firebrick4", "goldenrod1","blue4" ,"springgreen4")

#plot
characters %>%
  filter(Gender %in% c("Female", "Male"), 
         House %in% c("Gryffindor", "Hufflepuff", "Slytherin", "Ravenclaw","Durmstrang Institute", "Beauxbatons Academy of Magic")) %>%
  ggplot(aes(House, fill = House))+
  scale_fill_manual(values = house_colors)+
  geom_bar()+
  labs(x = "Houses", y ="Total Number of Characters", title = "Characters per Magical House")+
  facet_wrap(~Gender)+
  theme_bw()+
  theme(panel.grid.minor = element_blank(),
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
#saving the plot
  ggsave("CharactersPerHouse.png")