####################################
# Reading raw data
####################################

feature<-read.table("dataset/features.txt")
train_data<-read.table("dataset/train/X_train.txt")
test_data<-read.table("dataset/test/X_test.txt")
test_label<-read.table("dataset/test/y_test.txt")
train_label<-read.table("dataset/train/y_train.txt")
subject_test<-read.table("dataset/test/subject_test.txt")
subject_train<-read.table("dataset/train/subject_train.txt")

####################################

# Merging the training and test data, subject train and test data, label test and train data

####################################
mergedData<-rbind(train_data,test_data)

mergedLabel<-rbind(train_label,test_label)

mergedSubject<-rbind(subject_train,subject_test)

####################################

# Working on Feature dataset

####################################
x<-grepl(pattern="-mean\\(\\)|-std\\(\\)",feature$V2)   # features with mean and standard deviation are extracted with this
feature<-feature[x,]

feature$V2<-gsub(pattern="\\(\\)",replacement ="",feature$V2)

####################################
# Conversion to tidy data
####################################

mergedData<-mergedData[,feature$V1]      # In the dataset, only those column with mean and standard deviaiton measurement are extracted out.
colnames(mergedData)<-feature$V2         # Column names are given
####################################
# Replacing Label number with activity name
####################################
library(tidyverse)                       # Used case_when function included in dplyr package (included in tidyverse) to replace activity ids with activity names.
mergedLabel<-mergedLabel %>% mutate(V1=case_when(      
                                V1==1 ~ "Walking",
                                V1==2 ~ "WalkingUpstairs",
                                V1==3 ~ "WalkingDownstairs",
                                V1==4 ~ "Sitting",
                                V1==5 ~ "Standing",
                                V1==6 ~ "Laying",  
                                )
                       )
####################################
# Adding subject and activity to mergedData 
####################################
colnames(mergedLabel)<-"Activity"                             
colnames(mergedSubject)<-"SubjectNo"
mergedData<-cbind(mergedLabel,mergedData)               
mergedData<-cbind(mergedSubject,mergedData)              # after this, the tidy data set is obtained.
####################################
# Tidy dataset obtained, writing the table as text form
####################################
write.table(mergedData,"merged_and_cleaned_data.txt")
####################################

# Creating averaged tidy dataset

####################################
## To create the averaged tidy data set, summarise_all function is used included in dplyr package, the below code first groups by subject and activity,
## and calculates the mean of the variables present in all columns
tidy_dataset<-mergedData%>% group_by(SubjectNo,Activity)%>% summarise_all((mean))
write.table(tidy_dataset,file="averaged_tidyData.txt")   ## Averaged tidy data set is obtained,
                                                         ## independent tidy data set with the average of each variable for each activity and each subject. 
####################################
# Averaged tidy dataset 2.0 

Value<-colnames(tidy_dataset)[3:68]                      ## The same averaged tidy dataset as above but it is a gathered dataset. It can be seen in 
                                                         ## another_averaged_tidyDataset.txt.
second_tidy_dataset<-gather(tidy_dataset,key="Varaible",value=Value,3:68)
write.table(second_tidy_dataset,file="another_averaged_tidyDataset.txt")















