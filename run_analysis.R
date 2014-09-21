#Read in features.txt
allFeatures <- read.delim(file = "UCI HAR Dataset/features.txt", sep = " ", header = FALSE)
fil <- grep(pattern = "mean|std", x = allFeatures$V2, value = T)

filFeatures <- allFeatures[allFeatures$V2 %in% fil,]

#Read in Test and Training datasets
testActivities = read.delim(file = "UCI HAR Dataset/test/y_test.txt", header = FALSE, sep = "")
testDataSet = read.delim(file = "UCI HAR Dataset/test/X_test.txt", header = FALSE, sep = "")
testSubjects = read.delim(file = "UCI HAR Dataset/test/subject_test.txt", header = FALSE, sep = "")

trainActivities = read.delim(file = "UCI HAR Dataset/train/y_train.txt", header = FALSE, sep = "")
trainDataSet = read.delim(file = "UCI HAR Dataset/train/X_train.txt", header = FALSE, sep = "")
trainSubjects = read.delim(file = "UCI HAR Dataset/train/subject_train.txt", header = FALSE, sep = "")

# 1. Merge Test and Train datasets
fitnessData <- rbind(trainDataSet, testDataSet)
activityData <- rbind(trainActivities, testActivities)
subjectData <- rbind(trainSubjects, testSubjects)

# 2. Remove non mean and std cols
fitnessData <- fitnessData[,filFeatures$V1]

activityCodes <- read.delim(file = "UCI HAR Dataset/activity_labels.txt", sep = "", header = F)

#Convert to vector for O(1) lookup by index
activityCodes <- as.vector(activityCodes$V2)
activityData <- as.vector(activityData)

# 3. Create a vector with descriptive activity names
activityLabels <- vector()
activityLabels <- as.character(activityLabels)
for(activityCode in activityData){
  activityCodeLabel <- activityCodes[activityCode]
  activityLabels <- append(activityLabels, activityCodeLabel)
}

# 4. Give the fitnessData set descriptive names
colnames(fitnessData) <- filFeatures$V2

# 5. Create tidy fitnessData set with the average of each variable for each activity and each subject.
# Append the activities and subjects as additional columns to the fitnessData frame
fitnessData$activityType <- activityLabels
fitnessData$subject <- subjectData$V1

#Aggregate average per subject and activity
library(plyr)
tidyFitnessDataSet <- ddply(fitnessData, .(subject, activityType), colwise(mean))

write.table(x = tidyFitnessDataSet, file = "tidyAggData.txt", row.name = F)
