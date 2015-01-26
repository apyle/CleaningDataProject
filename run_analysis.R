#
# run_analysis: functions to download and tidy Smartphone Activity Data
#
# See: https://github.com/apyle/CleaningDataProject for README.md and 
#      CodeBook.md
#
# Author: apyle@github.com
#
# Usage:
#      ResultDataFrame <- run_analysis()
#

library(data.table)
#library(plyr)
library(dplyr)

run_analysis <- function () {
        
        #
        # Step 1. Merge the training and the test sets to create one data set.
        #
        
        # load test data into R
        testSubject <- read.table("./subject_test.txt", sep=" ", header = FALSE)
        testY <- read.table("./y_test.txt", sep=" ", header = FALSE)
        testX <- read.table("./X_test.txt", sep="", header = FALSE, numerals = "no.loss")
        
        # convert raw test data into data table and add Subject and Y data sets
        testDT <- data.table(testX)
        testDT$Subject <- testSubject
        testDT$Y <- testY
        
        
        # load training data into R
        trainSubject <- read.table("./subject_train.txt", sep=" ", header = FALSE)
        trainY <- read.table("./y_train.txt", sep=" ", header = FALSE)
        trainX <- read.table("./X_train.txt", sep="", header = FALSE, numerals = "no.loss")
        
        # convert raw training data into datatable and add Subject and Y to it
        trainDT <- data.table(trainX)
        trainDT$Subject <- trainSubject
        trainDT$Y <- trainY
        
        # merge the test and training data into one data.table by writing both
        # to a temporary file and then reading the combined results into one 
        # data frame
       tmpFile = "./tmpMerge.txt"
        write.table(testDT, file=tmpFile, row.names=FALSE)
        write.table(trainDT, file=tmpFile, append=TRUE, 
                    row.names=FALSE, col.names=FALSE)
        allData <- read.table(tmpFile, sep=" ", header = TRUE, numerals = "no.loss")
        allData <- data.table(allData)
        
        
        #
        # Step 2. Extract only the measurements on the mean and standard deviation 
        #         for each measurement.
        #
        
        # read in the field names for the testX/trainX files as described in the 
        # features.txt file. Then select only the columns that represent standard 
        # deviations (std()) and means (mean())
        xCols <- read.table("./features.txt", sep=" ", header=FALSE)
        myFields <- grep("std[[:punct:]]|mean[[:punct:]]", xCols$V2)
        
        # reduce our data set to these fields, plus the Subject and Y data fields
        tidyData <- select(allData, myFields)
        tidyData$Subject <- allData$Subject
        tidyData$ActivityCode <- allData$Y
        # TODO: Work on refactoring the hard coded V1:V543 column names in this 
        #       statement. Work on removing that technial debt.
        tidyData <- select(tidyData, Subject, ActivityCode, V1:V543)
        
        #
        # Step 3. Name the activities with descriptive activity names
        #
#         myCols <- c("Time Body acceleration signal Mean X-axis",
#                     "Time Body acceleration signal Mean Y-axis",
#                     "Time Body acceleration signal Mean Z-axis",
#                     "Time Body acceleration signal StdDev X-axis",
#                     "Time Body acceleration signal StdDev Y-axis",
#                     "Time Body acceleration signal StdDev Z-axis",
#                     "Time Gravity acceleration signal Mean X-axis",
#                     "Time Gravity acceleration signal Mean Y-axis",
#                     "Time Gravity acceleration signal Mean Z-axis",
#                     "Time Gravity acceleration signal StdDev X-axis",
#                     "Time Gravity acceleration signal StdDev Y-axis",
#                     "Time Gravity acceleration signal StdDev Z-axis",
#                     "Time Body acceleration Jerk Mean X-axis",
#                     "Time Body acceleration Jerk Mean Y-axis",
#                     "Time Body acceleration Jerk Mean Z-axis",
#                     "Time Body acceleration Jerk StdDev X-axis",
#                     "Time Body acceleration Jerk StdDev Y-axis",
#                     "Time Body acceleration Jerk StdDev Z-axis",
#         )
        # Load the activity labels
        actLabels <- read.table("./activity_labels.txt", sep=" ", header=FALSE)
        colnames(actLabels) <- c("ActivityCode", "ActivityFactor")
        
        # merge the labels with the activities
        tidyData <- merge(tidyData, actLabels, by="ActivityCode", all=TRUE)
        
        #
        # Step 4. Label the data set with descriptive variable names
        #
        
        #
        # Step 5. Create a second, independent tidy data set with the average
        #         of each variable for each activity and each subject.
        #
        tidyData <- tidyData[, lapply(.SD, ave), .SDcols=names(tidyData)[3:68], 
                             by=list(Subject, ActivityFactor)]

        #
        # Return: return the second tidy data set
        #
        
        tidyData
        
} # run_analysis

