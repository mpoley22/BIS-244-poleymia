library(gapminder)
library(here)
library(tidyverse)
library(socviz)
LT_History <- read.csv("LT History.csv")

LT_History$win_ratio <- LT_History$Wins/LT_History$Games.Played
average_win_ratios <- LT_History %>%
  group_by(Nationality) %>%
  summarize(average_win= mean(win_ratio, na.rm=TRUE))

p <- ggplot(average_win_ratios, aes(x=Nationality, y=average_win, fill=Nationality))
p+geom_col()+(scale_y_continuous(labels=scales::percent)) +
  labs(x= "Nationality",
       y= "Average Win Percentage",
       title= "Best Nationality",
       subtitle = "Based on Average Win Per Nationality")


LT_History$win_ratio <- LT_History$Wins/LT_History$Games.Played
average_win_ratios_tier <- LT_History %>%
  group_by(Tier) %>%
  summarize(average_win= mean(win_ratio, na.rm=TRUE))

p <- ggplot(average_win_ratios_tier, aes(x=Tier, y=average_win, fill=Tier))
p+geom_col()+
  coord_flip()+
(scale_y_continuous(labels=scales::percent)) +
  labs(x= "Tiers",
       y= "Average Win Percentage",
       title= "Best Tier",
       subtitle = "Based on Average Win Per Tier")

LT_History$win_ratio <- LT_History$Wins/LT_History$Games.Played
average_win_ratios_tank <- LT_History %>%
  group_by(Tank) %>%
  summarize(average_win= mean(win_ratio, na.rm=TRUE))

p <- ggplot(data=average_win_ratios_tank,
            mapping = aes(x=Tank,
                          y=average_win,
                          fill=Tank,
                          color=Tank))
p+geom_point()+geom_text(mapping=aes(label=Tank), hjust=0)+
  coord_flip()+
  (scale_y_continuous(labels=scales::percent)) +
  labs(x="", 
       y="Average Win Ratio",
       title= "Best Tank",
       subtitle = "Based on Average Win Per Tank")
            
            

