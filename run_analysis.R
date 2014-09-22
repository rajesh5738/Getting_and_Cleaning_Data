##Step1: read training and test files and create training and test data
#read training subject
trainingSubject = read.table("UCI HAR Dataset/train/subject_train.txt", col.names=c("subject_id"))
#assign row number as id
trainingSubject$ID <- as.numeric(rownames(trainingSubject)) 
#read x_train data
X_train = read.table("UCI HAR Dataset/train/X_train.txt")
#assign row number as id
X_train$ID <- as.numeric(rownames(X_train))
#read y_train data
y_train = read.table("UCI HAR Dataset/train/y_train.txt", col.names=c("activity_id"))  
#assign row number as id
y_train$ID <- as.numeric(rownames(y_train))
#merge trainingSubject and y_train
trainingData <- merge(trainingSubject, y_train, all=TRUE)
#merge X_train with the trainingData to create overall training data
trainingData <- merge(trainingData, X_train, all=TRUE)
#read test subjects
testSubject = read.table("UCI HAR Dataset/test/subject_test.txt", col.names=c("subject_id"))
#assign row number as id
testSubject$ID <- as.numeric(rownames(testSubject))
#read X_test data
X_test = read.table("UCI HAR Dataset/test/X_test.txt")
#assign row number as id
X_test$ID <- as.numeric(rownames(X_test))
#read y_test data
y_test = read.table("UCI HAR Dataset/test/y_test.txt", col.names=c("activity_id"))  # max = 6
#assign row number as id
y_test$ID <- as.numeric(rownames(y_test))
#merge testSubject and y_test
testData <- merge(testSubject, y_test, all=TRUE) 
#merge testData with X_test to create complete test Data
testData <- merge(testData, X_test, all=TRUE) 

#Step2: merge training and test data to create complete data
completeData <- rbind(trainingData, testData)

##Step3: select only mean and std
#read features data
features = read.table("UCI HAR Dataset/features.txt", col.names=c("feature_id", "feature_label"),) 
#select only mean and std data for each measurnment
selectedFeatures <- features[grepl("mean\\(\\)", features$feature_label) | grepl("std\\(\\)", features$feature_label), ]
#create set of mean and std data
meanStdData <- completeData[, c(c(1, 2, 3), selectedFeatures$feature_id + 3) ]

##Step4: assign descriptive labels
#read activity lables data
activityLabels = read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("activity_id", "activity_label"),)
#merge meanSdtData with activtyLabels
namedData = merge(meanStdData, activityLabels)
#label data set with descriptive activity name
selectedFeatures$feature_label = gsub("\\(\\)", "", selectedFeatures$feature_label)
selectedFeatures$feature_label = gsub("-", ".", selectedFeatures$feature_label)
for (i in 1:length(selectedFeatures$feature_label)) {colnames(namedData)[i + 3] <- selectedFeatures$feature_label[i] }
cols <- c("ID","activity_label")
##Step5: create final data
finalData <- namedData[,!(names(namedData) %in% cols)]
##Step6:create tidy data
aggregateData <-aggregate(finalData, by=list(subject = finalData $subject_id, activity = finalData $activity_id), FUN=mean, na.rm=TRUE)
cols <- c("subject","activity")
aggregateData <- aggregateData[,!(names(aggregateData) %in% cols)]
aggregateData = merge(aggregateData, activityLabels)
#Step6: write final tidy data to a file  
write.table(aggregateData, './tidyData.txt',row.names=FALSE,sep='\t');
