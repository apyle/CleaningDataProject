#
# run_analysis: functions to download and tidy Smartphone Activity Data
#
# See: https://github.com/apyle/CleaningDataProject for README.md and 
#      CodeBook.md
#
# Author: apyle@github.com
#
# Usage:
#       run_analysis()
#

library(data.table)

run_analysis <- function () {
        
        # Step 1. Merge the training and the test sets to create one data set.
        # load test data into R
        testSubject <- read.table("./subject_test.txt", sep=" ", header = FALSE)
        testY <- read.table("./y_test.txt", sep=" ", header = FALSE)
        testX <- read.table("./X_test.txt", sep="", header = FALSE, numerals = "no.loss")
        
        # load training data into R
        trainSubject <- read.table("./subject_train.txt", sep=" ", header = FALSE)
        trainY <- read.table("./y_train.txt", sep=" ", header = FALSE)
        trainX <- read.table("./X_train.txt", sep="", header = FALSE, numerals = "no.loss")
        
        # 
} # run_analysis

