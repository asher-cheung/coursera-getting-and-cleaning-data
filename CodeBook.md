# Code Book

## Overview

## Input Files
* `features.txt`: List of all features. There are 561 features in total.
* `activity_labels.txt`: Links the class labels with their activity name. These datasets measure the following 6 activities.
  * WALKING
  * WALKING_UPSTAIRS
  * WALKING_DOWNSTAIRS
  * SITTING
  * STANDING
  * LAYING
* `train/X_train.txt`: Training set.
* `train/y_train.txt`: Training labels.
* `test/X_test.txt`: Test set.
* `test/y_test.txt`: Test labels.

## Analysis Instructions

The "run_analysis.R" script takes the following steps to complete the project requirements. 

1. Load necessary library to the working session.
2. Set working directory to be the data folder (assume the downloaded data files are unzipped to the data folder).
3. Read the subject and activity data from the "./test/subject_test.txt" and "./test/Y_test.txt" files and combine them together to the "testGroup" data frame.
4. Read the subject and activity data from the "./train/subject_train.txt" and "./train/Y_train.txt" files and combine them together to the "trainGroup" data frame.
5. Create the "groupData" data frame by merging the "testGroup" and "trainGroup" data frames.
6. Apply descriptive activity names to the "activity" column.
7. Create the "featureData" data frame by merging the data in the "./test/X_test.txt" and "./train/X_train.txt" files.
8. Create the "subFeatureData" data frame by extracting only the measurements on the mean and standard deviation for each measurement in the "featureData" data frame.
9. Combine the "groupData" and "featureData" together.
10. Create a tidy data set with the average of each variable for each activity and each subject.
11. Export the tidy data set to the working directory. 

