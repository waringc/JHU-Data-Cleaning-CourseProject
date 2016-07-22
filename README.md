## Coursera- JHU Getting and Cleaning Data Course Project

This is the final course project for the Johns Hopkins Getting and Cleaning data course found here: https://www.coursera.org/learn/data-cleaning

The project instructions are as follows:

>One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

>http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

>Here are the data for the project:

>https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

>You should create one R script called run_analysis.R that does the following.

>1.	Merges the training and the test sets to create one data set.

>2. Extracts only the measurements on the mean and standard deviation for each measurement.

>3.	Uses descriptive activity names to name the activities in the data set

>4.	Appropriately labels the data set with descriptive variable names.

>5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Repo Contents

The files contained in this repo are as follows:

* **"/UCI Har Dataset"** -Contains the original uncleaned dataset files

* **"README.md"** -This readme file outlining the repo background

* **"CodeBook.md"** -Describes the variables, the data and transformations performed on the data set.

* **"run_analysis.R"** - The R script for cleaning the data

* **"tidyHAR.txt"**- The cleaned dataset per instructions 1-4 of the assignment

* **"tidySecondaryHAR.txt"**- The second independent tidy dataset per instruction 5 of the assignment.

A useful reference for the assignment is [Hadley Wickhams Tidy Data paper](http://vita.had.co.nz/papers/tidy-data.pdf)
