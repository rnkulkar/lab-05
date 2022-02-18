library(tidyverse)
library(stringr)
library(knitr)
library(skimr)
library(broom)

airbnb <- read_csv("raw_data/listings.csv")

glimpse(airbnb)

cleaning_fee <- airbnb$price * 0.02

airbnb$cleaning_fee <- cleaning_fee

hist(cleaning_fee)
summary(cleaning_fee)

unique(airbnb$neighbourhood)

table(airbnb$neighbourhood)

neigh_simp <- fct_recode(airbnb$neighbourhood, "Other" = "City of Scotts Valley", 
                     "Other" = "City of Watsonville")

airbnb$neighbourhood <- neigh_simp

table(airbnb$minimum_nights)


airbnb <- filter(airbnb, minimum_nights <= 3)

length(cleaning_fee)
length(airbnb$price)

price_3_nights <- airbnb$price + airbnb$cleaning_fee
airbnb$price_3_nights <- price_3_nights

model <- lm(price_3_nights ~ neighbourhood + number_of_reviews + reviews_per_month, 
            data=airbnb, na.action=NULL)
summary(model)

predict(model, data.frame(neighbourhood=c("City of Santa Cruz"), number_of_reviews=c(10),
                          reviews_per_month=c(5.14)), interval="prediction"
            )

glimpse(airbnb)

res <- resid(model)

hist(res)




