library(dplyr)

# assume the unzipped files are saved under the "data" folder
setwd("./data")

# merge the subject_test.txt and y_test.txt data together and add an extra column indicating the data group 
testSubject <- read.table("./test/subject_test.txt")
names(testSubject) <- "subject"
testActivity <- read.table("./test/Y_test.txt")
names(testActivity) <- "activity"
testGroup <- data.frame(testSubject, testActivity, group = "test")

# merge the subject_train.txt and y_train.txt data together and add an extra column indicating the data group 
trainSubject <- read.table("./train/subject_train.txt")
names(trainSubject) <- "subject"
trainActivity <- read.table("./train/Y_train.txt")
names(trainActivity) <- "activity"
trainGroup <- data.frame(trainSubject, trainActivity, group = "train")

# merge testData and trainData
groupData <- rbind(testGroup, trainGroup)

# apply descriptive activity names to the "activity" column
activityLabels <- read.table("./activity_labels.txt", stringsAsFactors = FALSE) %>% arrange(V1)
groupData$activity <- as.factor(groupData$activity)
levels(groupData$activity) = activityLabels[ ,2]

# merge the X_train.txt and X_test.txt together
testFeatureData <- read.table("./test/X_test.txt")
trainFeatureData <- read.table("./train/X_train.txt")
featureData <- rbind(testFeatureData, trainFeatureData)
featureNames <- as.character(read.table("./features.txt")[, 2])
names(featureData) <- featureNames

# find features contain mean() or std()
meanAndStdCols <- grepl("(mean|std)\\(\\)", featureNames)

# create a subset of features data
subFeatureData <- featureData[,meanAndStdCols]

# combine subject, activity, group and feature data together
data <- data.frame(groupData, subFeatureData)
names(data) <- gsub("..", "", names(data), fixed = TRUE)

aveData <- data %>% 
  group_by(activity, subject) %>%
  summarise_each(funs(mean), matches("mean|std\\("))

write.table(aveData, "../tidy_data.txt", sep = ",", row.names = FALSE)
