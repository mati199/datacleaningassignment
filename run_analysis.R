run_analysis <- function() {
  
  dir <- getwd()
  
  #read all relevant files
  features <- read.table("features.txt")
  subject_test <- read.table(paste0(dir, "/test/", "subject_test.txt"))
  X_test <- read.table(paste0(dir, "/test/", "X_test.txt"))
  y_test <- read.table(paste0(dir, "/test/", "y_test.txt"))
  subject_train <- read.table(paste0(dir, "/train/", "subject_train.txt"))
  X_train <- read.table(paste0(dir, "/train/", "X_train.txt"))
  y_train <- read.table(paste0(dir, "/train/", "y_train.txt"))
  activity_labels <- as.character(read.table("activity_labels.txt")[,2])
  
  #load packages
  packages <- c('reshape2', 'plyr', 'dplyr')
  sapply(packages, require, character.only = TRUE)
  
  # create test and train dataset
  colnames(X_test) <- as.character(features$V2)
  colnames(X_train) <- as.character(features$V2)
  colnames(subject_train) <- "subject"
  colnames(subject_test) <- "subject"
  colnames(y_train) <- "activity"
  colnames(y_test) <- "activity"
  
  df_test <- cbind(subject_test, y_test, X_test)
  df_train <- cbind(subject_train, y_train, X_train)
  
  # combine into one dataset
  df_final <- rbind(df_train, df_test)
  
  # extract mean() and std() rows
  mean_std_cols <- grep("mean[(][)]|std[(][)]", colnames(df_final))
  mean_std_data <- df_final[,c(1,2,mean_std_cols)]
  
  # calculate means
  mean_std_col_means <- ddply(mean_std_data, .(activity,subject), colMeans)
  
  # replace activity numbers with the corresponding label in activity_labels
  mean_std_col_means$activity <- as.factor(mean_std_col_means$activity)
  levels(mean_std_col_means$activity) <- activity_labels
  
  # write output
  View(mean_std_col_means)
  write.table(mean_std_col_means, file = paste0(getwd(),"/run_analysis_output.txt"), quote = FALSE, append = FALSE, sep = ',', row.names = FALSE)
  
}
