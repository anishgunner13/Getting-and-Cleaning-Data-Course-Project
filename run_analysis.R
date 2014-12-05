## run_analysis.R
# This script will perform the following steps on the UCI HAR Dataset downloaded from  
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
# 1. Merge the training and the test sets to create one data set. 
# 2. Extract only the measurements on the mean and standard deviation for each measurement.  
# 3. Use descriptive activity names to name the activities in the data set 
# 4. Appropriately label the data set with descriptive activity names.  
# 5. Creates a second, independent tidy data set with the average of each variable for each 
#    activity and each subject.  
#############################################################################################
## Library needed
library(base) 
library(utils) 
library(data.table)

## Download and extract the content of the file with data 
temp <- tempfile() 
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp) 
unzip(temp,exdir="c:\\Users\\anishgunner13\\Getting-and-Cleaning-Data-Course-Project") 
unlink(temp) 

## Read data 
setwd("c:\\Users\\anishgunner13\\Getting-and-Cleaning-Data-Course-Project\\UCI HAR Dataset") 
dir()

# Get the features
features <- read.table('features.txt',header=FALSE); 

# Get the labels
activityType <- read.table('activity_labels.txt',header=FALSE); 

# Read train data
setwd("train") 
subjectTrain <- read.table('subject_train.txt',header=FALSE);
xTrain <- read.table('x_train.txt',header=FALSE);
yTrain <- read.table('y_train.txt',header=FALSE);

# Read test data
setwd("../test/") 
subjectTest <- read.table('subject_test.txt',header=FALSE); 
xTest <- read.table('x_test.txt',header=FALSE);  
yTest <- read.table('y_test.txt',header=FALSE); 

# Assigin column names to data above
colnames(activityType) <- c('activityId','activityType'); 
colnames(subjectTrain) <- "subjectId"; 
colnames(xTrain) <- features[,2];  
colnames(yTrain) <- "activityId"; 

colnames(subjectTest) <- "subjectId"; 
colnames(xTest) <- features[,2];  
colnames(yTest) <- "activityId"; 

# Combine train and test data to create a final data set 
finalData <- rbind(cbind(yTrain,subjectTrain,xTrain),cbind(yTest,subjectTest,xTest)); 

# Back to working directory
setwd("c:\\Users\\anishgunner13\\Getting-and-Cleaning-Data-Course-Project") 
dir()

# To select the desired mean() & stddev() columns,
# Subset finalData table based on the logicalVector to keep only desired columns 
colNames <- colnames(finalData);  
logicalVector <- (grepl("activity..",colNames) | grepl("subject..",colNames) | grepl("-mean..",colNames) & !grepl("-meanFreq..",colNames) & !grepl("mean..-",colNames) | grepl("-std..",colNames) & !grepl("-std()..-",colNames)); 
finalData <- finalData[logicalVector==TRUE]; 
 
# Merge the finalData set with the acitivityType table to include descriptive activity names 
finalData <- merge(finalData,activityType,by='activityId',all.x=TRUE); 

# Appropriately label the data set with descriptive activity names.  
names <- names(finalData) 
names <- gsub("\\()","",names) 
names <- gsub("-std$","StdDev",names) 
names <- gsub("-mean","Mean",names) 
names <- gsub("^(t)","time",names) 
names <- gsub("^(f)","freq",names) 
names <- gsub("([Gg]ravity)","Gravity",names) 
names <- gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",names) 
names <- gsub("[Gg]yro","Gyro",names) 
names <- gsub("AccMag","AccMagnitude",names) 
names <- gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",names) 
names <- gsub("JerkMag","JerkMagnitude",names) 
names <- gsub("GyroMag","GyroMagnitude",names) 
setnames(finalData, names) 


# Create a second, independent tidy data set with the average of each variable for each activity and each subject.  
# Create a new table, finalDataNoActivityType without the activityType column 
finalDataNoActivityType <- finalData[,names(finalData) != 'activityType']; 

# Summarizing the finalDataNoActivityType table to include just the mean of each variable for each activity and each subject 
tidyData <- aggregate(finalDataNoActivityType[,names(finalDataNoActivityType) != c('activityId','subjectId')],by=list(activityId=finalDataNoActivityType$activityId,subjectId = finalDataNoActivityType$subjectId),mean); 

# Merging the tidyData with activityType to include descriptive acitvity names 
tidyData <- merge(tidyData,activityType,by='activityId',all.x=TRUE); 

# Export the tidyData set  
write.table(tidyData, './tidyData.txt',row.names=TRUE,sep='\t'); 
