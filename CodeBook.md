---
title: "Code"
author: "B. Metz"
date: "February 28, 2016"
output: html_document
---
```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
# Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.



# Description of experiment


The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:

======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.

- Triaxial Angular velocity from the gyroscope. 

- A 561-feature vector with time and frequency domain variables. 

- Its activity label. 

- An identifier of the subject who carried out the experiment.


# Description of initial data

The dataset includes the following files:

=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ

tGravityAcc-XYZ

tBodyAccJerk-XYZ

tBodyGyro-XYZ

tBodyGyroJerk-XYZ

tBodyAccMag

tGravityAccMag

tBodyAccJerkMag

tBodyGyroMag

tBodyGyroJerkMag

fBodyAcc-XYZ

fBodyAccJerk-XYZ

fBodyGyro-XYZ

fBodyAccMag

fBodyAccJerkMag

fBodyGyroMag

fBodyGyroJerkMag


####The set of variables that were estimated from these signals are: 

mean(): Mean value

std(): Standard deviation

mad(): Median absolute deviation 

max(): Largest value in array

min(): Smallest value in array

sma(): Signal magnitude area

energy(): Energy measure. Sum of the squares divided by the 
number of values. 

iqr(): Interquartile range 

entropy(): Signal entropy

arCoeff(): Autorregresion coefficients with Burg order 
equal to 4

correlation(): correlation coefficient between two signals

maxInds(): index of the frequency component with largest magnitude

meanFreq(): Weighted average of the frequency components to obtain a mean frequency

skewness(): skewness of the frequency domain signal 

kurtosis(): kurtosis of the frequency domain signal 

bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.

angle(): Angle between to vectors.




####Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean

tBodyAccMean

tBodyAccJerkMean

tBodyGyroMean

tBodyGyroJerkMean

# Script Process:
### Download and Unzip Data
```{r}
fileName <- "getdata-projectfiles-UCI HAR Dataset.zip"

## First download the file and unzip
if(!file.exists(fileName)){
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(url, destfile = fileName)
}
if(!file.exists("UCI HAR Dataset")){
  unzip(fileName)
}
```
### List of files used:
- activity_labels.txt
- features.txt
- /test/X_test.txt
- /test/Y_test.txt
- /test/subject_test.txt
- /train/X_train.txt
- /train/Y_train.txt
- /train/subject_train.txt

features.txt contains all the names of all the variables in the data set.  Activity_labels.txt is used to link the class labels with their corresponding activity name.

### Import Data
```{r, tidy}
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
```

### Activity labels:
- WALKING: Subject was walking during the test

- WALKING_UPSTAIRS: Subject was walking up a staircase during the test.

- WALKING_DOWNSTAIRS: Subject was walking down a staircase during the test.

- SITTING: Subject was sitting during the test.

- STANDING: Subject was standing during the test.

- LAYING: Subject was lying down during the test.

###Variable Names in tidyData.txt:

"Subject"

"Activity"

"timeBodyAccelerometerMean-X" 

"timeBodyAccelerometerMean-Y" 

"timeBodyAccelerometerMean-Z" 

"timeBodyAccelerometerStDev-X" 

"timeBodyAccelerometerStDev-Y" 

"timeBodyAccelerometerStDev-Z" 

"timeGravityAccelerometerMean-X" 

"timeGravityAccelerometerMean-Y" 

"timeGravityAccelerometerMean-Z" 

"timeGravityAccelerometerStDev-X" 

"timeGravityAccelerometerStDev-Y" 

"timeGravityAccelerometerStDev-Z" 

"timeBodyAccelerometerJerkMean-X" 

"timeBodyAccelerometerJerkMean-Y" 

"timeBodyAccelerometerJerkMean-Z" 

"timeBodyAccelerometerJerkStDev-X" 

"timeBodyAccelerometerJerkStDev-Y" 

"timeBodyAccelerometerJerkStDev-Z" 

"timeBodyGyroscopeMean-X" 

"timeBodyGyroscopeMean-Y" 

"timeBodyGyroscopeMean-Z" 

"timeBodyGyroscopeStDev-X" 

"timeBodyGyroscopeStDev-Y" 

"timeBodyGyroscopeStDev-Z" 

"timeBodyGyroscopeJerkMean-X" 

"timeBodyGyroscopeJerkMean-Y" 

"timeBodyGyroscopeJerkMean-Z" 

"timeBodyGyroscopeJerkStDev-X" 

"timeBodyGyroscopeJerkStDev-Y" 

"timeBodyGyroscopeJerkStDev-Z" 

"timeBodyAccelerometerMagnitudeMean" 

"timeBodyAccelerometerMagnitudeStDev" 

"timeGravityAccelerometerMagnitudeMean" 

"timeGravityAccelerometerMagnitudeStDev" 

"timeBodyAccelerometerJerkMagnitudeMean" 

"timeBodyAccelerometerJerkMagnitudeStDev" 

"timeBodyGyroscopeMagnitudeMean" 

"timeBodyGyroscopeMagnitudeStDev" 

"timeBodyGyroscopeJerkMagnitudeMean" 

"timeBodyGyroscopeJerkMagnitudeStDev" 

"freqBodyAccelerometerMean-X" 

"freqBodyAccelerometerMean-Y" 

"freqBodyAccelerometerMean-Z" 

"freqBodyAccelerometerStDev-X" 

"freqBodyAccelerometerStDev-Y" 

"freqBodyAccelerometerStDev-Z" 

"freqBodyAccelerometerJerkMean-X" 

"freqBodyAccelerometerJerkMean-Y" 

"freqBodyAccelerometerJerkMean-Z" 

"freqBodyAccelerometerJerkStDev-X" 

"freqBodyAccelerometerJerkStDev-Y" 

"freqBodyAccelerometerJerkStDev-Z" 

"freqBodyGyroscopeMean-X" 

"freqBodyGyroscopeMean-Y" 

"freqBodyGyroscopeMean-Z" 

"freqBodyGyroscopeStDev-X" 

"freqBodyGyroscopeStDev-Y" 

"freqBodyGyroscopeStDev-Z" 

"freqBodyAccelerometerMagnitudeMean" 

"freqBodyAccelerometerMagnitudeStDev" 

"freqBodyAccelerometerJerkMagnitudeMean" 

"freqBodyAccelerometerJerkMagnitudeStDev" 

"freqBodyGyroscopeMagnitudeMean" 

"freqBodyGyroscopeMagnitudeStDev" 

"freqBodyGyroscopeJerkMagnitudeMean" 

"freqBodyGyroscopeJerkMagnitudeStDev"

### Rewrite names
```{r}
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
```

### Merge Data 
```{r}
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
```

### Create tidy data set and print to file
```{r}
## Combine into a second tiny data set and write table to a new text file "tidyData.txt"
FinalData <- aggregate(. ~Subject + Activity, mdata, mean)
write.table(FinalData, file = "tidyData.txt", row.name = FALSE)
```