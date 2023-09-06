library(tidyverse)
library(plotly)

# Nipah virus cases 
cases <- read.csv(here::here("data/NIPAH_Virus_Cases.csv"))

# Death cases due to Nipah
deaths <- read.csv(here::here("data/NIPAH_Virus_Deaths.csv"))

# Join data 
nipah_data <- left_join(cases, deaths, by = "Year")
nipah_data$Year <- as.factor(nipah_data$Year)

# CFR data 
cfr_data <- read.csv(here::here("data/NIPAH_Virus_CFR.csv"))

glimpse(nipah_data)


# Visualization 1: Nipah virus cases over the years
plot_ly(data = nipah_data, x = ~Year)  |> 
  add_trace(y = ~Cases, type = 'scatter', mode = 'lines+markers', name = "Cases") |> 
  add_trace(y = ~Death, type = 'scatter', mode = 'lines+markers', name = "Deaths") |> 
  layout(title = 'Nipah Virus Cases and Deaths Over the Years', 
         xaxis = list(title = 'Year'),
         yaxis = list(title = 'Number of Cases and Deaths'))


# Visualization 2: Number of Nipah Cases in Bangladesh 
plot_ly(data = nipah_data, x = ~Year)  |> 
  add_bars(y = ~Cases, name = 'Cases', text = ~Cases, 
           textposition = 'auto', marker = list(color = "#665191")) |> 
  layout(title = 'Number of Nipah Virus Cases', 
         xaxis = list(title = 'Year'),
         yaxis = list(title = 'Number of Cases'))

# Visualization 3: Number of Death Cases in Bangladesh 
plot_ly(data = nipah_data, x = ~Year)  |> 
  add_bars(y = ~Death, name = 'Deaths', text = ~Cases, 
           textposition = 'auto', marker = list(color = "#d45087")) |> 
  layout(title = 'Number of Death Cases', 
         xaxis = list(title = 'Year'),
         yaxis = list(title = 'Number of Deaths'))

# Visualization 4: Number of Nipah Cases, Death and CFR in Bangladesh 
plot_ly(data = cfr_data, x = ~Year)  |> 
  add_bars(y = ~Cases, name = 'Cases') |> 
  add_bars(y = ~Death, name = 'Death') |> 
  add_trace(y = ~YCFR, type = 'scatter', mode = 'lines+markers', name = "YCFR") |> 
  layout(title = 'Nipah Vrius Cases, Deaths, and Year-wise Case Fatality Rate(YCFR)', 
         xaxis = list(title = 'Year'),
         yaxis = list(title = 'Number of Cases'))


