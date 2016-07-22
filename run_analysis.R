##############################
##Load files into memory
#
#Labels
activityLabels<- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)
features<- read.table("UCI HAR Dataset/features.txt", header = FALSE)

#Training Set
trainingSet<- read.table("UCI HAR Dataset/train/x_train.txt", header = FALSE)
trainingActivityLabels<- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
trainingSubjectID<- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)

#Test Set
testSet<- read.table("UCI HAR Dataset/test/x_test.txt", header = FALSE)
testActivityLabels<- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
testSubjectID<- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)


#Determine which features are a mean or std
#Use Regex to match mean() or std() in feature name
featuresMeanStd<-features[grep("mean\\(\\)|std\\(\\)", features[,2]),]

##Merge testSet with testSubjectID and TestActivityLabels
testComplete<-cbind( testSubjectID, testActivityLabels, testSet[,featuresMeanStd[,1]])

##Merge trainingSet with trainingSubjectID and trainingActivityLabels
trainingComplete<-cbind( trainingSubjectID, trainingActivityLabels, trainingSet[,featuresMeanStd[,1]])

#merge training and test datasets together
datasetComplete<-rbind(testComplete, trainingComplete)

#Names columns of the complete data set
colnames(datasetComplete)<-c("subjectid", "activitylabel", as.vector(featuresMeanStd[,2]))

#replace activity label with description from current numbers
datasetComplete$activitylabel <- activityLabels[,2][match(datasetComplete$activitylabel, activityLabels[,1])]

##################################
##Create second independant data
datasetTwo <- data.frame(matrix(ncol = 67, nrow = 0))

##get list of users
userList<-sort(unique(datasetComplete[,1]))
activityList<-sort(unique(datasetComplete[,2]))

##populate user means
for (user in userList){
  userSubset<-datasetComplete[datasetComplete[,1]==user,]
  userSubset[,2]<-NULL ##delete user column
  datasetTwo <- rbind(datasetTwo, colMeans(userSubset))
}

##populate activity means
for (activity in activityList){
  activitySubset<-datasetComplete[datasetComplete[,2]==activity,]
  userSubset[,1:2]<-NULL ##delete user column
  datasetTwo <- rbind(datasetTwo, c(activity, colMeans(userSubset)))
}

##Apply column names
colnames(datasetTwo)<-c("subjectId-Or-ActivityLabel", paste("Mean", as.vector(featuresMeanStd[,2]), sep = "-") )##Assign col names

########################
##Save Results to file
write.table(datasetComplete, file="tidyHAR.txt", row.name=FALSE)
write.table(datasetTwo, file="tidySecondaryHAR.txt", row.name=FALSE)
