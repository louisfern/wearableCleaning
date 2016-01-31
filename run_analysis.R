## This script loads in a publicly available wearable computer dataset 
## (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
## and tidies up the data set.

## Load in dependencies
library(tidyr)
library(dplyr)

## Load in the data. 
filePath = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
fileName = "wearableData.zip"

if (!file.exists(fileName)){
  download.file(filePath, fileName)
}

if (!file.exists("UCI HAR Dataset")){
  unzip(fileName)
}

###############################################################################
## 1. Merges the training and the test sets to create one data set.

## First we load in all the features and activity labels.
features <- read.table("./UCI HAR Dataset/features.txt", 
                     col.names=c("Feature Number","Feature"),
                     colClasses = "character")

activity <- read.table("./UCI HAR Dataset/activity_labels.txt", 
                           col.names=c("Activity number", "Activity"))

## Next we dig into the actual datasets

subject_Test <- read.table("./UCI HAR Dataset/test/subject_test.txt",
                           col.names = "Subject")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt",
                     col.names="Training Label")

subject_Train <-  read.table("./UCI HAR Dataset/train/subject_train.txt",
                             col.names = "Subject")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt",
                      col.names = "Training Label")

test <- read.table("./UCI HAR Dataset/test/X_test.txt",
                   col.names = features$Feature)
train <- read.table("./UCI HAR Dataset/train/X_train.txt",
                    col.names = features$Feature)

## Combine all the data for training and testing separately by columns
testData <- cbind(test,y_test,subject_Test)
trainData <- cbind(train,y_train,subject_Train)

## Combine both data sets by row.
data <- tbl_df(rbind(testData,trainData))

###############################################################################
## 2. Extracts only the measurements on the mean and standard deviation for 
## each measurement. 

## We will use dplyr for selection. We will leave off anything that doesn't 
## contain either the labels we've assigned or the mean or std measurements.
subData <- data %>% select(contains("mean"), 
                           contains("std"),
                           contains("Training.Label"),
                           contains("Subject"),
                           -contains("meanFreq"))

###############################################################################
## 3. Uses descriptive activity names to name the activities in the data set

## We loaded in the activity names earlier, now we just need to go to each row
## and replace the value of "Training.Label" with the appropriate value.

subData <- subData %>% mutate(Activity = activity$Activity[Training.Label]) %>% 
  select(-Training.Label)

###############################################################################
## 4. Appropriately labels the data set with descriptive variable names. 

## We did this earlier when loading in the data by first reading in the 
## "features" dataset and using it as col.names when calling read.table. 
## Check it out!
# names(subData)
# [1] "tBodyAcc.mean...X"                   
# [2] "tBodyAcc.mean...Y"                   
# [3] "tBodyAcc.mean...Z"                   
# [4] "tGravityAcc.mean...X"                
# [5] "tGravityAcc.mean...Y"                
# [6] "tGravityAcc.mean...Z"                
# [7] "tBodyAccJerk.mean...X"               
# [8] "tBodyAccJerk.mean...Y"               
# [9] "tBodyAccJerk.mean...Z"  
# ...

###############################################################################
## 5. From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.

## Group the data set by activity and subject, summarize with the mean, and 
## save to a new data set.

tidy <- subData %>% group_by(Subject,Activity) %>% 
  summarize_each(funs(mean)) %>% gather(Measurement,Mean,-Subject,-Activity)

## dim(tidy)
## [1] 13140     4
## names(tidy)
##[1] "Subject"     "Activity"    "Measurement" "Mean"   

## Each row now only has a single observation on it. This is tidy!