Project Course
==============

The script reads all relevant tables separately, merges them, adjusts the naming of the variables,
reshapes the data and finally writes out a tidy data set.


### Source tables

Features are read from a file containing the names of each feature. Activities and subjects are read from 4 different files containing one row for each measurement. Measurements are read from two files where each row corresponds to one row in the subjects and activities tables. 

### Merging

Activities need to be labelled from a separate activity_labels file which is done by a simple merge. Activities and subjects are appended as columns to the measurements table by cbind.

### Variable names

Variable names are read from the features file and contain problematic characters which are removed by the gsub function. The fixed names are assigned to the data frame names.

### Reshaping

Melting brings the data into the long form format. This form allows easy aggregation via the ddply function from the plyr package. Aggregation is done by subject, activity and variable.

