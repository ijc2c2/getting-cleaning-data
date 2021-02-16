
The purpose of this document is to outline the process used in generating the tidy_data_set.txt file.

After downloading the zip file and putting the relevant txt files in the working directory, the R script merges the data columns for test and training, and then merges the rows of training and test.

These files are: X_test.txt, X_train.txt, activity_labels.txt, subject_test.txt, subjet_train.txt, y_test.txt, y_train.txt, and features.txt

These files are used to merge the training and test data with appropriate labels and activity labels. Then the colums containing measurements of means or standard deviations are chosen, and a tidy data set is created. It is sorted on subject and then activity, reporting the mean for each combination. This tidy set is written to the file tidy_dat_set.txt.

The relevant identifiers are the first three columns of the set: Subject, Activity (in words), and Activity (by number). Each other column is labeled as its particular measurement of mean or standard deviation.

