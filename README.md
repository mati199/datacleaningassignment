# Getting And Cleaning Data - Assignment

## There is just one script called `run_analysis.R`. This is how it works

Note: The script assumes you have the directory of the UCI HAR dataset folder as your working directory.

1) gets the working directory + loads the relevent packages

2) loads all the relevent files and assigns the values in the feature file as column names to the x_test and x_train df's

3) cbind's the train and test df's respectively also including an 'activity' column to label the datasets before rbinding

4) rbinds the datasets into one dataset

5) cleans the dataset by applying the melt function to get each signal reading to be a separate row

6) i use the filter function from dplyr and query a regular expression filtering all rows containing mean() and std()

7) i then summarise the dataset using the group_by function to calculate a mean for every activity for every subject and signal


... once the script is finished it will open the output as a table view.

## To r my script from the command line

1. Clone this repo
2. Run the script:

       $ Rscript run_analysis.R


