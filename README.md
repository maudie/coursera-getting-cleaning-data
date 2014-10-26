Tidy up the UCI HAR dataset
===

Get the data
---

You can grab the zipped sample data from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Run the script
---

Unzip the source data, and run the run_analysis.R script in the directory where the top-level 'UCI HAR Dataset' folder lives.

The output will be two files: 'tidy_data.csv' and 'summary_stats.csv'

tidy_data.csv
---

This file combines all test and training data in a single table.

summary_stats.csv
---

This file contains the average of each variable for each activity and each subject.