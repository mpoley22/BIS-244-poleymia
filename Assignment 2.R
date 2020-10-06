
getwd()
library("tidyverse")
us_states <- read_csv("covid-19-data/us-states.csv")
View(us_states)
pa_data<-filter(us_states,state=="Pennsylvania")
getwd()
pa_data <-mutate(pa_data,adj_deaths=deaths)
n=length(pa_data$deaths)
for (i in 1:n)
{if (pa_data$date[i]=="2020-04-21")
{pa_data$adj_deaths[i]<-pa_data$deaths[i]-282}
}

