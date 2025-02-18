#Data cleaning in R 
#Data Handling and Data cleaning in R

library(wooldridge)

data=attend
head(data)

?attend
View(data)

dim(data)
summary(data)
str(data)
colnames(data)
rownames(data)
##Changing names of columns
colnames(data)
colnames(data)[4]
colnames(data)[4]="score"
colnames(data)
colnames(data)[10]
colnames(data)[10]="missed_class"
colnames(data)
colnames(data)[5]
colnames(data)[5]="mark"
colnames(data)
##End

##Cleaning the Dataframe
x=c(0,NA,5,8,7,-0.9,0.33)
x
str(x)
class(x)
mean(x)
mode(x)
sd(x)
is.na(x)

x>2 #compares each element of vector x with 2

x>2 & !is.na(x) #compares all elements but ignores the NA value

#----Detour:Let's also check '|' (or) operator----#
(x==0 | x==2)
(x==0 | x==2) & !is.na(x)
#----End of Detour----#

head(data)
is.na(data) #detects NA in each cell for the dataset
sum(is.na(data)) #sums all NAs

na_rows = which(!complete.cases(data)) #Identifies rows with NA
print(na_rows) #prints row numbers

data1=data
data1[is.na(data)]=0 #setting NAs to 0
sum(is.na(data1))
data1$hwrte
mean(data1$hwrte)
mean(data$hwrte)

##Handling observations
df=data.frame(roll_no=c(NA,1,2),score=c("One",NA,"Three"))
df              
subset(df,!is.na(roll_no)) 
subset(df,!is.na(score))
subset(df,complete.cases(df))

subset(data,complete.cases(data)) #remove all NA from data set and 
data2=subset(data,complete.cases(data)) #store NA less subset into variable data2
data2
sum(is.na(data2))
mean(data2$hwrte)
data3=na.omit(data) #simplest function to get rid of all NA
sum(is.na(data3))

##Working without NAs
library(car)
?Freedman
View(data)

data=Freedman
head(data)
str(data)
summary(data)

mean(data$nonwhite)
mean(data$density)
mean(data$population)

mean(data$population,na.rm=T) #removes the NA row
mean(data$density,na.rm=T) #removes the NA row

data2=na.omit(data)
summary(data2) #Problem here is that the command removes all NA rows

###Checking the NA rows
data_NA_rows=data[!complete.cases(data),]
data_NA_rows
head(data_NA_rows)

## Dealing with outliers
library(UsingR)
library(stargazer)
?babies
dim(babies)

data=babies
summary(data)
head(data)

library(dplyr)

data=data %>% mutate(dwt_kg=ceiling(dwt/2.2046)) #Adds a new column 

baby_dad_wt=data$dwt_kg
baby_dad_wt

baby_dad_wt[baby_dad_wt == 454] = NA
summary(baby_dad_wt)
range(baby_dad_wt)
range(baby_dad_wt,na.rm=T)
