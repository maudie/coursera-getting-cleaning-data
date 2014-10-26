Tidy up the UCI HAR dataset
===

Get the data
---

You can grab the zipped sample data from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Documentation for the variables in the source UCI HAR dataset can be found in the 'README.txt' and 'features_info.text' files in the 'UC HAR Dataset' directory of this repository.

Run the script
---

Unzip the source data, and run the run_analysis.R script in the directory where the top-level 'UCI HAR Dataset' folder lives.

The output will be two files: 'tidy_data.csv' and 'summary_stats.csv'

tidy_data.csv
---

This file combines all test and training data.

Column names for tidy_data.csv are:

* Subject: ID number for the subject observed
* Activity: ID number for the activity recorded
* Activity_Label: Human-readable label for the activity recorded
* 561 other columns with names mapped from the UCI HAR 'features.txt' file

summary_stats.csv
---

This file contains the average of each variable for each activity and each subject.

Column names for tidy_data.csv are:

* Subject: ID number for the subject observed
* Activity: ID number for the activity recorded
* Activity_Label: Human-readable label for the activity recorded
* 561 other columns with names mapped from the UCI HAR 'features.txt' file, also appended with 'mean' to reflect the fact that the mean of the column value has been taken for this summary statistic.