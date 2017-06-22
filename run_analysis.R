## 1. Merge the training and test sets to create one dataset

## Import all datasets, assign names and merge all into one dataset

setwd("C:/Users/blijnen/Documents/Coursera")
features_train<-read.table("C:/Users/blijnen/Documents/Coursera/UCI HAR Dataset/train/X_train.txt")
activity_train<-read.table("C:/Users/blijnen/Documents/Coursera/UCI HAR Dataset/train/y_train.txt")
subject_train<-read.table("C:/Users/blijnen/Documents/Coursera/UCI HAR Dataset/train/subject_train.txt")
features_test<-read.table("C:/Users/blijnen/Documents/Coursera/UCI HAR Dataset/test/X_test.txt")
activity_test<-read.table("C:/Users/blijnen/Documents/Coursera/UCI HAR Dataset/test/y_test.txt")
subject_test<-read.table("C:/Users/blijnen/Documents/Coursera/UCI HAR Dataset/test/subject_test.txt")
features<-read.table("C:/Users/blijnen/Documents/Coursera/UCI HAR Dataset/features.txt")
activity_labels<-read.table("C:/Users/blijnen/Documents/Coursera/UCI HAR Dataset/activity_labels.txt")

subjects<-rbind(subject_train, subject_test)
activity<-rbind(activity_train, activity_test)
features_set<-rbind(features_train, features_test)

names(subjects)<-c("subject")
names(activity)<-c("activity")
names(features_set)<-features[,2]

merged_data<-cbind(subjects, activity)
complete_data<-cbind(features_set, merged_data)
View(complete_data)
colnames(complete_data)

## 2. Extract the measurements on mean and std for each measurement 

col_names<-colnames(complete_data)
mean_std<-(grepl("activity", col_names)|
                   grepl("subject", col_names)|
                   grepl("mean..", col_names)|
                   grepl("std..", col_names))
subdata<-complete_data[,mean_std==TRUE]
View(subdata)

## 3. Use descriptive activity names to name the activities in the dataset

subdata$activity<-factor(subdata$activity, labels=activity_labels[,2])

## 4. Appropriately labels the data set with descriptive variable names

names(subdata) <- gsub("Acc", "Accelerator", names(subdata))
names(subdata) <- gsub("Mag", "Magnitude", names(subdata))
names(subdata) <- gsub("Gyro", "Gyroscope", names(subdata))
names(subdata) <- gsub("^t", "time", names(subdata))
names(subdata) <- gsub("^f", "frequency", names(subdata))
names(subdata)<-gsub("-mean()", "Mean", names(subdata), ignore.case = TRUE)
names(subdata)<-gsub("-std()", "STD", names(subdata), ignore.case = TRUE)
names(subdata)<-gsub("-freq()", "Frequency", names(subdata), ignore.case = TRUE)
names(subdata)<-gsub("angle", "Angle", names(subdata))
names(subdata)<-gsub("gravity", "Gravity", names(subdata))

## 5. Second independent tidy dataset

subdata$subject<-as.factor(subdata$subject)
library(data.table)
subdata<-data.table(subdata)
tidy_dataset<-aggregate(.~subject+activity, subdata, mean)
tidy_dataset <- tidy_dataset[order(tidy_dataset$subject,tidy_dataset$activity),]
write.table(tidy_dataset, file = "Tidy.txt", row.names = FALSE)