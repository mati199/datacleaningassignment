# How the code works:

1) gets the working directory + loads the relevent packages

2) loads all the relevent files and assigns the values in the feature file as column names to the x_test and x_train df's

3) cbind's the train and test df's respectively also including an 'activity' column to label the datasets before rbinding

4) rbinds the datasets into one dataset

5) cleans the dataset by applying the melt function to get each signal reading to be a separate row

6) i use the filter function from dplyr and query a regular expression filtering all rows containing mean() and std()

7) i then summarise the dataset using the group_by function to calculate a mean for every activity for every subject and signal
