library(tidyverse)
library(stringr)
library(knitr)
library(skimr)
library(broom)

airbnb <- read_csv("raw_data/listings.csv")

glimpse(airbnb)

cleaning_fee <- airbnb$price * 0.02

hist(cleaning_fee)
summary(cleaning_fee)

unique(airbnb$neighbourhood)

table(airbnb$neighbourhood)

neigh_simp <- fct_recode(airbnb$neighbourhood, "Other" = "City of Scotts Valley", 
                     "Other" = "City of Watsonville")

airbnb$neighbourhood <- neigh_simp

table(airbnb$minimum_nights)


airbnb <- filter(airbnb, minimum_nights <= 3)
