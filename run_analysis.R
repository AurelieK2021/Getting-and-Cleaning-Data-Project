library(dplyr) #for data analysis
library(data.table) #for data visualization using View() command

#Create the directory if not existing
if(!file.exists("./dataProject")){dir.create("./dataProject")}

#Download the files and store them
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL,destfile = "./dataProject", method = "auto", mode = "wb")

#Unzip the files
unzip("./dataProject//getdata_projectfiles_UCI HAR Dataset.zip")

#set working directory
setwd("./UCI HAR Dataset")

#check files
list.files()

#Read the data in R
activity_labels <- read.table("activity_labels.txt", col.names = c("label","activity"))
features <- read.table("features.txt", col.names = c("number","feature"))      
X_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
X_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")

#Merge the training and the test sets to create one data 
X_merged <- rbind(X_train, X_test)
colnames(X_merged) <- t(features$feature)
y_merged <- rbind(y_train, y_test)
colnames(y_merged) <- "Activity"
subject_merged <- rbind(subject_train, subject_test)
colnames(subject_merged) <- "Subject"
Data_combined <- cbind(subject_merged,y_merged,X_merged)
View(Data_combined) #Check the data obtained

#Extract only the measurements on the mean and standard deviation for each measurement
Data_extracted <- cbind (subject_merged,y_merged,select(Data_combined, contains("mean"), contains("std")))
View(Data_extracted) #Check the data obtained

#Use descriptive activity names to name the activities in the data set
for (i in 1:6) {
        for (j in 1:nrow(Data_extracted)) {
        if (Data_extracted$Activity [j] == i) {
                Data_extracted$Activity [j] <- activity_labels [i,2] 
                 }
        }
}

#Appropriately labels the data set with descriptive variable names
colnames (Data_extracted) <- gsub("Acc","Accelerometer",colnames (Data_extracted))
colnames (Data_extracted) <- gsub("Gyro","Gyroscope",colnames (Data_extracted))
colnames (Data_extracted) <- gsub("^t","Time",colnames (Data_extracted))
colnames (Data_extracted) <- gsub("^f","Frequency",colnames (Data_extracted))
colnames (Data_extracted) <- gsub("Mag","Magnitude",colnames (Data_extracted))
colnames (Data_extracted) <- gsub("BodyBody","Body",colnames (Data_extracted))
colnames (Data_extracted) <- gsub("gravity","Gravity",colnames (Data_extracted))
colnames (Data_extracted) <- gsub("angle","Angle",colnames (Data_extracted))
colnames (Data_extracted) <- gsub("tBody","TimeBody",colnames (Data_extracted))

#Create a second, independent tidy data set with the average of each variable for each activity and each subject
Tidy_data <- Data_extracted %>%
        group_by(Subject,Activity) %>%
        summarize_all(mean)
View(Tidy_data) #Check the data obtained

#Export the data set to .txt file 
write.table(Tidy_data,"Tidy_data.txt", row.names = FALSE)