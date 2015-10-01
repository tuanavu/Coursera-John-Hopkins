## Set working directory to one containg the 
## UCI dataset setwd("C:/...UCI HAR Dataset")

########################################################################
###################### Script Begins Here ##############################
########################################################################

xtest <- read.table("test/X_test.txt", header = FALSE)
## Read X_test (test data) as table	

ytest <- read.table("test/y_test.txt", header = FALSE)
## Read y_test (activity labels) as table	

subj <- read.table("test/subject_test.txt", header = FALSE)
## Read subject_test (subject labels) as table

xtrain <- read.table("train/X_train.txt", header = FALSE)
## Read X_train (train data) as table	

ytrain <- read.table("train/y_train.txt", header = FALSE)
## Read y_train (activity labels) as table	

subk <- read.table("train/subject_train.txt", header = FALSE)
## Read subject_train (subject labels) as table

features <- read.table("features.txt", header = FALSE)
## Read features (variables) as table
## Variable names considered clear given context of data
## Variable names will NOT be changed


yestolabel <- function(ydat) {	
## Function to make test activity labels descriptive (argument: ytest) 							
	trps <- length(ydat$V1)
	for (i in 1:trps) {
		if (ydat$V1[i] == 1) {
			ydat$V1[i] = "Walking"
		}
		
		else if (ydat$V1[i] == 2) {
			ydat$V1[i] = "WalkingUpstairs"
		}
		
		else if (ydat$V1[i] == 3) {
			ydat$V1[i] = "WalkingDownstairs"
		}
		
		else if (ydat$V1[i] == 4) {
			ydat$V1[i] = "Sitting"
		}
		
		else if (ydat$V1[i] == 5) {
			ydat$V1[i] = "Standing"
		}
		
		else {
			ydat$V1[i] = "Laying"
		}
	
	}
	
	vtest <<- ydat
## returns data set with descriptive rows as vtest
}



datactivity <- function(label, dat1) {
## Function to combine test data and vtest 
## (arguments: vtest, xtest) in that order

	Activity <- label$V1
	
	dat3 <- cbind(Activity, dat1)
	
	xtest2 <<- dat3
## returns combined data set as xtest2	
}



submerge <- function(bdat, sdat) {
## Funtion to combine xtest2 and subject labels
## (arguments: xtest2, subj) in that order

	Subject <- sdat$V1
	
	dat4 <- cbind(Subject, bdat)
	
	xtest3 <<- dat4
## returns combined data set as xtest3
}


variplace <- function(todat, var1) {
## Funtion to label columns of combined test/train
## data with features labels(arguments: totdata, variables) 
## in that order

	for (i in 1:length(var1)) {
		names(todat)[2+i] <- var1[i]
	
	}
	
	totdata1 <<- todat
## returns combined test/train data with feature variables
## as column names	
}


meansdex <- function(todat) {
## Funtion to extract measurments on mean and standard deviation
## for each measurement (argument: totdata1)

meancols <- todat[,grepl("mean",names(todat))]
## Extract measurement means from test/train data by column

stdcols <- todat[,grepl("std",names(todat))]
## Extract measurement std from test/train data by column

fidat <- cbind(meancols, stdcols)

fimes <- todat[,1:2]

finfo <- cbind(fimes, fidat)

meanfreak <- finfo[,!grepl("meanFreq",names(finfo))]
## measurements featuring the sring 'meanFreq' are removed as they
## do not represent (activity) measurement means

totdata2 <<- meanfreak
## returns dataframe containing mean/sd coulumns
## from the test/train data
}


aggmeans <- function(todat) {
## Funtion to create 'second independent tidy data set with the 
## average of each variable for each activity and each subject.'
## (argument: totdata2))
 
	todat[,1] <- as.factor(todat[,1])
## Convert 'todat$Subject' to factor so variables can be aggregated
## by it	

	aggdata2 <-aggregate(todat,by=list(todat$Subject,todat$Activity),FUN=mean, na.rm=TRUE)
## Aggregation of variables by Subject and Activity. Mean is then calculated
	
	aggdata2$Subject <- NULL
	aggdata2$Activity <- NULL
## Excess columns removed
	
	colnames(aggdata2)[1] <- "Subject"
	colnames(aggdata2)[2] <- "Activity"
## Columns relabeled
	
	aggdata2[order(aggdata2$Subject),]

	Final_Data <<- aggdata2
## returns final tidy data set
}




## Data structuring function calls on test data
yestolabel(ytest)			
datactivity(vtest, xtest)
submerge(xtest2, subj)			

## Clearing excess Variables
xtest4 <- xtest3
variables <- as.character(features$V2)
rm(vtest)
rm(xtest2)
rm(xtest3)
rm(features)

## Data structuring function calls on train data
yestolabel(ytrain)				
datactivity(vtest, xtrain)
submerge(xtest2, subk)

## Clearing excess Variables
xtrain4 <- xtest3
rm(vtest)
rm(xtest2)
rm(xtest3)

# Combining test and train data by row
totdata <- rbind(xtest4, xtrain4)

# Replace column names with feature variables 
variplace(totdata, variables)

# Extract mean and sd measurements
meansdex(totdata1)

# Clearing excess Variables
rm(totdata1)

# Create Final Tidy Data Set
aggmeans(totdata2)

# Write Tidy Data Set to file
## write.table(Final_Data, file="TidyData.csv", sep=",")
write.csv(Final_Data, file="TidyData.csv", row.names=FALSE)
