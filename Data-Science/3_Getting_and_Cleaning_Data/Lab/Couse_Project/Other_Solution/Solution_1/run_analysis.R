### Objectives
# You will be required to submit: 
# 1) a tidy data set as described below, [DONE]
# 2) a link to a Github repository with your script for performing the analysis, and [DONE]
# 3) a code book that describes the variables, the data, and any transformations or work 
#   that you performed to clean up the data called CodeBook.md. 
# You should also include a README.md in the repo with your scripts. [DONE]
# This repo explains how all of the scripts work and how they are connected.

# 1) You should create one R script called run_analysis.R that does the following. 
# 2) Merges the training and the test sets to create one data set. [DONE]
# 3) Extracts only the measurements on the mean and standard deviation for each measurement. [DONE]
# 4) Uses descriptive activity names to name the activities in the data set [DONE]
# 5) Appropriately labels the data set with descriptive variable names. [DONE]
# 6) Creates a second, independent tidy data set with the average of each variable for each activity and each subject. [DONE] 
###

### setup
###

### download files initially (run once)
# url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# download.file(url,destfile="runAnalysis.zip",method="curl")
# unzip("runAnalysis.zip")
###

### re: (4), label y_test and y_train data with activity descriptions
# input and process activity_labels.txt
activityLabels<-read.table("./UCI HAR Dataset/activity_labels.txt")
names(activityLabel)<-c("activityCode","activityDescription")
# load y_train.txt 
# then merge with activityLabels
# then add a new column with text label for each numeric label
yTrain<-read.table("./UCI HAR Dataset/train/y_train.txt")
names(yTrain)<-"activityCode"
yTrain<-merge(yTrain,activityLabels,by.x="activityCode",by.y="activityCode")
# load y_test.txt
# then merge with activityLabels
# then add a new column with text label for each numeric label
yTest<-read.table("./UCI HAR Dataset/test/y_test.txt")
names(yTest)<-"activityCode"
yTest<-merge(yTest,activityLabels,by.x="activityCode",by.y="activityCode")
###

### re:(5), label all features in X_test and X_train with labels from features.txt
### once this is done, we can merge test->test data and train->train data (subject_*, X_*, y_*)
### and then rbind test and train data into one dataframe
# input and process features.txt
featureLabels<-read.table("./UCI HAR Dataset/features.txt")
featureLabels$V1<-NULL
colnames(featureLabels)<-"feature"
# setup for loop
i<-1
featureLabelsTransform<-character()
for(i in i:nrow(featureLabels)) {
    featureLabelsTransform<-rbind(featureLabelsTransform,gsub(" ","",(as.character(featureLabels[i,]))))
    i<-i+1
}
# load X_test data and label it with names from featureLabelsTransform
X_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
names(X_test)<-featureLabelsTransform
# load X_train data and label it with names from featureLabelsTransform
X_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
names(X_train)<-featureLabelsTransform
###

### now, merge merge test->test data and train->train data (subject_*, X_*, y_*)
## need to get subject_test and subject_train
subjectTest<-read.table("./UCI HAR Dataset/test/subject_test.txt")
names(subjectTest)<-"subject"
subjectTrain<-read.table("./UCI HAR Dataset/train/subject_train.txt")
names(subjectTrain)<-"subject"
# merge testing data (subjectTest,X_test,yTest) on row number (yikes)
test<-cbind(subjectTest,X_test,yTest)
# merge training data
train<-cbind(subjectTrain,X_train,yTrain)
###

### re:(2), append train and test together
# first, add a var in each for where it came from
test$testData<-TRUE
train$testData<-FALSE
# now, append train and test
complete<-rbind(test,train)
###

### Re:(3), need to grep out the colnames (+activity and subject ID) that are means and SD's
## what about columns like "fBodyAccJerk-meanFreq()-Z"? Should that be included or regex'ed out? including for now...
targetCols<-grep("(-mean|-std)",colnames(complete))
# now just get subjectcol, activity columns, and targetColumns:
completeProcessed<-complete[,c(1,563,564,565,targetCols)]
# 1 = "subject", 563 = "activityCode", 564 = "activityDescription", 565 = "testData"
###

### Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# melt everything down to subject, activityDescription
# start at column 5 because that's where the measurements start
completeProcessedMelt<-melt(completeProcessed,id=c("subject","activityDescription"),
                            measure.vars=names(completeProcessed[,5:ncol(completeProcessed)]))
# cast back out into subject+activityDescription-level data frame
# and averaged values for everything else
completeProcessedCast<-dcast(completeProcessedMelt,subject+activityDescription ~ variable,mean)
###

### prettify up variable names
names(completeProcessedCast)<-gsub("^f","force-",names(completeProcessedCast))
names(completeProcessedCast)<-gsub("^t","time-",names(completeProcessedCast))
names(completeProcessedCast)<-gsub("std","standardDeviation",names(completeProcessedCast))
names(completeProcessedCast)<-gsub("mean","mean",names(completeProcessedCast))
names(completeProcessedCast)<-gsub("meanFreq","meanFrequency",names(completeProcessedCast))
names(completeProcessedCast)<-gsub("Y$","Yaxis",names(completeProcessedCast))
names(completeProcessedCast)<-gsub("X$","Xaxis",names(completeProcessedCast))
names(completeProcessedCast)<-gsub("Z$","Zaxis",names(completeProcessedCast))
names(completeProcessedCast)<-gsub("Acc","Acceleration",names(completeProcessedCast))
names(completeProcessedCast)<-gsub("Mag","Magnitude",names(completeProcessedCast))
names(completeProcessedCast)<-gsub("\\(\\)","",names(completeProcessedCast))

# output tidy data file
write.table(completeProcessedCast, file="tidyData.csv",sep=",")

#codebook helper
codeBook<-data.frame()
p<-3
for (p in 3:ncol(completeProcessedCast)) {
    codeBook[p,1]<-paste(names(completeProcessedCast[p]),"  ",length(completeProcessedCast[,p]),
                         " ",class(completeProcessedCast[,p]),
                         " min:",round(min(completeProcessedCast[,p]),3),
                         " max:",round(max(completeProcessedCast[,p]),3))
    #codeBook<-rbind(codeBook,codeBookEntry)
    p<-p+1
}

