#========================================================================#
# Cardio fitness project
# Objective: Preliminary data analysis/exploration
# 1. Come up with customer profile/characteristics based on the products
# 2. Perform univariate and bivariate analysis
# 3. Generate insights and recommendations for target market
#========================================================================#

# A. Environment Set up and Data Import# 

###Loading library
library(tidyverse)#This library contains the ggplot (graphs) and 
                  #readr(import .csv files)libraries 
library(rpivotTable) #This can be used to easily generate tables

###Setting up working directory
setwd("C:/Users/user/Downloads/AUSTIN/Descriptive Stats/Cardio Project")

### Importing data
Cardio = read.csv("CardioGoodFitness.csv")
view(Cardio)
attach(Cardio)#This helps to access a variable simply by stating the col names

### Data exploration
dim(Cardio) ##To determine the dimension of the data i.e. no of Cols and Rows
# [1] 180   9
# the fitness data set consists of 180 observations recorded for 9 variables

## Observing the top and bottom 10 features of the data
head(Cardio, 10)
tail(Cardio, 10)
## The data set was recorded based on the type of product with TM195 as the top 
## while TM798 records came later

# Find out Names of the Columns (Features)
names(Cardio)

#Observing the data structure and data type/class
?str(Cardio)
summary(Cardio)

#Checking for missing variable
anyNA(Cardio)

### UNIVARIATE ANALYSIS ###
names(Cardio) ##Bringing this back to easily pick out the names
              ## instead of scrolling up##
#[1] "Product"    "Age"           "Gender"        "Education"  "MaritalStatus"
# [6] "Usage"      "Fitness"       "Income"        "Miles" 

#The summary functn already provided some basic insights (5-number summary)
#This will now be shown in plots/charts

par(mfrow=c(1,2))#(This is to divide the output page into 2 pages)
boxplot(Usage,horizontal = TRUE,col='green',main="Box plot of usage")
boxplot(Fitness,horizontal = TRUE,col='red',main="Box plot of fitness")
table(Fitness)
table(Usage)

Cardio$Income_hundreth = (Cardio$Income/100)##This is to divide the income by 100 
                                            ##for ease of visualization on graph

attach(Cardio)
hist(Income_hundreth, main='Income(00)',xlab='Income', col = 'orange')#Histogram for income distibution
par(mfrow=c(1,2)) #(This is to divide the output page into 2 pages)

##Ploting Histogram for Income distribution per gender
hist(Income_hundreth[Gender=='Female'], main='Income_Female(00)',
     xlab='Income', col = 'pink')
hist(Income_hundreth[Gender=='Male'], main='Income_Male(00)',
     xlab='Income', col = 'blue')


hist(Education, main='Education', col = 'grey')#Histogram for Education distibution
##Ploting Educational distribution per gender
hist(Education[Gender=='Female'], main='Education(Female)',
     xlab='Education', col = 'pink')
hist(Education[Gender=='Male'], main='Education(Male)',
     xlab='Education', col = 'blue')

hist(Miles, col = 'brown')#Histogram distribution for No of Miles run
##Ploting Miles run distribution per gender
hist(Miles[Gender=='Female'], main='Miles Run (Female)',
     xlab='Miles', col = 'pink')
hist(Miles[Gender=='Male'], main='Miles Run (Male)',
     xlab='Miles', col = 'blue')

###BIVARIATE ANALYSIS
## This will be used to determine the interaction between two variable
## The rpivotTable function will also be used here
rpivotTable(Cardio)
write.csv(Cardio, "Cardio.csv", row.names = FALSE)

