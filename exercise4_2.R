

getwd()

scores_data <- read.csv("scores.csv")
head(scores_data)


# What are the observational units in this study?
# The the perfromance of the two class sections are being measured by the scores and total points

# Identify the variables mentioned in the narrative paragraph and determine which are categorical and quantitative?
# Categotical Varibales = Section, Count
#Quantitative Varibales = Score

#Create one variable to hold a subset of your data set that contains only the Regular Section 
#and one variable for the Sports Section.

install.packages("dplyr")
library(dplyr)
#sports section variable 
sports_section <- filter(scores_data, Section == "Sports")
head(sports_section)
sports_section
#Regular section varible 
reg_section <- filter(scores_data, Section == "Regular")
head(reg_section)
reg_section

#scatter plot graph using dataset with both section
ggplot(data = scores_data, aes(x=Count, y=Score, col=Section)) + geom_point()

# Comparing and contrasting the point distributions between the two section, 
# looking at both tendency and consistency: Can you say that one section tended to score more points than the other? 
#Justify and explain your answer.

#By the plots within the graph it looks like students in the Regular section have a higher score rate.
# 150 students in the section scored over 300 points vs 130 for the sports section. 


# Did every student in one section score more points than every student in the other section? 
#If not, explain what a statistical tendency means in this context.
#adding a total score column for each section
SSwT<- mutate(sports_section, total_score = Count*Score)
RSwT<- mutate(reg_section, total_score = Count*Score)
#Summing the total score column to get the total points. 
sportsection_total <- select(SSwT, total_score)
regularsection_total <-select(RSwT, total_score)
colSums(sportsection_total)
colSums(regularsection_total)
#By the calculation of the sums of each section, students in the regular section scored more total points

#What could be one additional variable that was not mentioned in the narrative that could be 
#influencing the point distributions between the two sections?
#Gender is a variable that would have a great impact on this data and the distribution. 

#--------------- Part 2 ------------------

survey_data <- read.csv("acs-14-1yr-s0201.csv")
head(survey_data)
# Use the apply function on a variable in your dataset
install.packages("plyr")
library(plyr)
ddply(survey_data, "BachDegree", fun= NULL)

# Use the aggregate function on a variable in your dataset
aggregate(RacesReported~PopGroupID,survey_data,sum)

# Use the plyr function on a variable in your dataset - more specifically, 
#I want to see you split some data, perform a modification to the data, 
#and then bring it back together

survey_data2 <- mutate(survey_data, nonCollege_Grad = HSDegree - BachDegree)
head(survey_data2)
lapply(survey_data2$nonCollege_Grad, FUN = mean)

# Check distributions of the data
ggplot(data = survey_df, aes(HSDegree)) + geom_histogram(bins = 10)

#Identify if there are any outliers
ggplot(data = survey_data2, aes(x=BachDegree, y=RacesReported))+ geom_point()

       