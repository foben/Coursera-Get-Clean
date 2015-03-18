dataDir <- "UCI HAR Dataset"
trainDir <- "train"
testDir <- "test"

featureNames <- paste(dataDir, "features.txt", sep="/")
actlabelFile <- paste(dataDir, "activity_labels.txt", sep="/")

train_sub <- paste(dataDir, trainDir, "subject_train.txt", sep="/")
train_x <- paste(dataDir, trainDir, "X_train.txt", sep="/")
train_y <- paste(dataDir, trainDir, "y_train.txt", sep="/")

test_sub <- paste(dataDir, testDir, "subject_test.txt", sep="/")
test_x <- paste(dataDir, testDir, "X_test.txt", sep="/")
test_y <- paste(dataDir, testDir, "y_test.txt", sep="/")

readFeatures <- function(featureFile, featureNames) {
  features <- read.table(featureFile, col.names = featureNames)
  features <- features[, grepl("mean|std", featureNames)]
  features
}

readClasses <- function(classFile, levels, labels) {
  classes  <- read.table(classFile, col.names = "class")
  classes[, 1] <- factor(classes[, 1], levels = levels, labels = labels)
  classes
}

readSubjects <- function(subjFile) {
  subjects <- read.table(subjFile, col.names = "subject")
  subjects
}


#Read the features.txt file, but don't convert to factors.
#Subset  the second column, only the character vector is important.
features <- read.table(featureFile, sep = " ", stringsAsFactors = FALSE)
features <- features[,2]

activities <- read.table(actlabelFile, stringsAsFactors = FALSE)
actLevels <- activities[, 1]
actLabels <- activities[, 2]


tr_features <- readFeatures(train_x, features)
tr_classes <- readClasses(train_y, actLevels, actLabels)
tr_subjects <- readSubjects(train_sub)
trainingData <- cbind(tr_features, tr_subjects, tr_classes)

tst_features <- readFeatures(test_x, features)
tst_classes <- readClasses(test_y, actLevels, actLabels)
tst_subjects <- readSubjects(test_sub)
testData <- cbind(tst_features, tst_subjects, tst_classes)

allData <- rbind(trainingData, testData)

