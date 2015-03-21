#Define all necessary paths, relative to the main data directory,
#as it is extracted from the zip file.
#The default assumes this folder to be in the current working directory.
dataDir <- "UCI HAR Dataset"
trainDir <- "train"
testDir <- "test"

featureNamesFile <- paste(dataDir, "features.txt", sep="/")
actlabelFile <- paste(dataDir, "activity_labels.txt", sep="/")

train_sub <- paste(dataDir, trainDir, "subject_train.txt", sep="/")
train_x <- paste(dataDir, trainDir, "X_train.txt", sep="/")
train_y <- paste(dataDir, trainDir, "y_train.txt", sep="/")

test_sub <- paste(dataDir, testDir, "subject_test.txt", sep="/")
test_x <- paste(dataDir, testDir, "X_test.txt", sep="/")
test_y <- paste(dataDir, testDir, "y_test.txt", sep="/")

#Define a function that reads features to a data frame
readFeatures <- function(featureFile, featureNames) {
  #Read in the feature file
  #We use as column names the featureNames vector that is supplied.
  #This vector contains the names from the features.txt file.
  #This achieves the 4. requirement
  features <- read.table(featureFile, col.names = featureNames)
  #Retain only columns that represent mean or std variables.
  #This achieves the 2. requirement
  features <- features[, grepl("mean|std", featureNames)]
  features
}

#Define a function for creating a dataframe of activities.
readActivities <- function(activityFile, levels, labels) {
  activities  <- read.table(activityFile, col.names = "activity")
  #Replace the numeric values with  a factor vector of appropriate labels.
  #This achieves the 3. requirement.
  activities[, 1] <- factor(activities[, 1], levels = levels, labels = labels)
  activities
}

#Define a function for creating a dataframe of subjects.
readSubjects <- function(subjFile) {
  subjects <- read.table(subjFile, col.names = "subject")
  subjects
}

#Create a dataframa that maps activity numbers to Strings for requirement 3.
activityMapping <- read.table(actlabelFile, stringsAsFactors = FALSE)
actLevels <- activityMapping[, 1]
actLabels <- activityMapping[, 2]

#Read the features.txt file and retain the second column,
#yielding a character vector of descriptive variable names.
features <- read.table(featureNamesFile, sep = " ", stringsAsFactors = FALSE)
features <- features[,2]

#Use the previously defined functions to read in the training data sets
#activities, subjects and features.
tr_activities <- readActivities(train_y, actLevels, actLabels)
tr_subjects <- readSubjects(train_sub)
tr_features <- readFeatures(train_x, features)
#Combine them into a training dataframe
trainingData <- cbind(tr_activities, tr_subjects, tr_features)

#Use the previously defined functions to read in the test data sets
#activities, subjects and features.
tst_activities <- readActivities(test_y, actLevels, actLabels)
tst_subjects <- readSubjects(test_sub)
tst_features <- readFeatures(test_x, features)
#Combine them into a test dataframe
testData <- cbind(tst_activities, tst_subjects, tst_features)

#Combine the training and the test data,
#Achieving requirement 1 (2 through 4 are already achieved)
allData <- rbind(trainingData, testData)

#The dplyr package is required for the next data reduction step.
library(dplyr)
#Group the combined dataset by activity and subject
#and summarise all other variables with the mean function.
#The result is piped into the averageData variable
averageData <- 
  allData %>%
  group_by(activity, subject) %>%
  summarise_each(funs(mean))

#The following lines clean up the variable names a bit
varNames <- names(averageData)
#Substitute dots and capitalize the mean and std identifiers
varNames <- gsub("\\.mean", "Mean", varNames)
varNames <- gsub("\\.std", "Std", varNames)
#Remove remaining dots
varNames <- gsub("\\.", "", varNames)
#Add the Avg_ identifier to all but subject and activity, to indicate
#the data reduction step
varNames <- c(varNames[1:2], paste("Avg_", varNames[-(1:2)], sep=""))

names(averageData) <- varNames

#Write the resulting data frame to a text file,
#achieving the 5. and final requriement
write.table(averageData, "tidy_data.txt", row.names=FALSE)