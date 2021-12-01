Code Book

=========================================

Script creation date : November 30, 2021\
Script last modification date : December 1, 2021\
Version 1.0

=========================================

Raw data used

Human Activity Recognition Using Smartphones Dataset\
Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.\
Smartlab - Non Linear Complex Systems Laboratory\
DITEN - Universit・degli Studi di Genova.\
Via Opera Pia 11A, I-16145, Genoa, Italy.\
activityrecognition@smartlab.ws\
www.smartlab.ws

Download link: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

Below files are used in this script :\
&ensp; "activity_labels.txt"\
&ensp; "features.txt"\
&ensp; "train/X_train.txt"\
&ensp; "test/X_test.txt"\
&ensp; "train/y_train.txt"\
&ensp; "test/y_test.txt"\
&ensp; "train/subject_train.txt"\
&ensp; "test/subject_test.txt"

=========================================

Variables

activity_labels\
&ensp; Matrix with 6 rows/entries and 2 columns/variables ("label", "activity") \
&ensp; Imported from "activity_labels.txt" using read.table function\
&ensp; Links the class labels with their activity name
	
features\
&ensp; Matrix with 561 rows/entries and 2 columns/variables ("number", "feature") \
&ensp; Imported from "features.txt" using read.table function\
&ensp; List of all features
	
X_train\
&ensp; Matrix with 7352 rows/entries and 561 columns/variables \
&ensp; Imported from "train/X_train.txt" using read.table function \
&ensp; Recorded features for the training set
	
X_test\
&ensp; Matrix with 2947 rows/entries and 561 columns/variables \
&ensp; Imported from "test/X_test.txt" using read.table function\
&ensp; Recorded features for the test set
	
y_train\
&ensp; Matrix with 7352 rows/entries and 1 column/variable \
&ensp; Imported from "train/y_train.txt" using read.table function\
&ensp; Activity labels for the training set
	
y_test\
&ensp; Matrix with 2947 rows/entries and 1 column/variable \
&ensp; Imported from "test/y_test.txt" using read.table function\
&ensp; Activity labels for the test set
	
subject_train\
&ensp; Matrix with 7352 rows/entries and 1 column/variable \
&ensp; Imported from "train/subject_train.txt" using read.table function\
&ensp; Identifier for the subject who performed the activity in the training set
	
subject_test\
&ensp; Matrix with 2947 rows/entries and 1 column/variable \
&ensp; Imported from "test/subject_test.txt" using read.table function\
&ensp; Identifier for the subject who performed the activity in the test set
	
X_merged\
&ensp; Matrix with 10299 rows/entries and 561 columns/variables \
&ensp; Column names were assigned using the transpose of features$feature vector\
&ensp; Obtained by merging X_train and X_test rows using rbind function\
&ensp; Recorded features for the training set and the test set
	
y_merged\
&ensp; Matrix with 10299 rows/entries and 1 column/variable ("Activity") \
&ensp; Obtained by merging y_train and y_test rows using rbind function\
&ensp; Activity labels for the training set and the test set
	
subject_merged\
&ensp; Matrix with 10299 rows/entries and 1 column/variable ("Subject")\
&ensp; Obtained by merging subject_train and subject_test rows using rbind function\
&ensp; Identifier for the subject who performed the activity in the training set and the test set
	
Data_combined\
&ensp; Matrix with 10299 rows/entries and 563 columns\
&ensp; Obtained by merging subject_merged, y_merged and X_merged columns using cbind function\
&ensp; Links subject, activity labels and recorded features for the training set and the test set
	
Data_extracted\
&ensp; Matrix with 10299 rows/entries and 88 columns\
&ensp; Obtained by selecting some specific columns of Data_combined (X_merged, y_merged and mean/standard deviation columns for each measurement) using cbind, contains ("mean") and contains ("std") functions\
&ensp; Activity labels initially in y_merged were replaced by descriptive names from activity_labels$activity by matching y_merged and activity_labels$label vectors\
&ensp; Columns 3 ~ 88 (mean/standard deviation for each measurement) names were renamed as below using gsub function :\
&ensp; &ensp; 	"Acc" <- "Accelerometer"\
&ensp; &ensp; 	"Gyro" <- "Gyroscope"\
&ensp; &ensp; 	"^t" <- "Time"\
&ensp; &ensp; 	"^f" <- "Frequency"\
&ensp; &ensp; 	"Mag" <- "Magnitude"\
&ensp; &ensp; 	"BodyBody" <- "Body"\
&ensp; &ensp; 	"gravity" <- "Gravity"\
&ensp; &ensp; 	"angle" <- "Angle"\
&ensp; &ensp; 	"tBody" <- "TimeBody"\
&ensp; Links subject, activity descriptive names and mean/standard deviation for each measurement for the training set and the test set
	
Tidy_data\
&ensp; Matrix with 180 rows/entries and 88 columns\
&ensp; Same column names that Data_extracted\
&ensp; Rows were obtained by averaging Data_extracted by Data_extracted$Subject and Data_extracted$Activity using group_by and summarize_all functions\
&ensp; Each row links a specific subject and a specific activity combination to its averaged mean/standard deviation measurements

=========================================
