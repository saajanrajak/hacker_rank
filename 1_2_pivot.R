

setwd("C:/Users/quest/Downloads/GIT/Hackthon/hack_1_temp")

data <- read.csv("pivot_yearly_monthly_report.csv")


# Load Libraries
library(tidyverse)
library(lubridate)


# Data Wrangling
data <- data %>% 
  mutate(date_2 = dmy(date), # Formating Date in Posixt Format
         Year = year(date_2), # Fetching Year from date
         Month = month(date_2, label = TRUE)) %>%  # fetching Month from date
  pivot_wider(id_cols = Year, names_from = Month, values_from = revenue )  # widening The Data

data_2 <- data %>% 
  pivot_wider(id_cols = Year, names_from = Month, values_from = revenue ) 
  
# finding mean Revenue Monthly Basis
data_3 <- data %>% 
  group_by(Month) %>% 
  summarise(Mean = mean(revenue, na.rm = T)) %>% 
  pivot_wider( names_from = Month, values_from = Mean) %>% 
  mutate(Year = "Mean")

# Joining The Data
data_4 <- data_2 %>%
  mutate(Year = as.character(Year)) %>% 
  bind_rows(data_3 )

-------


  
  
