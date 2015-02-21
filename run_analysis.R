## downloading data and unziping it in working directory
## if one has already done this, following line of code should be commented
if (!file.exists('data')){dir.create('data')}
fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(fileUrl, destfile = './data/ProjectData.zip', method = 'curl')
unzip('./data/ProjectData.zip')

## reading features and activity labels to R
feature_names <- read.table('./UCI HAR Dataset/features.txt')
feature_names[,2] <- as.character(feature_names[,2])
activity_names <- read.table('./UCI HAR Dataset/activity_labels.txt')

## reading test data
test_data <- read.table('./UCI HAR Dataset/test/X_test.txt')
test_labels <- read.table('./UCI HAR Dataset/test/y_test.txt')
test_subject <- read.table('./UCI HAR Dataset/test/subject_test.txt')

## reading train data
train_data <- read.table('./UCI HAR Dataset/train/X_train.txt')
train_labels <- read.table('./UCI HAR Dataset/train/y_train.txt')
train_subject <- read.table('./UCI HAR Dataset/train/subject_train.txt')

## Merging the training and the test sets to create one data set (#1)
data <- rbind(train_data, test_data)
labels <- rbind(train_labels, test_labels)
subjects <- rbind(train_subject, test_subject)
names(labels) <- 'id'

## Extracting only the measurements on the mean and standard deviation for each measurement (#2)
ind <- grep("-mean\\(\\)|-std\\(\\)", feature_names[,2])
data_selected <- data[,ind]
features_selected <- feature_names[ind,2]

## Useing descriptive activity names to name the activities in the data set (#3)
for (i in 1:6) {labels$descriptive[labels$id == i] <- as.character(activity_names[i,2])}

## Appropriately labeling the data set with descriptive variable names (#4)
Tidy_data <- cbind(subjects, labels$descriptive, data_selected)
names(Tidy_data) <- c('Subject', 'Activity', features_selected)

## From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
## for each activity and each subject (#5)
library('dplyr')

res_data <- summarise_each(group_by(Tidy_data, Subject, Activity), funs(mean))
res_data <- as.data.frame(arrange(res_data, Subject, Activity))

## saving resulting data to a txt file
write.table(res_data, 'tidy_res_dat.txt', row.names = FALSE)