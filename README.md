# Getting and cleaning data

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Files in this repo
* README.md -- This file.
* CodeBook.md -- Codebook describing variables, the data and transformations
* run_analysis.R -- R script to process raw data into tidy data

## run_analysis.R goals
You should create one R script called run_analysis.R that does the following:
* Step1: Merges the training and the test sets to create one data set. 
  * This step is performed with the help of function "MergeDataSets" 
  * This function reads data from files and merge data
* Step2: Extracts only the measurements on the mean and standard deviation for each measurement.
  * This step extracts required columns that contain mean() and std() in their column names. 
  * This step also adds "Subject" and "Activity" columns to the above formed data set.  
* Step3: Uses descriptive activity names to name the activities in the data set
  * This step is performed with the help of function "PrepareDesciptiveActivityNames". 
  * This function provides descriptive names for activities of the data set.
* Step4: Appropriately labels the data set with descriptive variable names.
  * This step is performed with the help of function "GetDescriptiveColumnNames". 
  * This function provides descriptive names for columns of the data set.
    * Replaces column names that start with "t" by "Time"
    * Replaces column names that start with "f" by "Frequency"
    * Replaces column names that contain with "Acc" by "Accelerometer"
    * Replaces column names that contain with "Gyro" by "Gyroscope"
    * Replaces column names that contains with "mean()" by "Mean"
    * Replaces column names that contains with "std()" by "StandardDeviation"
    * Replaces column names that conatins with "mad()" by "MedianAbsoluteDeviation"
    * Replaces column names that contains with "max()" by "Largest"
    * Replaces column names that contains with "min()" by "Smallest"
    * Replaces column names that contains with "mag()" by "Magnitude"
    * Replaces column names that contains with "BodyBOdy" by "Body"
    * Replaces column names that contains with "freq()" by "Frequency" 
* Step5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* Step6: Stores the tidy data in "Tidy.txt"

## How to use the script
1. Download data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Unzip and from r consloe set working directory to "UCI HAR Dataset" folder.
3. Copy run_analysis.R to this folder: "UCI HAR Dataset"
4. The script assumes it has in it's working directory the following files and folders:
* activity_labels.txt
* features.txt
* test/
* train/

The output is created in working directory with the name of tidy.txt
