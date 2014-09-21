Getting and Cleaning Data Course Project
========================================

##Overview

This project serves to demonstrate the collection and cleaning of a tidy data set that can be used for subsequent analysis.

##This repo contains the following files:
1. READ.md
2. CodeBook.md
3. run_analysis.R


##Transformation details

There are 5 parts:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject

##How run_analysis.R implements the above steps:

Require reshapre2 and data.table librareis.
Load both test and train data
Load the features and activity labels.
Extract the mean and standard deviation column names and data.
Process the data. There are two parts processing test and train data respectively.
Merge data set.
