#import libs
library(tidyverse)
library(patchwork)
library(hrbrthemes)


#retrieves data and renames column#1 to "character"
movie1 <- read.csv("~/Desktop/teste/Harry Potter 1.csv", header = T, sep = ";")
movie1 %>%
  rename(char = X...Character) -> movie1

#removes all spaces from character column to avoid duplicates
movie1$char <- gsub('\\s+', '', movie1$char)

#retrieves top 15 characters with more lines
o <- table(movie1$char)
df <- data.frame(o[order(o)])
df %>%
  rename(char = Var1) -> df

topmovie1 <- top_n(df, n=10)

#set working directory
setwd("~/Desktop/teste")

#plots
topmovie1 %>%
  ggplot(aes(char, Freq, fill = char))+
  geom_col()+
  scale_fill_brewer(palette = "Paired")+
  labs(title = "Philosopher's Stone - Lines per Character", y = "Total Lines", x = "")+
  theme_ft_rc()+
  theme(axis.text.x = element_text(vjust = 0 , hjust = 1, angle = 90, size = 8),
        legend.position = "none",
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        axis.text.x.bottom = element_text(color = "white"))

ggsave("Philosopher stone - #LinesPerCharacter.png")
