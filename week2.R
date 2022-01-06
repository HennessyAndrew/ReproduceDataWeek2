#I used the info here https://rpubs.com/sureshbk/358994
#https://rstudio-pubs-static.s3.amazonaws.com/300758_367ce30144b44cd4901bedfa279bb64c.html
#for the assignment

#The dataset is activity.csv
#The variables included in this dataset are:
  # steps: Number of steps taking in a 5-minute interval (missing values are coded as \color{red}{\verb|NA|}NA)
  # date: The date on which the measurement was taken in YYYY-MM-DD format
  # interval: Identifier for the 5-minute interval in which measurement was taken
  # The dataset is stored in a comma-separated-value (CSV) file and there are a total of 17,568 observations in this dataset.

#Set directory 
setwd ("C:/Users/Charlotte/Documents/GitHub/ReproduceDataWeek2")

#load data from directory
DataFrame <- read.csv( "activity.csv")

install.packages("magrittr")
library(magrittr)
#add dplyr to get summarise
install.packages("dplyr")
library(dplyr)

install.packages("ggplot2") 
library(ggplot2)

#1 Calculate the total number of steps taken per day?
#Get number of steps per date and sum results removing null
totalstepsperday <- aggregate(steps ~ date, data = DataFrame, FUN = sum, na.rm = TRUE)
#put date in YYYYMMDD format
DataFrame$date <- as.Date(DataFrame$date, "%Y-%m-%d")

#Make a histogram of the total number of steps taken each day. convert dates first
#"Histograms are used to show distributions of variables while bar charts are used to compare variables.
#Forbes mag https://www.forbes.com/sites/naomirobbins/2012/01/04/a-histogram-is-not-a-bar-chart/?sh=27f69e816d77
hist(totalstepsperday$steps, main = "steps per Day", breaks = 10)

#3 Calculate and report the mean and median total number of steps taken per day.
#calculate the mean:
mean_steps <- mean(totalstepsperday$steps)
mean_steps

#Calculate median
median_steps <- median(totalstepsperday$steps)
median_steps

#NEXT What is the average daily activity pattern?
#Make a time series plot (of type 1) the 5-minute interval (x-axis) 
#and the average number of steps taken, averaged across all days (y-axis)
#Which 5-minute interval, on average across all the days in the dataset, contains the maximum number of steps?
#From the DataFrame create dataset making Steps a dependent variable of interval 
fivemin <- aggregate(steps ~ interval, data = DataFrame, FUN = mean, na.rm = TRUE)
plot (x = fivemin$interval, y = fivemin$steps, type = "l", main = "5-minute interval")

#Which 5-minute interval, on average across all the days in the dataset, contains the maximum number of steps?
#note sure I follow this
five_min_maxsteps <- fivemin$interval[which.max(fivemin$steps)]
five_min_maxsteps

#Imputing missing values
#Calculate and report the total number of missing values in the dataset
#Install tidyverse to replace missing values
install.packages("tidyverse") 
library(tidyverse)

#Dup the dataframe
activity2 <- DataFrame
#Identify missing values of steps in the duplicated DataFrame
nas <- is.na(activity2$steps)
sum(is.na(activity2))
#=2304 missing values
#replace missing value with in activyt2
avg_interval <- tapply(activity2$steps, activity2$interval, mean, na.rm=TRUE, simplify = TRUE)

#Make a panel plot containing a time series plot (-= L) of the 5-minute interval 
#(x-axis) and the average number of steps taken, 
#averaged across all weekday days or weekend days (y-axis). 
#create number of steps per date from dataset with replaced NM values
totalstepsperday2 <- aggregate(steps ~ date, data = DataFrame, FUN = sum, na.rm = TRUE)

#setup frame for two graphs
par(mfrow=c(1,2))
##Histogram with the orginal dataset
hist(totalstepsperday$steps, 
     main="Total Steps per Day (Original)", 
     breaks=100)

hist(totalstepsperday2$steps, 
     main = "Total Steps per Day (no-NA)", 
     breaks=100)






