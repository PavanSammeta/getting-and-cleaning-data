Code Book
========

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

he experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
===============================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.
The set of variables that were estimated from these signals are: 

Data transformation
-------------------

The raw data sets are processed using run_analisys.R script to create a tidy data
set.

### Merge training and test sets

Training and test data from following files are merged to obtain a single data set.
  * X_train.txt
  * X_test.txt
  * subject_train.txt
  * subject_test.txt
  * y_train.txt
  * y_test.txt 

### Extract mean and standard deviation variables

From the merged data set an intermediate data set is obtained with only the
values of estimated mean (variables with labels that contain "mean()") and standard
deviation (variables with labels that contain "std()").

### Use descriptive activity names

Activity code is replaced with a more descriptive activity label taken from activity_labels.txt.

### Label variables appropriately

Labels given from the original collectors were changed:
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

### Create a tidy data set

From the intermediate data set independent tidy data set with the average of each variable for each activity and each subject is created. 
Stores the tidy data in Tidy.txt in working directory.

To read the data form Tidy.txt, use the following commands
* data <- read.table("Tidy.txt", header = TRUE)
* View(data)
