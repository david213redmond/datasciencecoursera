##1.merge the training and testing datasets.
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

x <- rbind(x_train,x_test)
y <- rbind(y_train,y_test)
subject <- rbind(subject_train,subject_test)

##2.extract the mean and standard deviation for the measurements.
mean_x <-apply(x,1,mean)
sd_x <- apply(x,1,sd)


##3.construct descriptive activity names 
act_labels = c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
assign<- function(l){
  act_labels[l]
}
activities <- apply(y,1,assign)

##4&5. appropriately label the dataset
##and create the data frame for the tidy dataset.
df <- data.frame(average=mean_x,
                 sd=sd_x, 
                 activity=activities, 
                 stringsAsFactors=FALSE)
write.table(df,"tidy_data.txt")