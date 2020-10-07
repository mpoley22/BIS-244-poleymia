library(tidyverse)
library(scales)
Twitch <- read.csv("Most Popular Twitch Streamers.csv")
str(Twitch)
Twitch$Date <- as.Date(Twitch$Date, "%m/%d/%Y")
str(Twitch)
p <- ggplot(data= Twitch,
            mapping = aes(x= Date,
                          y= Viewers,
                          color= Streamer))
p + geom_line(mapping =
                aes(group= Streamer))
p+geom_line()+ scale_y_continuous(breaks = c(0e+00, 1e+06, 2e+06, 3e+06), labels = c("0.0M", "1.0M", "2.0M", "3.0M"))+
labs(title= "Most Popular Twitch Streamers")

_________________________________________________________________________

p <- ggplot(data=Twitch,
            mapping = aes(x= Date,
                          y= Viewers,
                          color= Streamer))
p+geom_line(mapping=aes(group= Streamer))+ 
  facet_wrap(~Streamer)
p+geom_line()+facet_wrap(~Streamer)+scale_y_continuous(breaks = c(0e+00, 1e+06, 2e+06, 3e+06), labels = c("0.0M", "1.0M", "2.0M", "3.0M"))+
  labs(title= "Most Popular Twitch Streamers")
