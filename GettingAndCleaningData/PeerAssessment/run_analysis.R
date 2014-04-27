library(gdata)
#read the data files
testDataX <- read.table("data/test/X_test.txt", header=FALSE)
testDataY <- read.table("data/test/y_test.txt", header=FALSE)
trainDataX <- read.table("data/train/X_train.txt", header=FALSE)
trainDataY <- read.table("data/train/y_train.txt", header=FALSE)
#read the activity factors
activities <- read.table("data/activity_labels.txt") 

#read the activity factors
features <- read.table("data/features.txt", stringsAsFactors=FALSE) 

#combine the train and test data frame (for X and Y)
completeX <- rbind(testDataX, trainDataX)
colnames(completeX) <- features[,2]
completeY <- rbind(testDataY, trainDataY)
completeY_Readable <- data.frame(Activity = factor(completeY$V1, labels=as.character(activities[,2])))

#get the mean and sd rows
tidyDataSet <- data.frame(completeY_Readable, completeX[, grepl("mean()|std()",colnames(completeX))])

write.csv(tidyDataSet, file="tidyDataSet.txt", row.names=FALSE)
