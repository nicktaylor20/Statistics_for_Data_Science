#Exercise 8.2 part 2
#Dominick Taylor
#5/8/2021



#get working dir
getwd()

#Create a data frame for housing data
housing_df <- read.csv("data/week-6-housing.csv")
head(housing_df)

#load ggplot lib
library(ggplot2)

#ii: Creat two varibles 
#I selected these varibales because these are the typical attributes that lead to the change of home listing prices 
#The year the home is built, the amount of bedrooms and Bathrooms, and the building grade

saleprice_lm <- lm(sale_price ~ square_feet_total_living, data = housing_df )

yearbuilt_lm <- lm(sale_price ~ year_built, data = housing_df)

sppredict_lm <-lm(sale_price ~ square_feet_total_living + year_built + bedrooms + bath_full_count + building_grade, data = housing_df)

#iii: summary function
#the R2 for the model using the multiple predictors is slightly larger than that of the model just using square foot size
#this means the larger percentage of variation in the data is caused by the addition of mulitple predictors. 
#it was only by 2 percentage points, so the living space is still a pretty significant relationship with sale price
summary(saleprice_lm)
summary(sppredict_lm)
summary(yearbuilt_lm)


#iv the standardized betas or coefficients signifies the strenght of the relationship to the dependant variable. 
#the results show that square feet living space has a beta of 36% which is by far larger than any other predictor
install.packages("QuantPsyc")
library(QuantPsyc)
lm.beta(sppredict_lm)

#v
#again this show us that feet of living space has least amount of distance within the confidence interval. Year built is 
#a close second. This means the true value of population mean is contained in this sample mean
confint(sppredict_lm)

#vi
#f value of 64.5 show us that there was a significant change in the 2 models 
anova(saleprice_lm, sppredict_lm)

#vii
library(dplyr)
housing_df$residuals <- resid(sppredict_lm)
head(housing_df)

#viii
housing_df$standardized.residuals <- rstandard(sppredict_lm)
head(housing_df)

#ix
housing_df$large.residual <- housing_df$standardized.residuals>2|housing_df$standardized.residuals< -2
sum(housing_df$large.residual)

#xi
housing_df$large.residual c("cooks.distance", "leverage", "covariance.ratios")

#xii
install.packages("car")
library(car)
durbinWatsonTest(sppredict_lm)

#xiii
vif(sppredict_lm)

#Xiv
plot(housing_df$residuals)
hist(housing_df$residuals)
