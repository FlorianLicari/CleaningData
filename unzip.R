#Look for the UCI HAR Dataset folder or zip
if(!file.exists("./UCI HAR Dataset")) {
        if(!file.exists("./UCI HAR Dataset.zip")) {
                fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
                download.file(fileUrl, destfile = "./UCI HAR Dataset.zip", 
                              method = "curl")
                rm("fileUrl")
        }
        unzip("./UCI HAR Dataset.zip")
}