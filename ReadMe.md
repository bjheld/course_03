

A DESCRIPTION OF THE R PROGRAM: run_analysis.R FOLLOWED BY THE RELEVANT R CODE.

NOTE!!!:  It should be noted that this program assumes a current working directory entitled:
                 C:\\CLEANING DATA\\PROJECT

a) The first step is to determine if a directory called "data" exists.  This is where the downloaded file will be 
   copied to and unzipped.  If a directory called "data" is NOT found, it will be created.
   If a directory called "data" is already found, it will NOT be recreated.  

## CREATES A DIRECTORY IF ONE IS NOT FOUND
if (!file.exists("data")) {
   dir.create("data")
   }

b) The second step is to actually download the zipped file to the data directory mentioned in above 
   (C:\\CLEANING DATA\\PROJECT\\data)

## COPIED DONW THE RELEVANT ZIPPED FILE
fileURL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "C:\\CLEANING DATA\\PROJECT\\data\\data.zip")

c) After the zipped file is copied to the data directory, it needs to be unzipped

## UNPACKS THE ZIPPED FILE
unzip ("C:\\CLEANING DATA\\PROJECT\\data\\data.zip", files = NULL, list = FALSE, overwrite = TRUE,
             junkpaths = FALSE, exdir = ".", unzip = "internal", setTimes = FALSE)
             
d) After the data files are unzipped, the indvidual files of both the training data and test data are loaded into tables.

## LOADS THE TRAINING DATA
subject_train.tbl <- read.table("./UCI HAR Dataset/train/subject_train.txt")
y_train.tbl <- read.table("./UCI HAR Dataset/train/y_train.txt")
x_train.tbl <- read.table("./UCI HAR Dataset/train/x_train.txt")

## LOADS THE TEST DATA
subject_test.tbl <- read.table("./UCI HAR Dataset/test/subject_test.txt")
y_test.tbl <- read.table("./UCI HAR Dataset/test/y_test.txt")
x_test.tbl <- read.table("./UCI HAR Dataset/test/x_test.txt")

e) After loading the data files into tables, similar data (the x of test data and the x of training data; 
   the y of test data and the y of training data, and the subject_test and subject_training data) are unified
   by using the rbind (row bind) function.  Now there are 3 unified tables (total_x.tbl, total_y.tbl, and total_subject.tbl)

## PUTS THE SIMILAR DATA BETWEEN THE TEST AND TRAINING DATA TOGETHER
total_x.tbl <- rbind(x_test.tbl,x_train.tbl)
total_y.tbl <- rbind(y_test.tbl,y_train.tbl)
total_subject.tbl <- rbind(subject_test.tbl,subject_train.tbl)

f) The previous 3 files are then combined into a single file using the cbind (column bind) function 
   This creates a table with dimensions of 10,299 rows and 563 columns.

## COMBINES THE 3 PREVIOUS DATA FILES INTO A SINGLE DATA FILES
total_data.tbl <- cbind(total_subject.tbl,total_y.tbl,total_x.tbl)

g) Only the User_Id (column 1), Activity (column 2), and Mean and Standard Deviation measuments (other assorted columns) are kept.
   This creates a table with 10,299 rows and 68 columns.

## ONLY KEEPS THE ID, ACTIVITY, AND MEANS AND STD DEVIATIONS OF THE DIFFERENT MEASURMENTS
sub_data.tbl <- total_data.tbl[,c(1:8,43:48,83:88,123:128,163:168,203:204,216:217,229:230,242:243,255:256,268:269,270:273,347:352,426:431,505:506,518:519,531:532,544:545)]

h) The following establishes labels for the columns, as well as putting in English text in place of the numeric codes 
   found in the "Activity" column

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

i) This sorts the data file called sub_data.tbl by two variables, User_ID and Activity and creates a new file called
   order_data.tbl

## ARRANGES THE DATA (IN ASCENDING ORDER) FIRST ON USER_ID AND THEN ON ACTIVITY
 order_data.tbl <- sub_data.tbl[order(sub_data.tbl$User_ID, sub_data.tbl$Activity) , ]

j) This creates a summary table that creates a mean for the 66 mean and standard deviation columns for each unique
   User_ID and Activity.  There are 180 rows (30 unique IDs and 6 types of activity, 6 * 30 = 180) and 68 columns.

## CREATES A MEAN FOR COLUMNS 3 THROUGH 68 FOR EACH UNIQUE USER_ID AND ACTIVITY (180 ROWS IN TOTAL, 68 COLUMNS IN TOTAL)
ave_data.tbl <- aggregate(order_data.tbl[,3:68],order_data.tbl[1:2],mean)

k) This again sorts the newly created "average file" by User_ID and Activity

## ARRANGES THE DATA (IN ASCENDING ORDER) FIRST ON USER_ID AND THEN ON ACTIVITY
 ave_data.tbl <- ave_data.tbl[order(ave_data.tbl$User_ID, ave_data.tbl$Activity) , ]

l) This writes off the tidy data set (called tidy_data.txt)

## WRITES OFF TIDY DATA SET
write.table(ave_data.tbl, "tidy_data.txt", row.name=FALSE)