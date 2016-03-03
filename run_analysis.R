+#'run_analysis.R' script executes steps below:
+#Merges the training and the test sets to create one data set.
+#Extracts only the measurements on the mean and standard deviation for each measurement.
+#Uses descriptive activity names to name the activities in the data set
+#Appropriately labels the data set with descriptive variable names.
+#Finally creates a second independent tidy data set with the average of each variable for each activity and each subject.
####################################################################################################################
+
+# 1.) Merges the training and the test sets to create one data set.
+setwd("C:\\Users\\SPIWE\\Desktop\\R_programming\\UCI HAR Dataset")
+make_subject_dataset <- function() {
 + subject_test <- read.table("C:\\Users\\SPIWE\\Desktop\\R_programming\\UCI HAR Dataset\\test\\subject_test.txt")
 +subject_train <- read.table("C:\\Users\\SPIWE\\Desktop\\R_programming\\UCI HAR Dataset\\train\\subject_train.txt")
 + subject_merged <- rbind(subject_train, subject_test)
 + names(subject_merged) <- "subject"
+  subject_merged
+}
+
+make_X_dataset <- function() {
+  X_test <- read.table("C:\\Users\\SPIWE\\Desktop\\R_programming\\UCI HAR Dataset\\test\\X_test.txt")
+  X_train <- read.table("C:\\Users\\SPIWE\\Desktop\\R_programming\\UCI HAR Dataset\\train\\X_train.txt")
+  X_merged  <- rbind(X_train, X_test)
+}
+
+make_y_dataset <- function() {
+ y_test <- read.table("C:\\Users\\SPIWE\\Desktop\\R_programming\\UCI HAR Dataset\\test\\y_test.txt")
 + y_train <- read.table("C:\\Users\\SPIWE\\Desktop\\R_programming\\UCI HAR Dataset\\train\\y_train.txt")
 + y_merged  <- rbind(y_train, y_test)
+}
+
+subject_dataset <- make_subject_dataset()
+X_dataset <- make_X_dataset()
+y_dataset <- make_y_dataset()
+
+# 2.) Extracts only the measurements on the mean and standard deviation for each measurement. 
+
+get_selected_measurements <- function() {
+  features <- read.table("C:\\Users\\SPIWE\\Desktop\\R_programming\\UCI HAR Dataset\\features.txt", header=FALSE, col.names=c('id', 'name'))
+  feature_selected_columns <- grep('mean\\(\\)|std\\(\\)', features$name)
+  filtered_dataset <- X_dataset[, feature_selected_columns]
+  names(filtered_dataset) <- features[features$id %in% feature_selected_columns, 2]
 + filtered_dataset
+}
+
+X_filtered_dataset <- get_selected_measurements()
+
+# 3.) Uses descriptive activity names to name the activities in the data set
+
+activity_labels <- read.table("C:\\Users\\SPIWE\\Desktop\\R_programming\\UCI HAR Dataset\\activity_labels.txt", header=FALSE, col.names=c('id', 'name'))
+
+# 4.) Appropriately labels the data set with descriptive activity names. 
+
+y_dataset[, 1] = activity_labels[y_dataset[, 1], 2]
+names(y_dataset) <- "activity"
+
+# 5. Independent tidy data set with the average of each variable for each activity and each subject.
+
+detailed_dataset <- cbind(subject_dataset, y_dataset, X_filtered_dataset)
+write.csv(detailed_dataset, "C:\\Users\\SPIWE\\Desktop\\R_programming\\UCI HAR Dataset\\output\\detailed_dataset.csv")
+measurements <- detailed_dataset[, 3:dim(detailed_dataset)[2]]
+tidy_dataset <- aggregate(measurements, list(detailed_dataset$subject, detailed_dataset$activity), mean)
+names(tidy_dataset)[1:2] <- c('subject', 'activity')
+write.csv(tidy_dataset, "C:\\Users\\SPIWE\\Desktop\\R_programming\\UCI HAR Dataset\\results\\tidy_dataset.csv")
+write.table(tidy_dataset, "C:\\Users\\SPIWE\\Desktop\\R_programming\\UCI HAR Dataset\\results\\tidy_dataset.txt" ,sep=" ",row.name=FALSE)