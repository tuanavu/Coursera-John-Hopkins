X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", sep =",", header= TRUE)
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", sep =",", header= TRUE)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", sep =",", header= TRUE)

X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", sep =",", header= TRUE)
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", sep =",", header= TRUE)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", sep =",", header= TRUE)

feature <- read.table("./UCI HAR Dataset/features.txt", sep =",", header= TRUE)
head(X_test, 2)
head(y_test)
head(X_train)

mergedtest1 = cbind(X_test, y_test)
mergedtest = cbind(mergedtest1, subject_test)

mergedtrain1 = cbind(X_train, y_train)
mergedtrain = cbind(mergedtrain1, subject_train)

mergeddata = merge(mergedtest, mergedtrain, all= "TRUE")


system.time(write.table(mergeddata, file ="data.txt", sep = " "))