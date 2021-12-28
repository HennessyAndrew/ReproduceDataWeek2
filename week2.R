#The dataset is activity.csv
#The variables included in this dataset are:
  # steps: Number of steps taking in a 5-minute interval (missing values are coded as \color{red}{\verb|NA|}NA)
  # date: The date on which the measurement was taken in YYYY-MM-DD format
  # interval: Identifier for the 5-minute interval in which measurement was taken
  # The dataset is stored in a comma-separated-value (CSV) file and there are a total of 17,568 observations in this dataset.

#Set directory setwd ("C:/Users/Charlotte/Documents/GitHub/ReproduceDataWeek2")
#load data from directory
DataFrame <- read.csv( "activity.csv")