Tidy up the UCI HAR dataset
===

Get the data
---

You can grab the zipped sample data from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Documentation for the variables in the source UCI HAR dataset can be found in the 'README.txt' and 'features_info.text' files in the 'UC HAR Dataset' directory of this repository. A summary of key points follows at the end of this readme.

Run the script
---

Unzip the source data, and run the run_analysis.R script in the directory where the top-level 'UCI HAR Dataset' folder lives.

The output will be two files: 'tidy_data.csv' and 'summary_stats.csv'

Output file 1: train_test_combined.csv
---

This file combines all test and training data into a single table.

Column names for tidy_data.csv are:

* Subject: ID number for the subject observed
* Activity: ID number for the activity recorded
* Activity_Label: Human-readable label for the activity recorded
* 561 other columns with names mapped from the UCI HAR 'features.txt' file

Output file 2: summary_stats.csv
---

This file contains the average of each variable for each activity and each subject.

Column names for tidy_data.csv are:

* Subject: ID number for the subject observed
* Activity: ID number for the activity recorded
* Activity_Label: Human-readable label for the activity recorded
* 561 other columns with names mapped from the UCI HAR 'features.txt' file, also appended with 'mean' to reflect the fact that the mean of the column value has been taken for this summary statistic.

What does all this data mean?
---

(For complete description refer to the UCI HAR 'README.md' and 'features_info.txt' files)

The data handled by this script comes from the Human Activity Recognition Using Smartphones Dataset. The data was gathered in experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. The data captured is from the device's embedded accelerometer and gyroscope, reflecting 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

Each measurement recorded includes:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean