Transformation details

REQUIREMENTS

Libraries:
Require data.table and xlsx ibraries.

Input Files:
"activity_labels": Lists all activities.
"cname": column names
"data": Variable that holds test_data and train_data.
"data_labels":  columm names for activites and ids
"extract_features": Filtered list of features that onl includes mean and std.
"features": Lists features from features.txt        
"id_labels": Holds column ids.
"melt_data": variable holds all the data from the melt function.
"new_tidy_data": Holds tidy data.
"subject_test": Hold all data from subject testing data
"subject_train": Holds all data from Subject training data.
"test_data": Variable holds test data.
"train_data": Variable holds train data      
"X_test": Lists data in X_text.txt
"X_train": Lists data in X_train.txt
"y_test": Lists activities in y_test
"y_train": Lists activities in y_test  

OVERVIEW
We want to obtain a dataset that contains the mean and standard deviations for all the measurements.  Unfortunately, the raw datasets we are given do not provide a straightforward representation.  

"run_analysis.r" loads both testing and training data.  It extracts the mean and standard deviation column names and data.  It extracts the features aand makes them column headers.  It extracts the activity labels and makes them row names identifying the activites measured.


USAGE

Download the data source and put into a folder on your local drive. You'll have a UCI HAR Dataset folder.
Put run_analysis.R in the parent folder of UCI HAR Dataset, then set it as your working directory using setwd() function in RStudio.

1. Run source("run_analysis.R"), then it will generate a new file tiny_data.txt in your working directory.

Although not required by the assignment, it also outputs tiny_data.xlsx to present a more readable version of tiny_data.txt.  Also, because for computing restraints, and por upload speeds on my network, tidy_data.txt only contains the measurements for the 1st 30 participants of the study.  

VARIABLE NAMES

features:  Holds all the values of featrues.txt.

std_featrues:  Holds the values of the features corresponding to the standard deviation.

mean_featrues:  Holds the values of the features corresponding to the mean.

headers:  Holds the names of the features without the indexes.

X_test:  Holds values contained in ".\test\X_test.txt"

X_train:  Holds values contained in ".\test\X_train.txt"

activity_labels: Holds the values of activity_labels.txt 

std_data_labeled:  Merges the data with STD data

X_test_cdata:  Holds merged test data

std_X_train:  Holds X_train standard deviation values

mean_X_train:  Holds X_train mean values

std_data_labeled_train:  Holds  X_train standard deviation values and with actvitiy lables

X_train_cdata:  Hold completed T_train tidy dataset

dataset:  Combines completed X_train and X_test datasets

cname:  Holds column names

a: Temporary variable used to store valuses to change column names

SubjectID:  contains numerical subject ids for both datasets.  We had to generate this because it was not provided.

mean_dataset:  vector containing the means of all values in a dataset.
