#Loading the data table package to be used later
library(data.table)

#Reading the data files
features <- read.table("UCI Har Dataset/features.txt")
activities <- read.table("UCI Har Dataset/activity_labels.txt")

XTrain <- read.table("UCI Har Dataset/train/X_train.txt")
XTest <- read.table("UCI Har Dataset/test/X_test.txt")

YTrain <- read.table("UCI Har Dataset/train/Y_train.txt")  
YTest <- read.table("UCI Har Dataset/test/Y_test.txt")

SubjectTrain <- read.table("UCI Har Dataset/train/subject_train.txt")
SubjectTest <- read.table("UCI Har Dataset/test/subject_test.txt")

#Creating a total Data Frame binding the Xtrain and XTest Data
XTotal <- rbind(XTrain,XTest)

#Creating a Data Frame containing the subjects that provided the data
SubjectTotal <- rbind(SubjectTrain,SubjectTest)

#Obtaining column names for the XTotal Data Frame from the features file 
names <- as.character(features[,2])
colnames(XTotal) <- names

#Creating a Data Frame containing all of the mean data
means <- XTotal[,grep("mean", colnames(XTotal))]
#Creating a Data Frame containing all of the std data
std <- XTotal[,grep("std", colnames(XTotal))]

#Renaming the Subjects dataframe
colnames(SubjectTotal) <- "Subject"

#Creating a Data Frame of the activity labels
YTotal <- rbind(YTrain,YTest)

#Replacing the activity values numbers with their character interpretations
activitynames <- as.character(activities[,2])
for (i in 1:nrow(YTotal)){
    if (YTotal[i,] == 1) 
  {
    YTotal[i,] <- activitynames[1]
  }
    if (YTotal[i,] == 2) 
  {
    YTotal[i,] <- activitynames[2]
  }
    if (YTotal[i,] == 3) 
  {
    YTotal[i,] <- activitynames[3]
  }
    if (YTotal[i,] == 4) 
  {
    YTotal[i,] <- activitynames[4]
  }
    if (YTotal[i,] == 5) 
  {
    YTotal[i,] <- activitynames[5]
  }
    if (YTotal[i,] == 6) 
  {
    YTotal[i,] <- activitynames[6]
  }
}

#Adding the correct column heading to YTotal
colnames(YTotal) <- "Activity"

#Adding the activity labels to the means and STD Datasets
means <- cbind(YTotal,means)
std <- cbind(YTotal,std)

#Combining means and std into one
data <- cbind(means,std)

#Adding the subjects to the total dataset
data <- cbind(SubjectTotal,data)

#Convert to a Data Table
datatable <- data.table(data)

#Clean Data
tidydata <- datatable[,lapply(.SD,mean), by=list(Subject,Activity)]

#Writing To a file.
write.table(tidydata, file="VariableMeans.txt", row.names = FALSE)
