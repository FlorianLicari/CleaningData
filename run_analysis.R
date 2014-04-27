source("unzip.R")

#Combining training set and test set
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", sep ="")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", sep ="")
table <- rbind(X_train, X_test)
rm("X_train", "X_test")

#Loading feature to extract only the measurements on the mean and standard 
#deviation for each measurement. 
features <- read.table("./UCI HAR Dataset/features.txt", sep ="")
features <- as.character(features[,2])
mean <- grep("mean()", features, fixed = TRUE)
std <- grep("std()", features, fixed = TRUE)
extract <- table[c(mean, std)]


#Add Subject , Activty_Code and Activity at the begining of the data set
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", sep ="")
subject_test<- read.table("./UCI HAR Dataset/test/subject_test.txt", sep ="")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", sep ="")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", sep ="")
subject <- rbind(subject_train, subject_test)
activity_code <- rbind(y_train, y_test)
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", sep ="")
activity_labels <- as.character(activity_labels[,2])
activity_name <- activity_labels[unlist(activity_code)]
tidydata <- cbind(subject, activity_code, activity_name, extract)
rm("y_train", "subject_train", "y_test", "subject_test", 
   "subject", "activity_code", "activity_labels", "activity_name", "extract")

#Appropriately labels the data set with descriptive activity names.
names(tidydata) <- c("Subject","Activity_Code", "Activity", 
                     features[c(mean, std)])
write.table(tidydata, file="./tidydata.txt", sep="\t", row.names=FALSE)

#Creates a second, independent tidy data set with the average of each 
#variable for each activity and each subject. 
library("reshape2")
tableMelt <- melt(tidydata, id = c("Subject", "Activity"), measure.vars = 
                          c(features[mean], features[std]))
#Have to use "function(x) mean(x)" syntax because there is already an object
#called mean
summary <- dcast(tableMelt, Subject + Activity ~ variable, function(x) mean(x))
#Export
write.table(summary, file="./summary.txt", sep="\t", row.names=FALSE)

#Delete all "unnecessary" data 
rm("tableMelt", "features", "mean", "std")