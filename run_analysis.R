
library(plyr)

## CREATES A DIRECTORY IF ONE IS NOT FOUND
if (!file.exists("data")) {
   dir.create("data")
   }

## COPIED DONW THE RELEVANT ZIPPED FILE
fileURL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "C:\\CLEANING DATA\\PROJECT\\data\\data.zip")

## UNPACKS THE ZIPPED FILE
unzip ("C:\\CLEANING DATA\\PROJECT\\data\\data.zip", files = NULL, list = FALSE, overwrite = TRUE,
             junkpaths = FALSE, exdir = ".", unzip = "internal", setTimes = FALSE)
             

## LOADS THE TRAINING DATA
subject_train.tbl <- read.table("./UCI HAR Dataset/train/subject_train.txt")
y_train.tbl <- read.table("./UCI HAR Dataset/train/y_train.txt")
x_train.tbl <- read.table("./UCI HAR Dataset/train/x_train.txt")

## LOADS THE TEST DATA
subject_test.tbl <- read.table("./UCI HAR Dataset/test/subject_test.txt")
y_test.tbl <- read.table("./UCI HAR Dataset/test/y_test.txt")
x_test.tbl <- read.table("./UCI HAR Dataset/test/x_test.txt")

## PUTS THE SIMILAR DATA BETWEEN THE TEST AND TRAINING DATA TOGETHER
total_x.tbl <- rbind(x_test.tbl,x_train.tbl)
total_y.tbl <- rbind(y_test.tbl,y_train.tbl)
total_subject.tbl <- rbind(subject_test.tbl,subject_train.tbl)

## COMBINES THE 3 PREVIOUS DATA FILES INTO A SINGLE DATA FILES
total_data.tbl <- cbind(total_subject.tbl,total_y.tbl,total_x.tbl)

## ONLY KEEPS THE ID, ACTIVITY, AND MEANS AND STD DEVIATIONS OF THE DIFFERENT MEASURMENTS
sub_data.tbl <- total_data.tbl[,c(1:8,43:48,83:88,123:128,163:168,203:204,216:217,229:230,242:243,255:256,268:269,270:273,347:352,426:431,505:506,518:519,531:532,544:545)]

