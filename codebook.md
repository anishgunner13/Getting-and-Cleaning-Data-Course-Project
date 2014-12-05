Code Book for Getting and Cleaning Data Course Project

This code book that describes the variables, the data, and any transformations or work that you performed to clean up the data

Step 1: "Merges the training and the test sets to create one data set."

Step 2: "Extracts only the measurements on the mean and standard deviation for each measurement."

Step 3: "Uses descriptive activity names to name the activities in the data set."

Step 4: "Appropriately labels the data set with descriptive activity names." 

Step 5: "Creates a second, independent tidy data set with the average of each variable for each activity and each subject."

Source Data 
A full description of the data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 

 
[The source data for this project can be found here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 


Raw data set

Totally, the raw data set contains 68 variables:
•  subject  - An identifier of the subject who carried out the experiment.
•  label  - An activity label.

Plus 66 filtered features mined as described below.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:
 -XYZ  is used to denote 3-axial signals in the X, Y and Z directions.
• tBodyAcc-XYZ 
• tGravityAcc-XYZ 
• tBodyAccJerk-XYZ 
• tBodyGyro-XYZ 
• tBodyGyroJerk-XYZ 
• tBodyAccMag 
• tGravityAccMag 
• tBodyAccJerkMag 
• tBodyGyroMag 
• tBodyGyroJerkMag 
• fBodyAcc-XYZ 
• fBodyAccJerk-XYZ 
• fBodyGyro-XYZ 
• fBodyAccMag 
• fBodyAccJerkMag 
• fBodyGyroMag 
• fBodyGyroJerkMag 

The set of variables that were estimated from these signals are: 
•  mean() : Mean value
•  std() : Standard deviation



Tidy data set
Tidy data set contains the same variables as the raw does, but the variables were renamed according to following rules:
•  All lower case when possible  - the variables names were not converted to lower case, since it would make them unreadable. Instead, the variable names were converted to satisfy  camlCase  rule.
•  Descriptive (Diagnosis versus Dx)  - the variable names are descriptive, so nothing special should be done.
•  Not duplicated  - the variable names are unique, so again nothing special had to be done.
•  Not have underscores or dots or white spaces  - dashes and parentheses were removed from variable names.

To satisfy the requirements above, the following replacements were performed:
1.Replace  -mean  with  Mean  
2.Replace  -std  with  Std  
3.Remove characters  -()  
4.Replace  BodyBody  with  Body  



Variables in tidy data set

 [1] "activityId"                      "subjectId"                      
 [3] "timeBodyAccMagnitudeMean"        "timeBodyAccMagnitudeStdDev"     
 [5] "timeGravityAccMagnitudeMean"     "timeGravityAccMagnitudeStdDev"  
 [7] "timeBodyAccJerkMagnitudeMean"    "timeBodyAccJerkMagnitudeStdDev" 
 [9] "timeBodyGyroMagnitudeMean"       "timeBodyGyroMagnitudeStdDev"    
[11] "timeBodyGyroJerkMagnitudeMean"   "timeBodyGyroJerkMagnitudeStdDev"
[13] "freqBodyAccMagnitudeMean"        "freqBodyAccMagnitudeStdDev"     
[15] "freqBodyAccJerkMagnitudeMean"    "freqBodyAccJerkMagnitudeStdDev" 
[17] "freqBodyGyroMagnitudeMean"       "freqBodyGyroMagnitudeStdDev"    
[19] "freqBodyGyroJerkMagnitudeMean"   "freqBodyGyroJerkMagnitudeStdDev"
[21] "activityType"   
