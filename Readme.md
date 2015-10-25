---
title: "Getting and Cleaning Data - Course Project"
date: "Sunday, October 25, 2015"
output: html_document
---
This program downloads and processes Human Activity Recognition data measured using Samsung Galaxy S smartphones. The data from numerous text files is combined and reformatted to produce one tidy dataset that should be easy to read and analyse. Please see the codebook for more information regarding the data and processing.

***
#####Required packages:
```{r}
library(data.table)
library(dplyr)
library(tidyr)
```
***
###Sourcing and Compiling Data
Configure settings to download from 'https'
```{r}
setInternet2(TRUE)
```

Download the raw data file if not already present
```{r}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
rawdata <- "accelerometer_data.zip"

if(!file.exists(rawdata)){
    download.file(fileUrl, rawdata, mode="wb")}
```
Extract data from Zip File
```{r}
unzip(rawdata)
```
***
####Reading Files into R
Features to be used as column names
```{r}
features <-  as.data.frame(fread("UCI HAR Dataset/features.txt"))
```
Activity Labels to be merged on master data set
```{r}
actvLab  <-  fread("UCI HAR Dataset/activity_labels.txt")
names(actvLab) <- c("Activity", "Activity_Lbl")
```
Training Data Sets
```{r}
trainSub <-  fread("UCI HAR Dataset/train/subject_train.txt")
trainDat <-  fread("UCI HAR Dataset/train/X_train.txt")
trainLab <-  fread("UCI HAR Dataset/train/Y_train.txt")
```
Test Data Sets
```{r}
testSub  <-  fread("UCI HAR Dataset/test/subject_test.txt")
testDat  <-  fread("UCI HAR Dataset/test/X_test.txt")
testLab  <-  fread("UCI HAR Dataset/test/Y_test.txt")
```
***
####Make complete training set
Rename variables using the feature names
```{r}
names(trainSub) <- "Subject"
names(trainDat) <- features[,2]
names(trainLab) <- "Activity"
```
Select measurements for 'standard deviation' and 'mean'
```{r}
trainDat <- select(trainDat, contains("std()"), contains("mean()"))
```
Combine
```{r}
trainAll <- trainSub %>%
    mutate(Set = "Train") %>%
    bind_cols(trainLab) %>%
    bind_cols(trainDat)
```
***
####Make complete testing set
Rename variables using the feature names
```{r}
names(testSub) <- "Subject"
names(testDat) <- features[,2]
names(testLab) <- "Activity"
```
Select measurements for 'standard deviation' and 'mean'
```{r}
testDat <- select(testDat, contains("std()"), contains("mean()"))
```
Combine
```{r}
testAll <- testSub %>%
    mutate(Set = "Test") %>%
    bind_cols(testLab) %>%
    bind_cols(testDat)
```
***
####Merge all the Data  
This creates a master data set, containing all of the training and test subject data
```{r}
dataAll <- trainAll %>%
    union(testAll) %>%
    left_join(actvLab, by = "Activity") %>%
    select(Subject,Set,Activity_Lbl,everything()) %>%
    select(-Activity)
```
***
###Produce Tidy Data Set
Here we calculate the mean average of each activity measurement, grouped by subject and by activity type
```{r}
dataSum <- dataAll %>%
    group_by(Subject, Set, Activity_Lbl) %>%
    summarise_each(funs(mean))
```
Assign new human readable variable name to each column
```{r}
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
```
***
###Export File as CSV
```{r}
write.table(dataSum, file="UCI HAR Data.txt", sep=",", row.name=FALSE)
```
***

