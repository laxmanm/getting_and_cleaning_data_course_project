#Code book 
=================

This document provides information about the procedures followed in the script `run_analysis.R` which is available in this repo, and also the data sets generated by the script.

##Introduction
The script run_analysis.R performs all the 5 steps explained in the course project. Required files are downloaded and read into different variables.

1. Similar data are merged using rbind() function. e.g. Training and test data of X, Y and subject are merged.
2. Columns with meaures MEAN and STANDARD DEVIATION are extracted from the dataset. Appropriate names are updated from `features.txt` file in the obtained dataset.
3. From the `activity_labels.txt` file, corresponding activites are updated in the dataset. (Available activites are:  WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).
4. Dataset is labeled in a descriptive way:
* `tBodyAcc-mean()-X` becomes `timeBodyAccMeanX` 
* `tBodyAcc-std()-Y` becomes `timeBodyAccStdY`
* `fBodyAcc-mean()-Z` becomes `freqBodyAccMeanZ`
* `fBodyBodyGyroMag-mean()` becomes `freqBodyGyroMagMean`
* `fBodyBodyGyroJerkMag-meanFreq()` becomes `freqBodyGyroJerkMagMeanFreq`
5. Independent tidy dataset with mean value for each subject and activity is generated. The output file is `tiddata_all_Y.txt` and is available in this repo.

##Variables
1. data_test_X, data_test_Y, data_train_X, data_train_Y, data_test_subject and data_train_subject contain the data from the downloaded files.
2. data_all_X, data_all_Y and data_all_subject merge the previous datasets mentioned in 1.
2. data_features contains the file `features.txt`. mean_std contains all the columns having literal 'mean' or 'std'. 
3. data_activities contains the file `activity_labels.txt`. Correct activity name is updated from here.
4. all_data merges data_all_X, data_all_Y and data_all_subject into a big dataset. Comprehensive names are updated in the dataset.
5. And finally, avg contains the relevant averages which is finally stored in `tidy_data.txt` file. ddply() from the plyr package is used to apply colMeans() and ease the development.