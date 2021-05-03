# Assignment: ASSIGNMENT 5
# Name: Lastname, Firstname
# Date: 2010-02-14

## Set the working directory to the root of your DSC 520 directory
getwd()


## Load the `data/r4ds/heights.csv` to
heights_df <- read.csv("data/r4ds/heights.csv")

## Using `cor()` compute correclation coefficients for
## height vs. earn
cor(heights_df$height, heights_df$earn)
### age vs. earn
cor(heights_df$age, heights_df$earn)

### ed vs. earn
cor(heights_df$ed, heights_df$earn)

## Spurious correlation
## The following is data on US spending on science, space, and technology in millions of today's dollars
## and Suicides by hanging strangulation and suffocation for the years 1999 to 2009
## Compute the correlation between these variables
tech_spending <- c(18079, 18594, 19753, 20734, 20831, 23029, 23597, 23584, 25525, 27731, 29449)
suicides <- c(5427, 5688, 6198, 6462, 6635, 7336, 7248, 7491, 8161, 8578, 9000)

cor(tech_spending, suicides)

#############################################################################
getwd()

studentsur_df <- read.csv("data/student-survey.csv")
cov(studentsur_df)
 # The convariance is used to calculate the variance relationship between two attributes. You would use this function
# to understand the relationship between elements in your data. from the results there is a positive covariance between
#between happines and TimeTV and a negative one between happiness and time reading


#When examining the data, I am not sure how these variables are being measured. I would guess the time in broken down
#into minutes and the gender is binary but not sure if 0 represents a male or female. It is not good to change values
#so you would have to find someway to standardize the measurements without "changing" the data. 

#i would preform a Spearman's Rho correlation on this dataset because the data have violated parametric assumptions
#and there is no clear definition for the measurements.


#Correlation on all Variables
cor(studentsur_df)

#A single correlation between two a pair of the variables
cor(studentsur_df$TimeTV, studentsur_df$Happiness)

#Repeat your correlation test in step 2 but set the confidence interval at 99%

timtv <- lm(TimeTV ~ 1, studentsur_df)

confint(timtv, level = 0.99)


 
