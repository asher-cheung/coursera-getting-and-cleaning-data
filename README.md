# Getting and Clearning Data - Course Project

This repo hosts the R script and coresponding instructions documentst for the Getting and Cleaning Data course in Coursera.

The R script, 'run_analysis.R', performs the data analysis in the following steps.

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
