#Load necessary packages
library(dplyr)
library(data.table)
library(tidyr)

#Path of the downloaded files.
file_path <- "E:\\Amirs Study Stuffs\\Data Science Certification\\R_Prog\\data_cleaning\\UCI HAR Dataset"

#Load data files
data_test_X <- read.table(file.path(file_path, "test", "X_test.txt"))
data_train_X <- read.table(file.path(file_path, "train", "X_train.txt"))

#Load activity files
data_test_Y <- read.table(file.path(file_path, "test", "Y_test.txt"))
data_train_Y <- read.table(file.path(file_path, "train", "Y_train.txt"))

#Load subject files
data_test_subject <- read.table(file.path(file_path, "test", "subject_test.txt"))
data_train_subject <- read.table(file.path(file_path, "train", "subject_train.txt"))

#1. Merging the training and the test sets to create one data set.
#One data set for X
data_all_X <- rbind(data_train_X, data_test_X)

#One data set for Y
data_all_Y <- rbind(data_train_Y, data_test_Y)

#One data set for Subject
data_all_subject <- rbind(data_train_subject, data_test_subject)

#2. Extract only the measurements on the mean and standard deviation for each measurement.
#Load features.txt file
data_features <- read.table(file.path(file_path, "features.txt"))

#Get list of mean and std columns
mean_std <- grep("-(mean|std)\\(\\)", data_features[, 2])

#Subset the mean and std columns
data_all_X <- data_all_X[, mean_std]

#Set column names
names(data_all_X) <- data_features[mean_std, 2]

#3. Use descriptive activity names to name the activities in the data set
#Load activity_labels.txt file
data_activities <- read.table(file.path(file_path, "activity_labels.txt"))

#Update correct activity name
data_all_Y[, 1] <- data_activities[data_all_Y[, 1], 2]

names(data_all_Y) <- "activity"

#4. Appropriately label the data set with descriptive variable names
# correct column name
names(data_all_subject) <- "subject"

# bind all the data in a single data set
all_data <- cbind(data_all_X, data_all_Y, data_all_subject)

#Update label of the data
names(all_data)<-gsub("std()", "SD", names(all_data))
names(all_data)<-gsub("mean()", "MEAN", names(all_data))
names(all_data)<-gsub("^t", "time", names(all_data))
names(all_data)<-gsub("^f", "frequency", names(all_data))
names(all_data)<-gsub("Acc", "Accelerometer", names(all_data))
names(all_data)<-gsub("Gyro", "Gyroscope", names(all_data))
names(all_data)<-gsub("Mag", "Magnitude", names(all_data))
names(all_data)<-gsub("BodyBody", "Body", names(all_data))

#5. Create a second, independent tidy data set with the average of each variable for each activity and each subject
avg <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

#Create tidy data set
write.table(avg, "tidy_data.txt", row.name=FALSE)