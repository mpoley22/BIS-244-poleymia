library(tidyverse)
library(gapminder)
library(scales)
library(dplyr)
covid_data<-read.csv("data.csv")


G7data <- c("Canada", "France", "United_Kingdom", "United_States_of_America", "Italy", "Germany", "Japan")

G7_counties <- covid_data[covid_data$countriesAndTerritories %in% G7data,]
G7_counties$Date <- as.Date(G7_counties$Date, "%m/%d/y%")

p <- ggplot(data=G7_counties,
            mapping= aes(x=month, 
                        y=cases,
                        color= countriesAndTerritories))
p + geom_line(aes(group= countriesAndTerritories))

p+ geom_line() + scale_x_continuous(breaks=c(2.5, 5.0, 7.5, 10.0, 12.5), labels=c("feb", "may", "jul", "oct", "dec")) +
  labs(x=NULL, y= "New Cases Per Day", title= "G7 COVID-19 Case Counts", subtitle= "by Mia Poley as of 2020-10-16", caption= "Data:ECDC TIMES")

        
        
        
        
        
        