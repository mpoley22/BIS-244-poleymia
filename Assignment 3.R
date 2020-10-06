library(tidyverse)
Temp <- getwd()
setwd("./covid-19-data/")
COUNTIES <- read_csv("us-counties.csv")
setwd(Temp)
LEHIGH <- filter(COUNTIES, state=="Pennsylvania" &
                      county=="Lehigh")
View(LEHIGH)

n <- length(LEHIGH$date)

LEHIGH$incr_cases <- 1

View(LEHIGH)

for (i in 2:n) {
  LEHIGH$incr_cases[i] <- (LEHIGH$cases[i]-LEHIGH$cases[i-1]) 
}

View(LEHIGH)

p <- ggplot(data = LEHIGH,
            mapping = aes(x = date,
                          y = deaths))

p + geom_point() +
  labs(x = "Date", y = "Deaths",
       title = "COVID-19 Cases and Deaths in Lehigh County, PA",
       subtitle = "Data points are deaths and confirmed cases",
       caption = "Source: NY Times")

