fileName <- "getdata-projectfiles-UCI HAR Dataset.zip"

## First download the file and unzip
if(!file.exists(fileName)){
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(url, destfile = fileName)
}
if(!file.exists("UCI HAR Dataset")){
  unzip(fileName)
}

## import the test data set
test_data <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt")
test_subjects <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")
test_activities <- read.table(".\\UCI HAR Dataset\\test\\Y_test.txt")
## import the training set
training_data <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt")
training_subjects <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")
training_activities <- read.table(".\\UCI HAR Dataset\\train\\Y_train.txt")
## Load the activity names
activityLabels <- read.table(".\\UCI HAR Dataset\\activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])
names(activityLabels) <- c("number", "activity")
## import the feature names into a vector
features <- read.table(".\\UCI HAR Dataset\\features.txt")
features[,2] <- as.character(features[,2])
featureNames <- features[,2]
## Find all the mean and std measurements that are not meanFreq()
ExtractNames <- grepl(".*mean.*|.*std.*", featureNames) &! grepl("meanFreq", featureNames)
finalNames <- featureNames[ExtractNames]

## Rewrite the names
finalNames <- gsub("Acc","Accelerometer",finalNames)
finalNames <- gsub("Gyro", "Gyroscope", finalNames)
finalNames <- gsub("BodyBody","Body", finalNames)
finalNames <- gsub("-mean", "Mean", finalNames)
finalNames <- gsub("-std", "StDev", finalNames)
finalNames <- gsub("\\()", "", finalNames)
finalNames <- gsub("^t","time",finalNames)
finalNames <- gsub("^f", "freq", finalNames)
finalNames <- gsub("Mag", "Magnitude", finalNames)


## Attach subject data and activity to the experiment data
allTestData <- cbind(test_subjects, test_activities, test_data[,ExtractNames])
allTrainData <- cbind(training_subjects, training_activities,training_data[,ExtractNames])

## rename the column names
names(allTestData) <- c("Subject", "Activity", finalNames)
names(allTrainData) <- c("Subject", "Activity", finalNames)


## join the two data frames
mdata <- rbind(allTestData, allTrainData)
mdata <- mdata[order(mdata$Subject),]

## substitute the activity names into the data frame
for( i in 1:6){
  mdata$Activity <- gsub(i,activityLabels[,2][i], mdata$Activity)
}

## Combine into a second tiny data set and write table to a new text file "tidyData.txt"
FinalData <- aggregate(. ~Subject + Activity, mdata, mean)
write.table(FinalData, file = "tidyData.txt", row.name = FALSE)


