#Setting the working directory
setwd("C:/Users/rohit/Desktop/Coursera Data Science Specialization/Getting and Cleaning Data/UCI HAR Dataset")



#Read and combine the test and train datasets

subject=read.table("./test/subject_test.txt")
temp=read.table("./train/subject_train.txt")
subject=rbind(subject,temp)

X=read.table("./test/X_test.txt")
temp=read.table("./train/X_train.txt")
X=rbind(X,temp)


y=read.table("./test/y_test.txt")
temp=read.table("./train/y_train.txt")
y=rbind(y,temp)


#Assign the feature names

features=read.table("./features.txt")
names(X)=features$V2
meancols=grep("mean()",names(X))
stdcols=grep("std()",names(X))
data=cbind(X[,meancols], X[,stdcols])

activities=read.table("./activity_labels.txt")
activities$V2=sub("_", " ", activities$V2)



data$activity=y$V1
data$subject=subject$V1
a=aggregate(data[,-which(names(data) %in% c("subject", "activity"))],by=list(data$subject, data$activity), FUN=mean)
names(a)[1]="subject"
names(a)[2]="activity"

#Tidy data
a_melt=melt(a,id=1:2)

c=data.frame=matrix(NA,nrow=nrow(a_melt), ncol=7)
names(c)=c("Domain","Acceleration","Instrument", "Magnitude", "Jerk", "Axis", "function")
a_melt=cbind(a_melt,c)
names(a_melt)[5:11]=names(c)

for(i in 1:nrow(a_melt)){
            if(grepl("^t",a_melt[i,"variable"])==T){a_melt[i,"Domain"]="Time"} else {a_melt[i,"Domain"]="Frequency"}
            
              if(grepl("Body",a_melt[i,"variable"])==T){a_melt[i,"Acceleration"]="Body"} else {a_melt[i,"Acceleration"]="Gravity"}
            
              if(grepl("Acc",a_melt[i,"variable"])==T){a_melt[i,"Instrument"]="Accelerometer"} else {a_melt[i,"Instrument"]="Gyroscope"}
            
              if(grepl("Mag",a_melt[i,"variable"])==T){a_melt[i,"Magnitude"]="Magnitude"} else  {a_melt[i,"Magnitude"]=NA}
            
              if(grepl("Jerk",a_melt[i,"variable"])==T){a_melt[i,"Jerk"]="Jerk"} else {a_melt[i,"Jerk"]=NA}
            
              if(grepl("mean()",a_melt[i,"variable"])==T){a_melt[i,"function"]="mean"} else {a_melt[i,"function"]="std"}
            
              if(grepl("-X",a_melt[i,"variable"])==T){a_melt[i,"Axis"]="X"} 
              if(grepl("-Y",a_melt[i,"variable"])==T){a_melt[i,"Axis"]="Y"}
              if(grepl("-Z",a_melt[i,"variable"])==T){a_melt[i,"Axis"]="Z"}
            
         i=i+1
}

final=merge(activities, a_melt, by.x="V1", by.y="activity")
names(final)[2]="activity"
final=subset(final, select=c(2:3,6:12,5))
final=as.data.frame(unclass(final))

#Final output
return(final)
write.table(final, "averages by subject and activity.txt",row.names=FALSE)
