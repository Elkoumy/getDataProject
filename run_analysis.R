
#reading the Train data
x<-read.table('UCI HAR Dataset\\train\\X_train.txt')

#reading the activitiy type
y<-read.table('UCI HAR Dataset\\train\\y_train.txt')


#adding the activity type to the final dataset
total<-cbind(x,y)
#reading subject_train
y<-read.table('UCI HAR Dataset\\train\\subject_train.txt')

#adding the subject train to the final dataset
total<-cbind(total,y)


#reading the test data
x<-read.table('UCI HAR Dataset\\test\\X_test.txt')


#reading the activitiy type
y<-read.table('UCI HAR Dataset\\test\\y_test.txt')

#adding the activity to the dataset
x<-cbind(x,y) 

#reading the subject test
y<-read.table('UCI HAR Dataset\\test\\subject_test.txt')

#adding the subject_test to the dataset
x<-cbind(x,y) 

#appeding the test to the final dataset
total<-rbind(total,x)



#reading the variable names 
varNames<-read.table('UCI HAR Dataset\\features.txt')
v1<-as.character(varNames[["V2"]])
v1<-c(v1,'subject','activity')

#assigning  the variable names to the dataset
names(total)<-v1



#reading activity lookup
activity<-read.table('UCI HAR Dataset\\activity_labels.txt')
names(activity)<-c('V1','activity')




#merging the dataset and the activity
final<-merge(total,activity,by.x="activity",by.y="V1")


#getting the required variables that contains mean and std
selectingVars<-c(v1[c(grep("Mean",v1),grep("std",v1))],"activity","subject")

#selecting using the required variables
final<-final[,selectingVars]


#making the summaries
library(reshape2)

#melting the dataset
melted<-melt(final,id=c("activity","subject"))

#calculating the mean
glData<-dcast(melted,activity+subject~variable)

#making the dataset
write.csv(glData,"meanofVariables.csv")

