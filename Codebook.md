---
title: "Codebook"
author: "shashwat-3004"
date: "28/01/2021"

---


### This Codebook describes the variables, the data and any tansformations performed to clean up the data.

# Source of the Data
- Source of Orginal Data:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

- For further Description:http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

# Brief Dataset Information

## Human Activity Recognition Using Smartphones Dataset

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

(Used README.txt file from the original Dataset)

# The Dataset
## The dataset includes the following files-
- README.txt

- feature_info.txt: Contains infomration about variables used in feature vector

- features.txt: Contains list of all different features

- activity_lables.txt: Contains the link label and activity class name

- X_train.txt: Training data

- X_test.txt: Test data

- y_train.txt: Training data activity class label

- y_test.txt: Test data activity class label

The following files are available for the train and test data. Their descriptions are similar. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

# Data Manipulation Steps
In the run_analysis.r, these steps have been followed-

- ## First, all the needed raw data is read.

- ## Training data and test data are merged.

    - X_train.txt and X_test.txt :This results in a 10299x561 data frame, as reported in the original description ("Number of       Instances: 10299" and "Number of Attributes: 561")
    
    - y_train.txt and y_test.txt : This results in a 10299 x 1 data frame with activity IDs
    
    - subject_train.txt and subject_text.txt: This results in a 10299 x 1 data frame with subject IDs
    
- Extract only mean and standard deviaiton measurement from the data

    - To do this, feature.txt is used. The measurements of mean and standard devaition are extracted using feature.txt
    
    - This results in 10299x68 data frame. 66 features are extracted out of 561 feature
    
    - All measurements correspond to numeric (real) numbers in the range (-1, 1).
    
- ## Descriptives activity names given to the activities in the dataset

    - Activity_labels.txt consists of all the descriptive activity names along with the acticity ids. It is used to name the activites in the data set. The activites include
         - WALKING  (1)
         - WALKING_UPSTAIRS (2)
         - WALKING_DOWNSTAIRS (3)
         - SITTING (4)
         - STANDING (5)
         - LAYING (6)
         
The numbers denote the activity ids.

- ## Appropriately label the data set.

    - The script properly labels the dataset with descriptive names.
    
    - Finally, all the data are merged into a single 10299x68 data frame corresponding to:

          -10299x1 data frame of subject IDs;
          -10299x1 data frame of activity labels;
          -10299x66 data frame of features
    - Subject IDs are integers with values in range [1, 30].
    
    - Activtity names are mentioned under the column of activity in tidy dataset.
    
    - Names of the attributes corresponds to:

        - "tbodyacc-mean-x"
        - "tbodyacc-mean-y"
        - "tbodyacc-mean-z"
        - "tbodyacc-std-x"
        - "tbodyacc-std-y"
        - "tbodyacc-std-z"
        - "tgravityacc-mean-x"
        - "tgravityacc-mean-y"
        - "tgravityacc-mean-z"
        - "tgravityacc-std-x"
        - "tgravityacc-std-y"
        - "tgravityacc-std-z"
        - "tbodyaccjerk-mean-x"
        - "tbodyaccjerk-mean-y"
        - "tbodyaccjerk-mean-z"
        - "tbodyaccjerk-std-x"
        - "tbodyaccjerk-std-y"
        - "tbodyaccjerk-std-z"
        - "tbodygyro-mean-x"
        - "tbodygyro-mean-y"
        - "tbodygyro-mean-z"
        - "tbodygyro-std-y"
        - "tbodygyro-std-z"
        - "tbodygyrojerk-mean-x"
        - "tbodygyrojerk-mean-y"
        - "tbodygyrojerk-mean-z"
        - "tbodygyrojerk-std-x"
        - "tbodygyrojerk-std-y"
        - "tbodygyrojerk-std-z"
        - "tbodyaccmag-mean"
        - "tbodyaccmag-std"
        - "tgravityaccmag-mean"
        - "tgravityaccmag-std"
        - "tbodyaccjerkmag-mean"
        - "tbodyaccjerkmag-std"
        - "tbodygyromag-mean"
        - "tbodygyromag-std"
        - "tbodygyrojerkmag-mean"
        - "tbodygyrojerkmag-std"
        - "fbodyacc-mean-x"
        - "fbodyacc-mean-y"
        - "fbodyacc-mean-z"
        - "fbodyacc-std-x"
        - "fbodyacc-std-y"
        - "fbodyacc-std-z"
        - "fbodyaccjerk-mean-x"
        - "fbodyaccjerk-mean-y"
        - "fbodyaccjerk-mean-z"
        - "fbodyaccjerk-std-x"
        - "fbodyaccjerk-std-y"
        - "fbodyaccjerk-std-z"
        - "fbodygyro-mean-x"
        - "fbodygyro-mean-y"
        - "fbodygyro-mean-z"
        - "fbodygyro-std-x"
        - "fbodygyro-std-y"
        - "fbodygyro-std-z"
        - "fbodyaccmag-mean"
        - "fbodyaccmag-std"
        - "fbodybodyaccjerkmag-mean"
        - "fbodybodyaccjerkmag-std"
        - "fbodybodygyromag-mean"
        - "fbodybodygyromag-std"
        - "fbodybodygyrojerkmag-mean"
        - "fbodybodygyrojerkmag-std"

The result is saved as merged_and_cleaned_dataset.txt

- ## Creating averaged tidy dataset

   - the script creates a second, and independent tidy dataset with the average of each measurement for each activity and         each subject.(There are two tidy dataset included, one is spreaded tidy data while other is gathered tidy data)
   
   - The gathered tidy data set is saved as another_averaged_tidyDataset.txt
   
   - The spreaded tidy data set is aved as averaged_tidyData.txt
   
   - The data frame averaged_tidyData.txt contains:

      - subject IDs in the 1st column;
      - activity labels in the 2nd column;
      - the average of features in the next 66 columns.
   
  





