###The repo includes the following files:


* 'README.md'

* 'CodeBook.md': Describes the variables, the data and any transformations or work performed to clean up the data.

* 'unzip.R': Looks if the UCI HAR Dataset folder is present in the working directory. If not, it looks for the zip and unzips it if it is there. Otherwise, it downloads the zip and unzips it in the working directory.

* 'run_analysis.R': First, calls for the 'unzip.R' script to load the needed data then performs the data cleaning of the UCI HAR Dataset. Finally, it exports two data set:
	* One with the subject, the activity code, the activity explicit name and the measurements on the mean and standard deviation for each measurement.
	* a tidy data set with the average of each variable on the mean and standard deviation for each activity and each subject.


###Working Hypothesis
My only assumption about my two scripts is they are in the working directory of R or RStudio. If the UCI HAR Dataset is not present in your working directory, the 'unzip.R' script will download it and/or unzip it.