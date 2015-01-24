CleaningDataProject
===================

###Coursera Getting and Cleaning Data Class Project, January 2015

###Goals:
The goal of this project is to collect, work with, and clean a data set. The
output of this project is a tidy data set that can be used for later analysis.

###Content:
The files used in this project are:

README.md - this overview file

CodeBook.md - a descriptive summary of the reproducable steps taken to produce
              the tidy data set

run_analysis.R - the script used to create the output described in CodeBook.md.
                 This file goes in the UCI directory which also contains the 
                 train and test folders as described in 
                 [David's Project FAQ](https://class.coursera.org/getdata-010/forum/thread?thread_id=49#comment-435) 
                 forum thread. 

###Data Files:
- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

###Usage:
This script tidys the 
[Smartphone Activity Data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
which is a cached version of the University of California, Irvine data described at 
[Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
The data from the zip archive must be extracted and placed in the same directory
in order to run the script.

From the R prompt, change the working directory to where the run_analysis and 
data folders are stored;

`setwd("path to script and data folders")`

Load the script:

`source("run_analysis.R")`

Run the script:

`run_analysis()`

###Results:
The `run_analysis()` script produces the file `UCI_HAR_Dataset_Tidy.txt` which 
is structured according to the description in `CodeBook.md`.

###Requirements:
This script was run in R version 3.1.2 (2014-10-31) -- "Pumpkin Helmet" on the
x86_64-apple-darwin10.8.0 (64-bit) platform. In addition, the following 
packages were installed when running the script:

* data.table - Extension of data.frame
* datasets - The R Datasets Package
* graphics - The R Graphics Package
* grDevices - The R Graphics Devices and Support for Colours and Fonts
* methods - Formal Methods and Classes
* RCurl - General network (HTTP/FTP/...) client interface for R
* stats - The R Stats Package
* utils - The R Utils Package

###Author: 
apyle@github.com

###Acknowlegements:
The data set used in the project is from 

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly 
Support Vector Machine. International Workshop of Ambient Assisted Living 
(IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

