Code Book
==========================================================

General Information on data:

	-> READNE.md file
	
==========================================================

Description of steps undertaken to clean and reshape the data:

1) Read the files containing the labels for activities and features of vector

2) Read the test data

2.1) Read the data identifying subjects for test observations and rename columns
2.2) Read the data containing the feture list for test observations and add descriptions
2.3) Read the data identifying type of activity for test observations and rename columns
2.4) Column bind files under 2.1, 2.2 and 2.3 to get the complete table for test observations
2.5) Keep only necessary columns, Subject.Id, Activity and columns containing mean in their description
2.6) Add the description for activity type to produce the final test data for observations

3) Read the training data

Reproduce steps 2.1 -> 2.6 for training data to get the final training data for observations 

4) Merge Training and Test data to create one data set (training and test data have the same format, they will
	be bound vertically)

5) Reshape the merged data to produce the desired format for data aggregation

5.1) Use the melt function to prepare data for dcast aggregation.
5.2) Aggregate data with dcast function to produce the final (tidy) data set

6) Finnaly write out to csv file the tidy data set in the Data folder.

==========================================================