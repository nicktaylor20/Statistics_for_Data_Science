# Assignment: Exercise 5.2
# Name: Taylor, Dominick
# Date: 2021-04-17

#Setting Working directory
getwd()
setwd("/Users/nickm/Documents/GitHub/dsc520")

#loading dplyr lib and creating data frame
library(dplyr)
heights_df <- read.csv("data/r4ds/heights.csv")

head(heights_df)

#Using the dplyr package, use the 6 different operations to analyze/transform the data - 
#GroupBy, Summarize, Mutate, Filter, Select, and Arrange - Remember this isn't just modifying data, 
#you are learning about your data also - so play around and start to understand your dataset in more detail

#Select
select(heights_df,earn)
select(heights_df, starts_with('r'))
select(heights_df, race, height)

#summarize
summarise(heights_df, mean(earn))
summarise(heights_df,max(height), mean(age))


#groupby
group_by(heights_df, race) %>% summarise(mean(earn))
group_by(heights_df, sex) %>% summarise(max(height))


#filter
filter(heights_df, earn < 20000 & sex == "female")
filter(heights_df, age > 70)
filter(heights_df, race == "other") %>% summarise(mean(earn))

#mutate
select(heights_df, sex, race, earn) %>% mutate(Double=earn*2)

#arrange
group_by(heights_df, race) %>% summarise(avgheight=mean(height)) %>% arrange(avgheight)


#Using the purrr package - perform 2 functions on your dataset. 
#You could use zip_n, keep, discard, compact, etc.

library(purrr)

select(heights_df, earn) %>% keep(function(x)mean(.x) > 20000)
#I could not figure out how to use these functions 


#Use the cbind and rbind function on your dataset

#rbind
getwd()
student_df <- read.csv("data/student-survey.csv") 
head(student_df)

y2 <- c(10, 190, 100.00, 1)
new_df<-rbind(student_df, y2)
new_df

#cbind
StudentID <- c(1,2,3,4,5,6,7,8,9,10,11)
new_df<- cbind(StudentID)


#Split a string, then concatenate the results back together

install.packages("stringr")
library(stringr)

mystring <- "Hello my name is Nick Taylor"
mystring

string_list <- str_split(mystring, pattern =" ")
string_list

paste(string_list, sep = "/")
