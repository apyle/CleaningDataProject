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

###Usage:
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

* bitops - Bitwise Operations
* datasets - The R Datasets Package
* graphics - The R Graphics Package
* grDevices - The R Graphics Devices and Support for Colours and Fonts
* methods - Formal Methods and Classes
* RCurl - General network (HTTP/FTP/...) client interface for R
* stats - The R Stats Package
* utils - The R Utils Package

###Author: apyle@github.com

