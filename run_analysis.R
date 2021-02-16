## Preliminary work: Download zip file and place relevant text files in working directory
## 
## At the time of commit, the URL used was
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Step 1: Read in relevant text files

x_test <- read.table("X_test.txt")
y_test <- read.table("Y_test.txt")
s_test <- read.table("subject_test.txt")

x_train <- read.table("X_train.txt")
y_train <- read.table("Y_train.txt")
s_train <- read.table("subject_train.txt")

features <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")

## Requirement 4: Appropriately label the data set with descriptive variable names.

colnames(x_test)<- features[,2]
colnames(x_train) <- features[,2]

colnames(y_test) <- "Activity"
colnames(y_train) <- "Activity"

colnames(s_train) <- "Subject"
colnames(s_test) <- "Subject"

colnames(activity_labels) = c("Activity", "Type")

## Requirement 1:  Merge training and test data to create one data set.

train_merge <- cbind(x_train, y_train, s_train)
test_merge <- cbind(x_test, y_test, s_test)


all_merge <- rbind(train_merge, test_merge)

## Requirement 2: Extract only the measurements on the mean and standard deviation for each measurement

only_mean_sd <- select(all_merge, Subject, Activity, grep("-(mean|std).*", colnames(all_merge)))

## Requirement 3: Use descriptive activity names to name the activities in the data set.

with_labels <- merge(only_mean_sd, activity_labels, by="Activity", all.x=TRUE)

## Requirement 5: Create a second, independent, tidy data set with the average of each variable for each activity and each subject.
tidy_data_set <- aggregate(. ~ Subject + Type, with_labels, mean)
tidy_data_set <- tidy_data_set[(order(tidy_data_set$Subject, tidy_data_set$Activity)),]

## Write the tidy data set to a text file.
write.table(tidy_data_set, "tidy_data_set.txt", row.name = FALSE)
