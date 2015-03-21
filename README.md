#Getting and Cleaning Data Course Project

This is the GitHub repository that contains my submission for the 
*Getting and Cleaning Data* course project.
Thank you for taking the time to evaluate my submission ! :)

This repository contains the processings script, [run_analysis.R](run_analysis.R),   
the [CodeBook.md](CodeBook.md) markdown file and this Readme file.

I have commented the code extensively, so hopefully the script is easy to follow.
To run the script successfully, you need to either extract the 
[Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
into the same folder as the script, or, alternatively,
adjust the 4. line in the script to point to the right location.
The script expects the data to be extracted and the folder structure to be unchagned.
The script starts by setting up the "environment", defining all the required paths
relative to the path of the top data directory (lines 1 - 17).

Then, three helper functions are set up:   
`readFeatures` *(lines 20-30)* which reads the actual feature data from a given file,
subsetting only those variables that contain mean or standard deviation calculations **(requirement 2)**.

`readActivities` *(lines 33-39)* which reads in the activity codes from a given file.
The codes are then replaced with the actual activity labels,
 which are also supplied as arguments **(requirement 3)**.

`readSubjects` *(lines 42-45)* which reads is the numeric subject identification number from a given file.

The actual work load is performed from lines 48 onwards.
First, vectors containing the levels and names of activities are constructed
and the variable names as given in the features.txt file are read.

After that, the actual data is read.
First, in lines 59 to 63 the training data is read, including feature vectors,
subject identifiers and activity labels.
To achieve this, the aboce mentioned functions are utilized.
The resulting three dataframes are then bound together column-wise to create
a single dataframe containing the training data.

The same process is applied to read the test data in lines 67 to 71.

Finally, the test and training data are combined into a single dataframe
in line 75 **(requirement 1)**.

In preparation of requirement 5, the data is grouped by individual and activity,
summarizing the variables into averages for each combination (lines 82 to 85).
This is achieved by utilizing the dplyr function as demonstrated in the course lectures.

The following lines (88 - 98) clean up the somewhat messy variable names of the dataframe
to satisfy **requirement 4**.

Lastly, the resulting, tidy dataset is written to a file called `tidy_data.txt` in line
102, completing the final **requirement 5**.

I hope my explanations have helped you in grading my work and thanks again for taking the time
to evaluate my submission!
