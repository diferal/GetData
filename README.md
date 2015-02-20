# Run_analysis.R
**Run_analysis.R** creates tidy data from *“Human Activity Recognition Using Smartphones Dataset”* and process them in such a way, that averaged values for each subject and activity type are estimated (see CodeBook.md for explanation about resulting data).

**Run_analysis.R** does following steps:

1. Downloads zipped data (ProjectData.zip) from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip to subdirectory “data” in your working director. If folder “data” does not exist, it will be automatically created
2. Unzips file “ProjectData.zip” to folder “UCI HAR Dataset” in your working directory
3. Load training and testing data from “UCI HAR Dataset” together with feature names and activity labels.
4. Merges the training and the test sets to create one data set.
5. Extracts only the measurements on the mean and standard deviation for each measurement. 
6. Uses descriptive activity names to name the activities in the data set
7. Appropriately labels the data set with descriptive variable names. This leads to tidy data set “Tidy_data” in wide-tidy format
8. From the data set in step 7, creates a second, independent tidy data set “res_data” in wide-tidy format with the average of each variable for each activity and each subject.
9. Saves data set created in step 8 to file “tidy_res_dat.txt” in working directory

*Note: If folder “UCI HAR Dataset” with data already exists in working directory, first 2 step should be commented in the program*
