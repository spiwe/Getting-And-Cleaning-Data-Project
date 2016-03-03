Getting and cleaning data project
=================================

run_analysis.R script
----------------------

Execution of the run_analysis.R script:
---------------------------------------

* Data description obtained from:
* http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* Download and unzip data from ( https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).  
* Unzip the folder UCI HAR Dataset and save it in the current working directory  
* Set working directory in R Studio pointing to the folder where UCI HAR Dataset to enable run_analysis.R script to execute successfully  
* R script will execute the following:  

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement.

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive activity names.

5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

*  The final dataset output generated of cleaned data contains subject, activity and measures for features required for this assignment thus mean or standard deviation


     Variables
 ----------------------------


* Descriptive Activity Names

*   id               name
*  1  1            WALKING
*  2  2   WALKING_UPSTAIRS
*  3  3 WALKING_DOWNSTAIRS
*  4  4            SITTING
*  5  5           STANDING
*  6  6             LAYING

  Features:
-------------
* 561 features including:
*       id                                 name
* 1     1                    tBodyAcc-mean()-X
* 2     2                    tBodyAcc-mean()-Y
* 3     3                    tBodyAcc-mean()-Z
* 4     4                     tBodyAcc-std()-X
* 5     5                     tBodyAcc-std()-Y
* 6     6                     tBodyAcc-std()-Z
* 7     7                     tBodyAcc-mad()-X
* ...



     TRANSFORMATIONS
-------------------------


* read data from files downloaded:subject_train, subject_test, X_test, X_train, y_test and y_train and merged data
* merge x_data, subject_data and y_data
* used rbind and cbind to clip data together
* read features, assigned names for x_data, filtered datasets and extracted measurements on mean and standard deviation
* read activity_labels.txt data and use activity id and names respectively
* write cleaned dataset as an output file named tidy_dataset. 
* write the final results "tidy_dataset.txt" with the average of each variable for each activity and each subject respectively.

