# Getting And Cleaning Data - Assignment

### There is just one script called `run_analysis.R`. This is how it works

Note: The script assumes you have the directory of the UCI HAR dataset folder as your working directory.

1) gets the working directory + loads the relevent packages

2) loads all the relevent files and assigns the values in the feature file as column names to the x_test and x_train df's

3) cbind's the train and test df's respectively also including an 'activity' column to label the datasets before rbinding

4) rbinds the datasets into one dataset

5) creates a vector of column indeces where the colnames contain mean() or std() then filters out the columns that dont

6) use ddply to apply the colMeans functions for the mean and std columns

7) use the levels function, getting the corresponding activity from the activity_labels file

... once the script is finished it will open the output as a table view and write the output to a file `run_analysis_output.R` in the working directory and also open the table in RStudio.

