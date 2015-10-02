cleaningdata
============

Programming assignment that demonstrates my ability to collect, work with, and clean a data set.

ransformation details

REQUIREMENTS

Libraries: Require data.table and xlsx ibraries.

USAGE

Download the data source and put into a folder on your local drive. You'll have a UCI HAR Dataset folder. Put run_analysis.R in the parent folder of UCI HAR Dataset, then set it as your working directory using setwd() function in RStudio.

Run source("xlsx"). (if you cannot load this lackage for some reason, comment out one 74 and line 76 in run_analysis.r.
Run source("run_analysis.R"), then it will generate a new file tiny_data.txt in your working directory.
Although not required by the assignment, it also outputs tiny_data.xlsx to present a more readable version of tiny_data.txt. Also, because for computing restraints, and por upload speeds on my network, tidy_data.txt only contains the measurements for the 1st 30 participants of the study.

"run_analysis.r" also outputs tidy_average.txt and tidy_average.xlsx. This way that data requested by the assignment can be examined more thoroughly in a file, instead of on the command line.

