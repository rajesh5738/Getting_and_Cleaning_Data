#Step1: read training and test files and create training and test data
trainingSubject = read.table("UCI HAR Dataset/train/subject_train.txt", col.names=c("subject_id"))
trainingSubject$ID <- as.numeric(rownames(trainingSubject)) 
X_train = read.table("UCI HAR Dataset/train/X_train.txt")
X_train$ID <- as.numeric(rownames(X_train))
y_train = read.table("UCI HAR Dataset/train/y_train.txt", col.names=c("activity_id"))  
y_train$ID <- as.numeric(rownames(y_train))
trainingData <- merge(trainingSubject, y_train, all=TRUE)
trainingData <- merge(trainingData, X_train, all=TRUE)
testSubject = read.table("UCI HAR Dataset/test/subject_test.txt", col.names=c("subject_id"))
testSubject$ID <- as.numeric(rownames(testSubject))
X_test = read.table("UCI HAR Dataset/test/X_test.txt")
X_test$ID <- as.numeric(rownames(X_test))
y_test = read.table("UCI HAR Dataset/test/y_test.txt", col.names=c("activity_id"))  # max = 6
y_test$ID <- as.numeric(rownames(y_test))
testData <- merge(testSubject, y_test, all=TRUE) 
testData <- merge(testData, X_test, all=TRUE) 

#Step2: merge training and test data
completeData <- rbind(trainingData, testData)

#Step3: select only mean and std
features = read.table("UCI HAR Dataset/features.txt", col.names=c("feature_id", "feature_label"),) 
selectedFeatures <- features[grepl("mean\\(\\)", features$feature_label) | grepl("std\\(\\)", features$feature_label), ]
meanStdData <- completeData[, c(c(1, 2, 3), selectedFeatures$feature_id + 3) ]

#Step4: assign descriptive labels
activityLabels = read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("activity_id", "activity_label"),)
namedData = merge(meanStdData, activityLabels)
selectedFeatures$feature_label = gsub("\\(\\)", "", selectedFeatures$feature_label)
selectedFeatures$feature_label = gsub("-", ".", selectedFeatures$feature_label)
for (i in 1:length(selectedFeatures$feature_label)) {colnames(namedData)[i + 3] <- selectedFeatures$feature_label[i] }
cols <- c("ID","activity_label")
#Step5: create final data
finalData <- namedData[,!(names(namedData) %in% cols)]
aggregateData <-aggregate(finalData, by=list(subject = finalData $subject_id, activity = finalData $activity_id), FUN=mean, na.rm=TRUE)
cols <- c("subject","activity")
aggregateData <- aggregateData[,!(names(aggregateData) %in% cols)]
aggregateData = merge(aggregateData, activityLabels)
#Step6: write final tidy data to a file  
write.table(aggregateData, './tidyData.txt',row.names=TRUE,sep='\t');
