Course Project: Getting and Cleaning Data
========================================
This repo consists of files related to the course project of "Getting and Cleaning Data". 

## Installation
* Create a directory for this project, `data_cleaning` in this case.
* Download `run_analysis.R` to `data_cleaning` 
* Download the raw data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip to `data_cleaning` and unzip it.

Make sure you load packages `dplyr`,`data.table` and `tidyr` before running the script `run_analysis.R`. 
    
## Running the analysis     
* Set working directory to `data_cleaning`.     
* Source the script `run_analysis.R` in R: `source("run_analysis.R")` and all the 5 steps mentioned in the course project will be executed. Final output file `tidy_data.txt` will be written into the current working directory.

## Codebook
Further info about process and variables is available in `CodeBook.md`.

## Code 
Code also contains detailed explanation of every step.

Thanks.

