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
library(dplyr)
library(plyr)

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
        # Step 2:
        #
        
        # temporary for testing
        tidyData <- allData
        
        #
        # Return: return the tidy data set
        #
        
        tidyData
        
} # run_analysis

