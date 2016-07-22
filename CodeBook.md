## Coursera- JHU Getting and Cleaning Data Course Project

## UCI HAR dataset Codebook
This document is the codebook for the tidy UCI HAR dataset and a second independent dataset derived from the UCI HAR dataset. It describes the variables, the data and transformations performed on the data set.

## UCI HAR Data

Per the data set readme.txt the data was collected by:

>"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz."

For more information refer to the readme of the dataset found  [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Tidy UCI HAR dataset- tidyHAR.txt

### Data and Variables
The follow variables are contained in the tidy UCI HAR Dataset:

* **subjectid**- The ID number of the subject from which the measurement was collected.  It is numbered 1-30.

* **activitylabel**- The activity the subject was performing while the data was collected.  One of six categories: "LAYING", "SITTING", "STANDING", "WALKING", "WALKING_DOWNSTAIRS", "WALKING_UPSTAIRS".

Variables for the following physical measurements are included in the tidy dataset. -"XYZ" is used to denote variables with measurements for each axis:

* **tBodyAcc-XYZ**
* **tGravityAcc-XYZ**
* **tBodyAccJerk-XYZ**
* **tBodyGyro-XYZ**
* **tBodyGyroJerk-XYZ**
* **tBodyAccMag**
* **tGravityAccMag**
* **tBodyAccJerkMag**
* **tBodyGyroMag**
* **tBodyGyroJerkMag**
* **fBodyAcc-XYZ**
* **fBodyAccJerk-XYZ**
* **fBodyGyro-XYZ**
* **fBodyAccMag**
* **fBodyAccJerkMag**
* **fBodyGyroMag**
* **fBodyGyroJerkMag**

For each of the  physical measurements the mean and standard deviation is reported in a separate variable.  The variable naming format is **"variablename-variabletype-axis"**.  For instance the variable **"tBodyAcc-Mean()-X"** in the dataset represents the mean measurement of body acceleration along the X-axis.  If the measurement is non-axial the axis component of the name is dropped.  For instance **"tBodyGyroJerkMag-std()"**. There are a total of 66 physical variables.

Per the "/UCI HAR dataset/features_info.txt" file provided by with the data set the physical representation of these variables is as follows:

> "The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals)""

### Transformations Applied to Obtain Tidy
The following transformations were applied to produce the tidy dataset:

1.  A regex was applied to match the terms **mean()** and **std()** in feature names to select features representing the mean and standard deviations of values.

2. The selected features from step 1 of the training and test sets were merged into a single data set.

3.  The numbered activity labels (1-6) were replaced with descriptive labels describing the activity ("LAYING", "SITTING", "STANDING", "WALKING", "WALKING_DOWNSTAIRS", "WALKING_UPSTAIRS").


## Tidy UCI HAR derived independent dataset - tidySecondaryHar.txt

A secondary dataset was derived from the first tidy dataset about.  This dataset comprises of the mean of each physical measurement variable from the tidy dataset for each subject and each activity.

### Data and Variables

The follow variables are contained in the tidy UCI HAR derived independent Dataset:

* **subjectId-Or-ActivityLabel** The ID number of the subject from which the measurement was collected numbered 1 to 30.  Or 1 of the 6 activities in the data set ("LAYING", "SITTING", "STANDING", "WALKING", "WALKING_DOWNSTAIRS", "WALKING_UPSTAIRS").

The mean of each of the physical measurement variables from the first tidy dataset for each subject and activity is contained in the dataset. For more information about the background of each variable refer to the variable information for the first dataset.  There are a total of 66 physical variables. The variables in this second data set are:

* **Mean-tBodyAcc-XYZ**
* **Mean-tGravityAcc-XYZ**
* **Mean-tBodyAccJerk-XYZ**
* **Mean-tBodyGyro-XYZ**
* **Mean-tBodyGyroJerk-XYZ**
* **Mean-tBodyAccMag**
* **Mean-tGravityAccMag**
* **Mean-tBodyAccJerkMag**
* **Mean-tBodyGyroMag**
* **Mean-tBodyGyroJerkMag**
* **Mean-fBodyAcc-XYZ**
* **Mean-fBodyAccJerk-XYZ**
* **Mean-fBodyGyro-XYZ**
* **Mean-fBodyAccMag**
* **Mean-fBodyAccJerkMag**
* **Mean-fBodyGyroMag**
* **Mean-fBodyGyroJerkMag**

### Transformations Applied to obtain second dataset

1.  The mean of each of the 67 physical variables in the original tidy dataset was calculated for each subject and activity.

2. The variable means for each subject and activity were merged into a single dataset.
