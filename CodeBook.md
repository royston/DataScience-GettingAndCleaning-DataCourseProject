DataScience-GettingAndCleaning-DataCourseProject
================================================

Course Project for Coursera Data Science / Getting and Clearning Data course

Code Book
===========
The script run_analysis.R transforms the wearable data by:
1. Merging the train and test data
2. Removing irrelevant data(only data related to mean and standard deviation are retained)
3. Aggregates the data by activity and subject.

The output data set produced by this script is a dump of a data frame in .txt format.
The data frame contains the above aggregated data. 

The following is a guide to the column names in the output data:

The following columns represent the mean values various measurements of wearable computing for each subject and activity type. Subjects are individual volunteers from whom the data has been collected. 
Those among these columns that end with "XYX" have separate measurements for each of the 3 space dimensions, represent by X, Y or Z.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

Each of the above set have separate columns for mean and std.
For eg. tBodyAcc-mean()-X represents the X axis mean of tBodyAcc

Further details of the data columns can be found from the CodeBook in the input data set at : [wearable computing data](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 

In addition 
