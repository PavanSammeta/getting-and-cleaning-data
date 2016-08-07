# Function to read data from files and merge data
MergeDataSets <- function()
{
  # Load data from files
      
      # Load training set ('train/X_train.txt': Training set)
      TrainingSet <- read.table("train/X_train.txt", header = FALSE)    
      
      # Load training set activities
      TrainingSetActivity <- read.table("train/Y_train.txt", header = FALSE)    
      
      # Load training set subjects
      TrainingSubjects <- read.table("train/subject_train.txt", header = FALSE)
      
      # Load test set
      TestSet <- read.table("test/X_test.txt", header = FALSE)    
      
      #Load test set activities
      TestSetActivity <- read.table("test/Y_test.txt", header = FALSE)    
    
      #Load test subjects
      TestSubjects <- read.table("test/subject_test.txt", header = FALSE)
      
      
  # merge respective sets
      
      # merge the training and test sets and store in "FeaturesSet"
      FeaturesSet <- rbind(TrainingSet,TestSet)
      
      # merge the training and test activity and store in "Activities"
      Activities <- rbind(TrainingSetActivity,TestSetActivity)
      
      # merge the training and test subjects and store in "Subjects"
      Subjects <- rbind(TrainingSubjects ,TestSubjects)
      
      # Load features
      FeaturesList <- read.table("features.txt")    
      
      # Apply column names to FeatureSet taking from FeaturesList
      colnames(FeaturesSet) <- t(FeaturesList[2])
      
      # Apply column name for ActivityLabels
      colnames(Activities) <- "Activity"
      
      #Apply column name for subjects
      colnames(Subjects) <- "Subject"
      
  # Create a complete data set
      FinalData <- cbind(Activities,Subjects,FeaturesSet)
  
      # return dataset
      FinalData
}

# Function to provide descriptive names for activities of the data set.
PrepareDesciptiveActivityNames <- function(Data)
{
  ActivityDescription <- read.table("activity_labels.txt")    
  
  Data$Activity <- as.character(Data$Activity)
  for(i in 1:6)
    Data$Activity[Data$Activity == i] <- as.character(ActivityDescription[i,2])
  
  Data$Activity <- as.factor(Data$Activity)
  
  #return dataset
  Data
}

# Function to provide descriptive names for columns of the data set.
GetDescriptiveColumnNames <- function(Data)
{
  # Replace column names that start with "t" by "Time"
  names(Data) <- gsub("^t", "Time", names(Data))
  
  # Replace column names that start with "f" by "Frequency"
  names(Data) <- gsub("^f", "Frequency", names(Data))
  
  # Replace column names that contain with "Acc" by "Accelerometer"
  names(Data) <- gsub("Acc", "Accelerometer", names(Data))
  
  # Replace column names that contain with "Gyro" by "Gyroscope"
  names(Data) <- gsub("Gyro", "Gyroscope", names(Data))
  
  # Replace column names that contains with "mean()" by "Mean"
  names(Data) <- gsub("mean()", "Mean", names(Data))
  
  # Replace column names that contains with "std()" by "StandardDeviation"
  names(Data) <- gsub("std()", "StandardDeviation", names(Data))
  
  # Replace column names that contains with "mad()" by "MedianAbsoluteDeviation"
  names(Data) <- gsub("mad()", "MedianAbsoluteDeviation", names(Data))
  
  # Replace column names that contains with "max()" by "Largest"
  names(Data) <- gsub("max()", "Largest", names(Data))
  
  # Replace column names that contains with "min()" by "Smallest"
  names(Data) <- gsub("min()", "Smallest", names(Data))
  
  # Replace column names that contains with "mag()" by "Magnitude"
  names(Data) <- gsub("Mag", "Magnitude", names(Data))
  
  # Replace column names that contains with "BodyBOdy" by "Body"
  names(Data) <- gsub("BodyBody", "Body", names(Data))
  
  # Replace column names that contains with "freq()" by "Frequency"
  names(Data) <- gsub("-freq()", "Frequency", names(Data), ignore.case = TRUE)
  
  # return dataset  
  Data
}

# Function to prepare tidy data set.
PrepareTidyData <- function(Data)
{
  Data$Subject <- as.factor(Data$Subject)
  TidyData <- aggregate(. ~Subject + Activity, Data, mean)
  TidyData <- TidyData[order(TidyData$Subject,TidyData$Activity),]
  
  # return dataset  
  TidyData
}

# Main function to read the raw data, clean and provide tidy data.
ProcessData <-function()
{
   #Step1: Merge the training and the test sets to create one data set.  
   CompleteMergedData <- MergeDataSets()
  
   # Step2: Extract only the measurements on the mean and standard deviation for each measurement.
   DataWithRequiredColumns <- CompleteMergedData[,c(1,2,grep("mean()|std()", names(CompleteMergedData)))]
   
   #Step3 : Use descriptive activity names to name the activities in the data set
   DataWithDesciptiveActivityNames <- PrepareDesciptiveActivityNames(DataWithRequiredColumns)
   
   #Step4 : Appropriately label the data set with descriptive variable names.
   DataWithDescriptiveColumnNames <- GetDescriptiveColumnNames(DataWithDesciptiveActivityNames)
   
   #Step5: From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
   TidyData <- PrepareTidyData(DataWithDescriptiveColumnNames)
   
   #Final Step : Store the data in "Tidy.txt"
   write.table(TidyData, file = "Tidy.txt", row.names = FALSE) 
}