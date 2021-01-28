# Getting-and-Cleaning-data
Course-3 Data Science 
# Project Description

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

In more details, the following steps are required to complete the assignment: 1) a tidy data set as described below; 2) a link to a Github repository with your script for performing the analysis; 3) a Code book that describes the variables, the data, and any transformations performed to clean up the data called.

# Data description
The raw dataset can be obtained from:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Full description is available at :http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

# Data analysis
- Set your working directory

- Run the ```get_raw-data.r``` script to download the dataset.

- Then run the ```run_analysis.r``` script to perform the actual analysis
   
   ```run_analysis.r``` performs the following
   
      - Read the Dataset
      
      - Merges the training and the test sets to create one single data set.
      
      - Extracts only the measurements on the mean and standard deviation for each measurement.
      
      - Uses descriptive activity names to name the activities in the data set
      
      - Appropriately labels the data set with descriptive variable names.
      
      - Creates a independent tidy data set with the average of each variable for each activity and each subject.

After performing the analysis, the following files will be created:   
- ```merged_and_cleaned_dataset.txt``` 
- ```averaged_tidyData.txt```  (Spreaded averaged tidy data)
- ```another_averaged_tidyDataset.txt```  (Gathered averaged tidy data)

To read the data use ```read.table()``` function.
