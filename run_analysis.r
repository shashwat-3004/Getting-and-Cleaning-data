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
x<-grepl(pattern="-mean\\(\\)|-std\\(\\)",feature$V2)
feature<-feature[x,]

feature$V2<-gsub(pattern="\\(\\)",replacement ="",feature$V2)

####################################
# Conversion to tidy data
####################################

mergedData<-mergedData[,feature$V1]
colnames(mergedData)<-feature$V2
####################################
# Replacing Label number with activity name
####################################
library(tidyverse)
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
mergedData<-cbind(mergedSubject,mergedData)
####################################
# Tidy dataset obtained, writing the table as text form
####################################
write.table(mergedData,"merged_and_cleaned_data.txt")
####################################

# Creating averaged tidy dataset

####################################

tidy_dataset<-mergedData%>% group_by(SubjectNo,Activity)%>% summarise_all((mean))
write.table(tidy_dataset,file="averaged_tidyData.txt")
####################################
# Averaged tidy dataset 2.0 

Value<-colnames(tidy_dataset)[3:68]
second_tidy_dataset<-gather(tidy_dataset,key="Varaible",value=Value,3:68)
write.table(second_tidy_dataset,file="another_averaged_tidyDataset.txt")















