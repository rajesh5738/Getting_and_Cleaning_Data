CodeBook
========
##Description
This code book contains information about variables, data and operations used to get and clean data set operation.
##Variables
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag.
In short, for this derived dataset, these signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
•	tBodyAcc-XYZ
•	tGravityAcc-XYZ
•	tBodyAccJerk-XYZ
•	tBodyGyro-XYZ
•	tBodyGyroJerk-XYZ
•	tBodyAccMag
•	tGravityAccMag
•	tBodyAccJerkMag
•	tBodyGyroMag
•	tBodyGyroJerkMag
•	fBodyAcc-XYZ
•	fBodyAccJerk-XYZ
•	fBodyGyro-XYZ
•	fBodyAccMag
•	fBodyAccJerkMag
•	fBodyGyroMag
•	fBodyGyroJerkMag
The set of variables that were estimated (and kept for this assignment) from these signals are:
•	mean(): Mean value
•	std(): Standard deviation
Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle () variable:
•	gravityMean
•	tBodyAccMean
•	tBodyAccJerkMean
•	tBodyGyroMean
•	tBodyGyroJerkMean
##Data
The data was provided by Smartlab, which is collected through an experiment called Human Activity Recognition Using Smartphones. The data was collected from the accelerometers from the Samsung Galaxy S smartphone. A full description about the collection procedure of data and other related information about experiment is available at below link:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

the project data can be obtained from below link: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
##Operations
1.	Data was read from following files:
•	features.txt
•	activity_labels.txt
•	subject_train.txt
•	x_train.txt
•	y_train.txt
•	subject_test.txt
•	x_test.txt
•	y_test.txt
2. Training and test data were merged
3. Data set with measurements on the mean and standard deviation for each measurement was created
4. Descriptive activity names were assigned to name the activities in the data set
5. An independent tidy data set with the average of each variable for each activity and each subject was created.
