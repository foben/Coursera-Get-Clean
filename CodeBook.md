#CodeBook
This document describes the variables that are present in the dataset that can be created with the 
[run_analysis.R](run_analysis.R) script.
The script operates on the *Human Activity Recognition Using Smartphones* dataset that can be found 
[here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
It produces a tidy dataset which combines the training and testing data 
and includes for every observation the individual and the activity label.
The tidy dataset is reduced further by only inlcuding the mean and standard deviation variables.
The dataset is subsequently grouped by both the activity and individual,
calculating the mean for each variable for each combination.
The reulting dataset contains a total of 180 observations (30 individuals * 6 different activities)
of 81 variables.

The *activity* variable contains the label for the activity that was performed.
It is one of WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING or LAYING.
The *subject* variable is a number from 1 to 30 indicating the observed individual.
The remaining 79 variables are all prefixed with *Avg_* to indicate that they result from the grouping step.
The letter following the *Avg_* indicates that the variable is either from the time domain (t),
or has been converted to the frequency domain (f) with a Fast Fourier Transformation.
The domain indicator is followed by either *Body*,
indicating the variable contains Body acceleration or rotation,
or *Gravity*, meaning gravitational acceleration.
Following this information is either *Acc* or *Gyro*, indicating the source of measurement,
accelerometer or gyroscope.
*Mag* and *Jerk* Strings indicate magnitude or jerk signal measurements.
*Std* and *Mean* differentiate between Standard deviation and mean aggregations and 
lastly, X, Y or Z indicate the acceleration or rotation axis.

The following list contains the resulting variable names:

activity    
subject    
Avg_tBodyAccMeanX    
Avg_tBodyAccMeanY    
Avg_tBodyAccMeanZ    
Avg_tBodyAccStdX    
Avg_tBodyAccStdY    
Avg_tBodyAccStdZ    
Avg_tGravityAccMeanX    
Avg_tGravityAccMeanY    
Avg_tGravityAccMeanZ    
Avg_tGravityAccStdX    
Avg_tGravityAccStdY    
Avg_tGravityAccStdZ    
Avg_tBodyAccJerkMeanX    
Avg_tBodyAccJerkMeanY    
Avg_tBodyAccJerkMeanZ    
Avg_tBodyAccJerkStdX    
Avg_tBodyAccJerkStdY    
Avg_tBodyAccJerkStdZ    
Avg_tBodyGyroMeanX    
Avg_tBodyGyroMeanY    
Avg_tBodyGyroMeanZ    
Avg_tBodyGyroStdX    
Avg_tBodyGyroStdY    
Avg_tBodyGyroStdZ    
Avg_tBodyGyroJerkMeanX    
Avg_tBodyGyroJerkMeanY    
Avg_tBodyGyroJerkMeanZ    
Avg_tBodyGyroJerkStdX    
Avg_tBodyGyroJerkStdY    
Avg_tBodyGyroJerkStdZ    
Avg_tBodyAccMagMean    
Avg_tBodyAccMagStd    
Avg_tGravityAccMagMean    
Avg_tGravityAccMagStd    
Avg_tBodyAccJerkMagMean    
Avg_tBodyAccJerkMagStd    
Avg_tBodyGyroMagMean    
Avg_tBodyGyroMagStd    
Avg_tBodyGyroJerkMagMean    
Avg_tBodyGyroJerkMagStd    
Avg_fBodyAccMeanX    
Avg_fBodyAccMeanY    
Avg_fBodyAccMeanZ    
Avg_fBodyAccStdX    
Avg_fBodyAccStdY    
Avg_fBodyAccStdZ    
Avg_fBodyAccMeanFreqX    
Avg_fBodyAccMeanFreqY    
Avg_fBodyAccMeanFreqZ    
Avg_fBodyAccJerkMeanX    
Avg_fBodyAccJerkMeanY    
Avg_fBodyAccJerkMeanZ    
Avg_fBodyAccJerkStdX    
Avg_fBodyAccJerkStdY    
Avg_fBodyAccJerkStdZ    
Avg_fBodyAccJerkMeanFreqX    
Avg_fBodyAccJerkMeanFreqY    
Avg_fBodyAccJerkMeanFreqZ    
Avg_fBodyGyroMeanX    
Avg_fBodyGyroMeanY    
Avg_fBodyGyroMeanZ    
Avg_fBodyGyroStdX    
Avg_fBodyGyroStdY    
Avg_fBodyGyroStdZ    
Avg_fBodyGyroMeanFreqX    
Avg_fBodyGyroMeanFreqY    
Avg_fBodyGyroMeanFreqZ    
Avg_fBodyAccMagMean    
Avg_fBodyAccMagStd    
Avg_fBodyAccMagMeanFreq    
Avg_fBodyBodyAccJerkMagMean    
Avg_fBodyBodyAccJerkMagStd    
Avg_fBodyBodyAccJerkMagMeanFreq    
Avg_fBodyBodyGyroMagMean    
Avg_fBodyBodyGyroMagStd    
Avg_fBodyBodyGyroMagMeanFreq    
Avg_fBodyBodyGyroJerkMagMean    
Avg_fBodyBodyGyroJerkMagStd    
Avg_fBodyBodyGyroJerkMagMeanFreq    
