# Getting-and-Cleaning-Data-Course-Project 

## Content

This repository contains the output for the Coursera course project module "Getting and Cleaning data",   
part of the Data Science specialization. What follows first are my notes on the original data.

## The data

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.  
Each person performed six activities wearing a smartphone (Samsung Galaxy S II) on the waist.  
Using its embedded accelerometer and gyroscope, the researchers captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.  
The experiments have been video-recorded to label the data manually. 

The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The unprocessed data can be downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
The zip-file contains contains two folders "test" and "train"

* The test folder contains files about features (X-test), activity (Y-test) and subjects (subject_test)
* The train folder contains the same files but for the training dataset
* Other files include the activity labels, information about the features and the features themselves

The features (561 of them) are unlabeled. 

## The R script 

In order to obtain the tidy.txt file, an R script has been made. I have made this R script by executing the following subtasks

* Merging the training and the test sets to create one data set    
* Extracting only the measurements on the mean and standard deviation for each measurement  
* Using descriptive activity names to name the activities in the data set  
* Labeling the data set with descriptive variable names  
* From the data set in step 4, I have created a second, independent tidy data set with the average of each variable for each activity and each subject

# The Codebook

The CodeBook.md file explains the transformations performed and the resulting data and variables
