# Assignment: American Community Survey 
# Name: Taylor, Dominick
# Date: 2021-04-03

#Getting Working dir and changing working dir
getwd()
setwd("C:/Users/nickm/Documents/GitHub/dsc520/data")

#import survey CSV
survey_df <- read.csv("acs-14-1yr-s0201.csv")
head(survey_df)                   

#provide the output from the following functions: str(); nrow(); ncol()
str(survey_df)
nrow(survey_df)
ncol(survey_df)

#loading library
library(ggplot2)

#Create a Histogram of the HSDegree variable using the ggplot2 package.
#Set a bin size for the Histogram.
#Include a Title and appropriate X/Y axis labels on your Histogram Plot.

ggplot(data = survey_df, aes(HSDegree)) + geom_histogram(bins = 10)+ggtitle("HighSchool Degree Histogram")+xlab("HS Degree Percentile")+ylab("Percentile Count")

#Based on what you see in this histogram, is the data distribution unimodal?
#No

#Is it approximately symmetrical?
#No

#Is it approximately bell-shaped?
#No

#Is it approximately normal?
#No

#If not normal, is the distribution skewed? If so, in which direction?
#Yes, It is Negatively skewed

#Include a normal curve to the Histogram that you plotted.
#Completely lost here. Not sure how to get the curve to show up
#ggplot(data = survey_df, aes(HSDegree)) + geom_histogram(aes(y = density),stat_function(fun = dnorm, args = list, sd =1 (mean = mean(df$HSDegree)),binwidth = 1, color = "black", alpha=7)+ggtitle("HighSchool Degree Histogram")+xlab("HS Degree Percentile")+ylab("Percentile Count")

#Create a Probability Plot of the HSDegree variable.
ggplot(data = survey_df, aes(sample = HSDegree)) + stat_qq() + stat_qq_line()                                                   

#ased on what you see in this probability plot, is the distribution approximately normal? Explain how you know. 
#no

#If not normal, is the distribution skewed? If so, in which direction? Explain how you know.
#it looks to be skewed to the left as there are outliers that fall that direction on both sides

#Now that you have looked at this data visually for normality, 
#you will now quantify normality with numbers using the stat.desc() function. 
#Include a screen capture of the results produced.

library(pastecs)
stat.desc(survey_df)                                                         
