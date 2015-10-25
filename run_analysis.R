##  Getting and Cleaning Data - Course Project

##  Load required packages
library(data.table)
library(dplyr)
library(tidyr)

#------------------------------------------------------------------------------
#   Step 01: Source Data
#------------------------------------------------------------------------------
##  Configure settings to download from 'https'
setInternet2(TRUE)

##  Download file if not already present
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
rawdata <- "accelerometer_data.zip"

if(!file.exists(rawdata)){
    download.file(fileUrl, rawdata, mode="wb")}

##  Extract data from Zip File
unzip(rawdata)


#------------------------------------------------------------------------------
#   Step 02: Compile Data Sets
#------------------------------------------------------------------------------
##  Read all data to data tables

##  Features = Column Names
features <-  as.data.frame(fread("UCI HAR Dataset/features.txt"))

##  Activity Labels
actvLab  <-  fread("UCI HAR Dataset/activity_labels.txt")
names(actvLab) <- c("Activity", "Activity_Lbl")

trainSub <-  fread("UCI HAR Dataset/train/subject_train.txt")
trainDat <-  fread("UCI HAR Dataset/train/X_train.txt")
trainLab <-  fread("UCI HAR Dataset/train/Y_train.txt")

testSub  <-  fread("UCI HAR Dataset/test/subject_test.txt")
testDat  <-  fread("UCI HAR Dataset/test/X_test.txt")
testLab  <-  fread("UCI HAR Dataset/test/Y_test.txt")

##  Build complete training set
##  Rename variables
names(trainSub) <- "Subject"
names(trainDat) <- features[,2]
names(trainLab) <- "Activity"

##  Select measurements for 'standard deviation' and 'mean'
trainDat <- select(trainDat, contains("std()"), contains("mean()"))

##  Combine training data sets
trainAll <- trainSub %>%
    mutate(Set = "Train") %>%
    bind_cols(trainLab) %>%
    bind_cols(trainDat)

##  Build complete testing set
##  Rename variables
names(testSub) <- "Subject"
names(testDat) <- features[,2]
names(testLab) <- "Activity"

##  Select measurements for 'standard deviation' and 'mean'
testDat <- select(testDat, contains("std()"), contains("mean()"))

##  Combine testing data sets
testAll <- testSub %>%
    mutate(Set = "Test") %>%
    bind_cols(testLab) %>%
    bind_cols(testDat)

##  Combine training and testing sets, then merge activity labels
dataAll <- trainAll %>%
    union(testAll) %>%
    left_join(actvLab, by = "Activity") %>%
    select(Subject,Set,Activity_Lbl,everything()) %>%
    select(-Activity)


#------------------------------------------------------------------------------
#   Step 03: Summarise Data
#------------------------------------------------------------------------------
##  Calculate mean activity measurements by subject and activity type
dataSum <- dataAll %>%
    group_by(Subject, Set, Activity_Lbl) %>%
    summarise_each(funs(mean))

##  Give human readable names to variables
cnames <- colnames(dataSum)
cnames <- gsub("^t","Time_", cnames)
cnames <- gsub("^f","Freq_", cnames)
cnames <- gsub("Body","Body_", cnames)
cnames <- gsub("Gravity","Gravity_", cnames)
cnames <- gsub("Acc","Acc_", cnames)
cnames <- gsub("Jerk","Jerk_", cnames)
cnames <- gsub("Gyro","Gyro_", cnames)
cnames <- gsub("Mag","Magnitude_", cnames)
cnames <- gsub("std","Std.dv_", cnames)
cnames <- gsub("mean","Mean_", cnames)
cnames <- gsub("-","", cnames)
cnames <- gsub("\\()","", cnames)
cnames <- gsub("_$","", cnames)

names(dataSum) <- cnames

##  Export summary as txt file
write.table(dataSum, file="UCI HAR Data.txt", sep=",", row.name=FALSE)


