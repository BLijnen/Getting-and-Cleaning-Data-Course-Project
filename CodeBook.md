# Code Book for the tidy dataset

This is a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data.

## Data source

Data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Full description is available at the site: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

For information about the research, please check the README.md file

## Description of the data 

* Human Activity Recognition database built from the observations of 30 subjects 
* A 561-feature vector with time and frequency domain variables 
* The activity labels
* Identifier of the subject who carried out the experiment.

The dataset includes the following files:

'README.txt'

'features_info.txt': Shows information about the variables used on the feature vector.

'features.txt': List of all features.

'activity_labels.txt': Links the class labels with their activity name.

'train/X_train.txt': Training set.

'train/y_train.txt': Training labels.

'test/X_test.txt': Test set.

'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.

'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.

'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.

'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.


## R script Run_analysis.R 

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## How the script is structured

package data.table is required

* First I have imported all the datasets and assigned names to them: features_train, activity_train, subject_train, features_test, activity_test, subject_test  
features, activity_labels
* I have combined the subject data in one dataset (subjects), the activity data in one dataset (activity) and the features in one dataset (features_set),  
named them and extracted the features from the second column of the feature dataset to assign the appropriate names
* I then merged the subjects and activity dataset and combined this merged file with the features_set to have one complete dataset
* Using the command "grepl" I have searched for all column names containing the words "mean" and "std"
* I subsetted this data into a new dataset "subdata"
* Using the gsub command I have assigned clearer labels to the dataset
* Using the package data.table, I have transformed my subdata (after making a factor of the subject variable) into a data table
* With the aggregate function I have calculated the mean for each subject and activity
* I have exported the result as "Tidy.txt"



