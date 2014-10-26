###################################
## Getting and Cleaning Data
## Course project
###################################

require(plyr)

## Unzip the UCI HAR dataset, which can be downloaded from
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Run run_analysis.R script in the directory where the 'UCI HAR Dataset' folder lives

## This script:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the
##    average of each variable for each activity and each subject.

###################################
## Load fixed width text data files into data frames

# Meta data
features <- read.table('./UCI HAR Dataset/features.txt', sep = ' ')
activity_labels <- read.table('./UCI HAR Dataset/activity_labels.txt', sep = ' ')

## Test set
X_test <- read.fwf('./UCI HAR Dataset/test/X_test.txt', c(rep(16,561)))
y_test <- read.fwf('./UCI HAR Dataset/test/y_test.txt', 1)
subject_test <- read.fwf('./UCI HAR Dataset/test/subject_test.txt', 2)
body_acc_x_test <- read.fwf('./UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt', c(rep(16,128)))
body_acc_y_test <- read.fwf('./UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt', c(rep(16,128)))
body_acc_z_test <- read.fwf('./UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt', c(rep(16,128)))
gyro_acc_x_test <- read.fwf('./UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt', c(rep(16,128)))
gyro_acc_y_test <- read.fwf('./UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt', c(rep(16,128)))
gyro_acc_z_test <- read.fwf('./UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt', c(rep(16,128)))
total_acc_x_test <- read.fwf('./UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt', c(rep(16,128)))
total_acc_y_test <- read.fwf('./UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt', c(rep(16,128)))
total_acc_z_test <- read.fwf('./UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt', c(rep(16,128)))

## Training set
X_train <- read.fwf('./UCI HAR Dataset/train/X_train.txt', c(rep(16,561)))
y_train <- read.fwf('./UCI HAR Dataset/train/y_train.txt', 1)
subject_train <- read.fwf('./UCI HAR Dataset/train/subject_train.txt', 2)
body_acc_x_train <- read.fwf('./UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt', c(rep(16,128)))
body_acc_y_train <- read.fwf('./UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt', c(rep(16,128)))
body_acc_z_train <- read.fwf('./UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt', c(rep(16,128)))
gyro_acc_x_train <- read.fwf('./UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt', c(rep(16,128)))
gyro_acc_y_train <- read.fwf('./UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt', c(rep(16,128)))
gyro_acc_z_train <- read.fwf('./UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt', c(rep(16,128)))
total_acc_x_train <- read.fwf('./UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt', c(rep(16,128)))
total_acc_y_train <- read.fwf('./UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt', c(rep(16,128)))
total_acc_z_train <- read.fwf('./UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt', c(rep(16,128)))

###################################
## Merge the test and training data

# Rename some variables to be more meaningful before merging
subject_test_rename <- rename(subject_test, replace = c('V1' = 'Subject'))
subject_train_rename <- rename(subject_train, replace = c('V1' = 'Subject'))
activity_labels_rename <- rename(activity_labels, replace = c('V1' = 'Activity', 'V2' = 'Activity_Label'))
y_test_rename <- rename(y_test, replace = c('V1' = 'Activity'))
y_train_rename <- rename(y_train, replace = c('V1' = 'Activity'))

# Join the activity labels in for easy reading
y_test_rename <- join(y_test_rename, activity_labels_rename)
y_train_rename <- join(y_train_rename, activity_labels_rename)

# Add the features names to the test and training data
X_test_rename <- X_test
X_train_rename <- X_train
names(X_test_rename) <- features$V2
names(X_train_rename) <- features$V2

# Combine the test data into a single data frame
df_test <- data.frame(subject_test_rename, y_test_rename, X_test_rename)

# Combine the train data into a single data frame
df_train <- data.frame(subject_train_rename, y_train_rename, X_train_rename)

# Rbind the test and train data into one data frame
df <- rbind(df_test, df_train)

###################################
## Write out the tidy data

# Write out complete dataset
write.table(df, file="tidy_data.csv", sep=",", row.names = FALSE) 

###################################
## Compute summary statistics

# Compute Summary dataset with average of each variable by activity and subject
