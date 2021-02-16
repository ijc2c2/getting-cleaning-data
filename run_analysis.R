
x_test <- read.table("X_test.txt")
y_test <- read.table("Y_test.txt")
s_test <- read.table("subject_test.txt")

x_train <- read.table("X_train.txt")
y_train <- read.table("Y_train.txt")
s_train <- read.table("subject_train.txt")

features <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")

colnames(x_test)<- features[,2]
colnames(x_train) <- features[,2]

colnames(y_test) <- "Activity"
colnames(y_train) <- "Activity"

colnames(s_train) <- "Subject"
colnames(s_test) <- "Subject"

colnames(activity_labels) = c("Activity", "Type")

train_merge <- cbind(x_train, y_train, s_train)
test_merge <- cbind(x_test, y_test, s_test)

all_merge <- rbind(train_merge, test_merge)

only_mean_sd <- select(all_merge, Subject, Activity, grep("-(mean|std).*", colnames(all_merge)))

with_labels <- merge(only_mean_sd, activity_labels, by="Activity", all.x=TRUE)

tidy_data_set <- aggregate(. ~ Subject + Type, with_labels, mean)
tidy_data_set <- tidy_data_set[(order(tidy_data_set$Subject, tidy_data_set$Activity)),]
write.table(tidy_data_set, "tidy_data_set.txt", row.name = FALSE)
