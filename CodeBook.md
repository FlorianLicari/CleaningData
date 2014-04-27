### Coursera - Getting and Cleaning Data
***

###Objectives of this CodeBook:
This code book describes the variables, the data, and any transformations or work that you performed to clean up the data
***

###Data used:
The data used in this peer assignement are data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the [site][1] where the data was obtained.
***

###Transformations performed to clean up the data: 
- The training set and the test set are merged to create only one data set called *table* (10299 rows by 561 columns).
- Only the measurements on the mean and standard deviation for each measurement are extracted. To that extent, the file *feature.txt* is loaded in the working space and the index of the measurements on the mean and standard deviation is then extracted. At the end of this step, we get the *extract* data set (10299 rows by 66 columns).
- Three columns are added at the begining, one to identify the *subject*, one for the *activity code* and one for *the explicit name of the activity*.
- For clarity, the data set is labeled with descriptive columns name to get the "tidydata" data set. An export is made in the text file **tidydata.txt**.
- Finally, the "tidydata" is melted to create one final tidy data set *summary* with the average of each variable for each activity and each subject and then export in the text file **summary.txt**.
- - -

###Main variables used:
- table: Combination of the training set and the test set
- features: List of all features.
- mean: List of all features finishing with *mean()*.
- std: List of all features finishing with *std()*.
- extract: Dataset where only the measurements on the mean and standard deviation for each measurement from *table* are kept.
- subject: List of all subject who performed the activity for each window sample. Its range is from 1 to 30. 
- activity_code: Class labels.
- activity_name: Links the class labels with their activity name.
- tidydata: A data set coming from the merging of *extract*, *subject*, *activity_code* and *activity_name* with descriptive columns name.
- summary: A data set with the average of each variable for each activity and each subject.
- - -

###Files
* tidydata.txt
* summary.txt

[1]: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones