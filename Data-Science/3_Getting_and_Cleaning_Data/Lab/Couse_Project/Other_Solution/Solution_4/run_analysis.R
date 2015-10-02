require("data.table")
require("reshape2")

# run_analysis.r formats the data from the "Human Activity Recognition Using Smartphones" dataset.
# It takes the following files from "getdata-projectfiles-UCI HAR Dataset.zip" and formats
# it into one "easier to read" data file.  The data and the labels for the data are in various files listed below.
# These input files are essential for this script to operate.
# 
# Input Files:
# - 'features.txt': List of all features.
# - 'activity_labels.txt': Links the class labels with their activity name.
# - 'train/X_train.txt': Training set.
# - 'test/X_test.txt': Test set.
# - 'test/y_test.txt': Activity listing
# - 'test/subject_test.txt': Lists subject ids
# - 'train/y_train.txt':  Activity listing
# - 'train/subject_train.txt': Lists subject ids
# 
# We extract only those columns that have either "mean()" or "std()" in their names from the X_train and X_test set
# 
# The path_prefix indicates the path where the data files can be found.
# The fname_suffix indicates the file name suffix to be used to create the complete file name.
# 
# Subsetting is done early on to help reduce memory requirements.
#Extracts only the measurements on the mean and standard deviation for each measurement.

# Load: activity labels
message("Reading Activity Labels")
activity_labels <- read.table("./activity_labels.txt")[,2]
features <- read.table("./features.txt")[,2]
get_features <- grepl("mean|std", features)

# Load and process X_test & y_test data.
message("Reading Testing Data")
X_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("./test/subject_test.txt")
names(X_test) = features

# Extract only the measurements on the mean and standard deviation for each measurement.
message("Filtering the training set to get Standard Deviation and Mean values")
X_test = X_test[,get_features]
y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("ActivityID", "Activity_Label")
names(subject_test) = "subject"

# Bind data
message("Binding Test Data into one data set.")
test_data <- cbind(as.data.table(subject_test), y_test, X_test)

# Load and process X_train & y_train data.
message("Reading Training Data")
X_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("./train/subject_train.txt")
names(X_train) = features

# Extract only the measurements on the mean and standard deviation for each measurement.
message("Filtering training data.")
X_train = X_train[,get_features]

# Load activity data
message("Appending Activity and Labels to training data.")
y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("ActivityID", "Activity_Label")
names(subject_train) = "subject"

# Binding data via cbind
message("Binding the training data iinto one data set.")
train_data <- cbind(as.data.table(subject_train), y_train, X_train)

# Merge test and train data
message("Binding the testing and training data iinto one data set.")
data = rbind(test_data, train_data)
id_labels = c("subject", "ActivityID", "Activity_Label")
data_labels = setdiff(colnames(data), id_labels)
melt_data = melt(data, id = id_labels, measure.vars = data_labels)

# Apply mean function to dataset using dcast function
new_tidy_data = dcast(melt_data, subject + Activity_Label ~ variable, mean)

# CAPITALIZING "MEAN" TO MAKE THE COLUMNS MORE READABLE
cname <- colnames(new_tidy_data)
a <- sub("mean", "MEAN", names(new_tidy_data),)
colnames(new_tidy_data) <- a

# CAPITALIZING "STD" TO MAKE THE COLUMNS MORE READABLE
cname <- colnames(new_tidy_data)
a <- sub("std", "STD", names(new_tidy_data),)
colnames(new_tidy_data) <- a

message("Creating tidy_data.txt.")
write.table(new_tidy_data, file = "./tidy_data.txt")
