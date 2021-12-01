**Read me**

=========================================

This repository is a submission for Peer-graded Assignment: Getting and Cleaning Data Course Project, done on December 1, 2021.
It is composed of below files :

- **"run_analysis.R"**\
This is the script written to collect and clean the raw data set. Below is a rough description of the steps involved :
1. Download the data folder, store it in a created folder and unzip it to access the raw data files
2. Read the raw data files in R and create associated variables
3. Merge the training and test data sets and create a data matrix linking subject, activity performed and the recorded features
4. Subset from the data matrix created in 3. following columns : subject, activity performed and mean/standard deviation for each measurements
5. Assign descriptive names for activities in the data matrix created in 4.
6. Assign descriptive variable names in the data matrix created in 5.
7. Create a tidy data set with the average of each variable for each activity and each subject. Export it in .txt format

- **"Tidy_data.txt"**\
The output from "run_analysis.R" script, which is a tidy data set containing the average of each variable for each activity and each subject.

- **"CodeBook.md"**\
A code book that describes the variables, the data, and any transformations or work that was performed to clean up the data.
