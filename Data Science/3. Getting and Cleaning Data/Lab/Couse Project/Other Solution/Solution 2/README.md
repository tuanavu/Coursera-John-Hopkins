# ReadMe

### Getting and Cleaning Data
### Course Project
### Tidy Data Set ReadMe

aoshotse

============================================================================

### The Raw Data:

The raw data for the analysis comes from the "Human Activity Recognition 
Using Smartphones Dataset Version 1.0". Experiments were carried out on 
30 volunteers, each person performing six activities (Walking, 
Walking Upstairs, Walking Downstairs, Sitting, Standing and Laying) while a 
Samsung smartphone recorded data.

An accelerometer measured linear acceleration (having two components, "body"
and "gravitational") while a gyroscope measured angular velocity. By taking
time derivatives of these measurements, values for jerk were obtained. Along
with this, the raw data had several measures that were estimated from the 
data including energy, correlation, kurtosis, angle and hundreds more 
(561 in total). The data set was split between "test" and "train" data.

The raw data was given in a file named "UCI HAR Dataset" containing the
"test" and "train" folders and also including measurement label
documentation. 


=============================================================================

### A Few Notes about the Script

* Before running the script, make sure to set your working directory to 
the UCI dataset: setwd("C:/...UCI HAR Dataset")

* The script is designed such that it can be copied and pasted into the
r console as is and produce the tidy data set given the working directory
is "UCI HAR Dataset". If you want to run the script, BE AWARE that the final
line WRITES a "TidyData.csv" file to the working directory.

* There is also AMPLE documentation in the script to 
explain almost every function/variable in the code. You may find it more
worth your while to LOOK THERE FIRST.


============================================================================


### What the Script Does 

1.) The first 7 lines of (uncommented) code reads in the files 'X_test.txt' 
as xtest, 'y_test.txt' as ytest, 'subject_test.txt' as subj, 
'X_train.txt' as xtrain, 'y_train.txt' as ytrain, 'subject_train.txt' 
as subj and 'features.txt' as features.

2.) The function 'yestolabel' takes in either ytest or ytrain and makes the 
labels descriptive (argument: ytest or ytrain). In the first call, ytest
is taken as the argument. The variable 'vtest' is returned.

3.) Once the labels are descriptive, the function 'datactivity' takes 
'vtest' and combines it with xtest. Now the test data is 
combined with the activity data and xtest2 is returned.

4.) Now that the data is combined with descriptive activity labels, the 
function 'submerge' combines xtest2 and subject labels in subj. 
xtest3 is returned.

5.) At this point, a variable called xtest4 is assigned to the xtest3
data and xtest3 is removed (so that when 'submerge' is called on the train
data the variable  xtest3 can be assigned again). Likewise, xtest2 and
vtest are removed. Finally, the dataset 'variables' is assigned to column
V2 of the 'features' dataset and the variable 'features' is removed.

6.) Next, 'yestolabel' is run on ytrain, 'datactivity' on vtest and xtrain,
and 'submerge' on xtest2 and subk. xtrain4 is assigned to xtest3 and the
variables vtest, xtest2 and xtest3 are then removed.

7.) At this point the combined test data is in xtest4 and the combined train
data is in xtrain4.

8.) xtest4 and xtrain4 are combined by row and assigned to the variable
totdata

9.) Using a for loop, the function 'variplace' maps the elements (feature
variables) in variables to columns in totdata starting from the third 
column. Now the feature variables are combined with the data.
The variable totdata1 is returned.

*****Note that cloumn names were deemed descriptive enough and NOT changed. This was deliberate, given the context of the data (measures along axes, time and frequency measurements, etc). Also, the special characters do not interfere with calls to the column names.*****


10.) The function 'meansdex' extracts the columns of totdata1 that represent 
mean or standard deviation measurements using the 'grepl' function.
Measurements featuring the sring 'meanFreq' are removed as they do not 
represent activity measurement means. The correct data set is returned as
the variable totdata2.

11.) The function 'aggmeans' takes totdata2 and creates a "second 
independent tidy data set with the average of each variable for each 
activity and each subject." It does so by using the 'aggregate' function.
The data set 'Final_Data' is returned.

12.) The last line of the script writes 'Final_Data' to a csv file in the
working directory called "TinyData.txt"
 