## PUTS IN DESCRIPTIVE LABELS FOR THE COLUMNS
colnames(sub_data.tbl)[1] <- 'User_ID'
colnames(sub_data.tbl)[2] <- 'Activity'
colnames(sub_data.tbl)[3] <- 'tBodyAcc-mean()-X'
colnames(sub_data.tbl)[4] <- 'tBodyAcc-mean()-Y'
colnames(sub_data.tbl)[5] <- 'tBodyAcc-mean()-Z'
colnames(sub_data.tbl)[6] <- 'tBodyAcc-std()-X'
colnames(sub_data.tbl)[7] <- 'tBodyAcc-std()-Y'
colnames(sub_data.tbl)[8] <- 'tBodyAcc-std()-Z'
colnames(sub_data.tbl)[9] <- 'tGravityAcc-mean()-X'
colnames(sub_data.tbl)[10] <- 'tGravityAcc-mean()-Y'
colnames(sub_data.tbl)[11] <- 'tGravityAcc-mean()-Z'
colnames(sub_data.tbl)[12] <- 'tGravityAcc-std()-X'
colnames(sub_data.tbl)[13] <- 'tGravityAcc-std()-Y'
colnames(sub_data.tbl)[14] <- 'tGravityAcc-std()-Z'
colnames(sub_data.tbl)[15] <- 'tBodyAccJerk-mean()-X'
colnames(sub_data.tbl)[16] <- 'tBodyAccJerk-mean()-Y'
colnames(sub_data.tbl)[17] <- 'tBodyAccJerk-mean()-Z'
colnames(sub_data.tbl)[18] <- 'tBodyAccJerk-std()-X'
colnames(sub_data.tbl)[19] <- 'tBodyAccJerk-std()-Y'
colnames(sub_data.tbl)[20] <- 'tBodyAccJerk-std()-Z'
colnames(sub_data.tbl)[21] <- 'tBodyGyro-mean()-X'
colnames(sub_data.tbl)[22] <- 'tBodyGyro-mean()-Y'
colnames(sub_data.tbl)[23] <- 'tBodyGyro-mean()-Z'
colnames(sub_data.tbl)[24] <- 'tBodyGyro-std()-X'
colnames(sub_data.tbl)[25] <- 'tBodyGyro-std()-Y'
colnames(sub_data.tbl)[26] <- 'tBodyGyro-std()-Z'
colnames(sub_data.tbl)[27] <- 'tBodyGyroJerk-mean()-X'
colnames(sub_data.tbl)[28] <- 'tBodyGyroJerk-mean()-Y'
colnames(sub_data.tbl)[29] <- 'tBodyGyroJerk-mean()-Z'
colnames(sub_data.tbl)[30] <- 'tBodyGyroJerk-std()-X'
colnames(sub_data.tbl)[31] <- 'tBodyGyroJerk-std()-Y'
colnames(sub_data.tbl)[32] <- 'tBodyGyroJerk-std()-Z'
colnames(sub_data.tbl)[33] <- 'tBodyAccMag-mean()'
colnames(sub_data.tbl)[34] <- 'tBodyAccMag-std()'
colnames(sub_data.tbl)[35] <- 'tGravityAccMag-mean()'
colnames(sub_data.tbl)[36] <- 'tGravityAccMag-std()'
colnames(sub_data.tbl)[37] <- 'tBodyAccJerkMag-mean()'
colnames(sub_data.tbl)[38] <- 'tBodyAccJerkMag-std()'
colnames(sub_data.tbl)[39] <- 'tBodyGyroMag-mean()'
colnames(sub_data.tbl)[40] <- 'tBodyGyroMag-std()'
colnames(sub_data.tbl)[41] <- 'tBodyGyroJerkMag-mean()'
colnames(sub_data.tbl)[42] <- 'tBodyGyroJerkMag-std()'
colnames(sub_data.tbl)[43] <- 'fBodyAcc-mean()-X'
colnames(sub_data.tbl)[44] <- 'fBodyAcc-mean()-Y'
colnames(sub_data.tbl)[45] <- 'fBodyAcc-mean()-Z'
colnames(sub_data.tbl)[46] <- 'fBodyAcc-std()-X'
colnames(sub_data.tbl)[47] <- 'fBodyAcc-std()-Y'
colnames(sub_data.tbl)[48] <- 'fBodyAcc-std()-Z'
colnames(sub_data.tbl)[49] <- 'fBodyAccJerk-mean()-X'
colnames(sub_data.tbl)[50] <- 'fBodyAccJerk-mean()-Y'
colnames(sub_data.tbl)[51] <- 'fBodyAccJerk-mean()-Z'
colnames(sub_data.tbl)[52] <- 'fBodyAccJerk-std()-X'
colnames(sub_data.tbl)[53] <- 'fBodyAccJerk-std()-Y'
colnames(sub_data.tbl)[54] <- 'fBodyAccJerk-std()-Z'
colnames(sub_data.tbl)[55] <- 'fBodyGyro-mean()-X'
colnames(sub_data.tbl)[56] <- 'fBodyGyro-mean()-Y'
colnames(sub_data.tbl)[57] <- 'fBodyGyro-mean()-Z'
colnames(sub_data.tbl)[58] <- 'fBodyGyro-std()-X'
colnames(sub_data.tbl)[59] <- 'fBodyGyro-std()-Y'
colnames(sub_data.tbl)[60] <- 'fBodyGyro-std()-Z'
colnames(sub_data.tbl)[61] <- 'fBodyAccMag-mean()'
colnames(sub_data.tbl)[62] <- 'fBodyAccMag-std()'
colnames(sub_data.tbl)[63] <- 'fBodyBodyAccJerkMag-mean()'
colnames(sub_data.tbl)[64] <- 'fBodyBodyAccJerkMag-std()'
colnames(sub_data.tbl)[65] <- 'fBodyBodyGyroMag-mean()'
colnames(sub_data.tbl)[66] <- 'fBodyBodyGyroMag-std()'
colnames(sub_data.tbl)[67] <- 'fBodyBodyGyroJerkMag-mean()'
colnames(sub_data.tbl)[68] <- 'fBodyBodyGyroJerkMag-std()'


## RECODES FOR ACTIVITY
sub_data.tbl$Activity[sub_data.tbl$Activity==1] <- "WALKING"
sub_data.tbl$Activity[sub_data.tbl$Activity==2] <- "WALKING_UPSTAIRS"
sub_data.tbl$Activity[sub_data.tbl$Activity==3] <- "WALKING_DOWNSTAIRS"
sub_data.tbl$Activity[sub_data.tbl$Activity==4] <- "SITTING"
sub_data.tbl$Activity[sub_data.tbl$Activity==5] <- "STANDING"
sub_data.tbl$Activity[sub_data.tbl$Activity==6] <- "LAYING"

## ARRANGES THE DATA (IN ASCENDING ORDER) FIRST ON USER_ID AND THEN ON ACTIVITY
 order_data.tbl <- sub_data.tbl[order(sub_data.tbl$User_ID, sub_data.tbl$Activity) , ]

## CREATES A MEAN FOR COLUMNS 3 THROUGH 68 FOR EACH UNIQUE USER_ID AND ACTIVITY (180 ROWS IN TOTAL, 68 COLUMNS IN TOTAL)
ave_data.tbl <- aggregate(order_data.tbl[,3:68],order_data.tbl[1:2],mean)

## ARRANGES THE DATA (IN ASCENDING ORDER) FIRST ON USER_ID AND THEN ON ACTIVITY
 ave_data.tbl <- ave_data.tbl[order(ave_data.tbl$User_ID, ave_data.tbl$Activity) , ]

## WRITES OFF TIDY DATA SET
write.table(ave_data.tbl, "tidy_data.txt", row.name=FALSE)