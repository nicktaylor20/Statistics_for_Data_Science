#Dominick Taylor
#5/18/2021
#Exercise10.2


library(foreign)
#set working directory
getwd()
setwd("C:/Users/nickm/Documents/GitHub/dsc520/data")

surgery_df <- read.arff("ThoraricSurgery.arff")
head(surgery_df)

#Fit GLM

new_model <- glm(Risk1Yr ~ PRE5 + PRE6 + PRE7 + PRE8 + PRE9 + PRE10 + PRE11 + PRE14 + PRE17 + PRE19 + PRE25 +
                 PRE30 + PRE32 + AGE, data = surgery_df, family ="binomial"(link="logit"))

#Ran a second test on the top 2 predictors 
second_model <- glm(Risk1Yr ~ PRE19 + PRE32, data = surgery_df, family = "binomial"(link = "logit"))
                
#based on the glm PRE32 and PRE19 have the greatest effect on survival rate
summary(new_model)
summary(second_model)


#plot of coefficients 
library(coefplot)
coefplot(new_model)



res <- predict(new_model, surgery_df)
res

res_2<- predict(second_model, surgery_df)
res_2

confmatrix <-table(Actual_Value=surgery_df$Risk1Yr, Predicted_Value = res_2 >0.5)
confmatrix

confmatrix2 <-table(Actual_Value=surgery_df$Risk1Yr, Predicted_Value = res_2 >0.5)
confmatrix2

(confmatrix[[1,1]] + confmatrix[[2,2]])/ sum(confmatrix)

(confmatrix2[[1,1]] + confmatrix2[[2,2]])/ sum(confmatrix2)
#summary of the second_model is 100% of the new_model is 85% 


#2
binary_df <- read.csv("binary-classifier-data.csv")
head(binary_df)

bin_model <- glm(label ~ x + y, data = binary_df, family = "binomial"(link = "logit"))  
summary(bin_model)

res_3<-predict(bin_model, binary_df)
res_3

confmatrix3 <- table(Actual_Value=binary_df$label, Predicted_Value = res_3 >0.5)
confmatrix3
(confmatrix3[[1,1]] + confmatrix3[[2,2]])/ sum(confmatrix3)

confmatrix3[[1,1]]
confmatrix3[[2,2]]
sum(confmatrix3)

#looks like the accuracy of this model is 0
  