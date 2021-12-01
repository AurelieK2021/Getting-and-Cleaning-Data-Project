Code Book

=========================================

Script creation date : November 30, 2021
Script last modification date : December 1, 2021
Version 1.0

=========================================

Raw data used

Human Activity Recognition Using Smartphones Dataset
Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit・degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

Download link: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

Below files are used in this script :
	"activity_labels.txt"
	"features.txt"
	"train/X_train.txt"
	"test/X_test.txt"
	"train/y_train.txt"
	"test/y_test.txt"
	"train/subject_train.txt"
	"test/subject_test.txt"

=========================================

Variables

activity_labels
	Matrix with 6 rows/entries and 2 columns/variables ("label", "activity") 
	Imported from "activity_labels.txt" using read.table function
	Links the class labels with their activity name
features
	Matrix with 561 rows/entries and 2 columns/variables ("number", "feature") 
	Imported from "features.txt" using read.table function
	List of all features
X_train
	Matrix with 7352 rows/entries and 561 columns/variables 
	Imported from "train/X_train.txt" using read.table function
	Recorded features for the training set
X_test
	Matrix with 2947 rows/entries and 561 columns/variables 
	Imported from "test/X_test.txt" using read.table function
	Recorded features for the test set
y_train
	Matrix with 7352 rows/entries and 1 column/variable 
	Imported from "train/y_train.txt" using read.table function
	Activity labels for the training set
y_test
	Matrix with 2947 rows/entries and 1 column/variable 
	Imported from "test/y_test.txt" using read.table function
	Activity labels for the test set
subject_train
	Matrix with 7352 rows/entries and 1 column/variable 
	Imported from "train/subject_train.txt" using read.table function
	Identifier for the subject who performed the activity in the training set
subject_test
	Matrix with 2947 rows/entries and 1 column/variable 
	Imported from "test/subject_test.txt" using read.table function
	Identifier for the subject who performed the activity in the test set
X_merged
	Matrix with 10299 rows/entries and 561 columns/variables 
	Column names were assigned using the transpose of features$feature vector
	Obtained by merging X_train and X_test rows using rbind function
	Recorded features for the training set and the test set
y_merged
	Matrix with 10299 rows/entries and 1 column/variable ("Activity") 
	Obtained by merging y_train and y_test rows using rbind function
	Activity labels for the training set and the test set
subject_merged
	Matrix with 10299 rows/entries and 1 column/variable ("Subject")
	Obtained by merging subject_train and subject_test rows using rbind function
	Identifier for the subject who performed the activity in the training set and the test set
Data_combined
	Matrix with 10299 rows/entries and 563 columns
	Obtained by merging subject_merged, y_merged and X_merged columns using cbind function
	Links subject, activity labels and recorded features for the training set and the test set
Data_extracted
	Matrix with 10299 rows/entries and 88 columns
	Obtained by selecting some specific columns of Data_combined (X_merged, y_merged and mean/standard deviation columns for each measurement) using cbind, contains 	("mean") and contains ("std") functions
	Activity labels initially in y_merged were replaced by descriptive names from activity_labels$activity by matching y_merged and activity_labels$label vectors
	Columns 3 ~ 88 (mean/standard deviation for each measurement) names were renamed as below using gsub function :
		"Acc" <- "Accelerometer"
		"Gyro" <- "Gyroscope"
		"^t" <- "Time"
		"^f" <- "Frequency"
		"Mag" <- "Magnitude"
		"BodyBody" <- "Body"
		"gravity" <- "Gravity"
		"angle" <- "Angle"
		"tBody" <- "TimeBody"
	Links subject, activity descriptive names and mean/standard deviation for each measurement for the training set and the test set
Tidy_data
	Matrix with 180 rows/entries and 88 columns
	Same column names that Data_extracted
	Rows were obtained by averaging Data_extracted by Data_extracted$Subject and Data_extracted$Activity using group_by and summarize_all functions
	Each row links a specific subject and a specific activity combination to its averaged mean/standard deviation measurements

=========================================
