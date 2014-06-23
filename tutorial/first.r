#####################################
#basics of R programming language
#author : Z.B.Celik
#Date   : 06/22/2014
#####################################

#INTRODUCTION
#use R as an calculator
1+1
2+2

#we can add new packages byr packages>install
#check if packages are installed or not
library(ggplot2)
require(coefplot)

#assigning variables
z -> 3
z <- 4
z+5
y=5
assign ("age",19)
rm(z)
z
age

#text data
x <- "data"
class(x)
nchar(x)
nchar("hello")

#logical
k <- FALSE
is.logical(k)
is.logical(x)

2==3
5>8
5>=10



#DATA STRUCTURES: Vector, Data Frame, List, Matrix ,Array, Factor 
#vectors
x <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
x*3
x^2
sqrt(x)

y <- 1:10
y
y <-10:1
y
x+y

length(x)
length(y)
length(x+y)
#if vectors are not same in size:
#adding sequentially
x <- 1:4
x + c (1,2)
x
#using any and all
x <- c(1:10)
y <- c(-4:5)
x
y

x>y
any(x>y)
all(x>y)
#useful properties with text
q <- c("Istanbul", "London", "Paris", "London")
qFactor <- factor (q)
qFactor
as.numeric(qFactor)

#missing data
#it is important in statistics to specify the missing data
z <- c(1,2,NA,8,3,NA,3)
is.na(z)

#calling Functions
x <- c(1:10)
mean(x)
sum(x)
nchar(x)
mean(x=x, trim = .1)

#insert NA to x vector
x[c(2,6)] = NA
#now our data have missing values
mean(x)
mean(x,na.rm = TRUE)
#1-Data frames
x <- c(1:10)
y <- c(-4:5)
q <- c("Hockey","Football","Baseball","Curling","Rugby","Lacrosse","Basketball","Tennis","Cricket","Socccer")
length(q)

theDF <- data.frame(x,y,q)
theDF
theDF <- data.frame(first=x, second=y, sport=q)
theDF

rownames(theDF)
names(theDF)
names(theDF) <- c(first=First, second=Second, sport=Sport)

head(theDF, n = 10)
tail(theDF, n = 8)

theDF$sport
theDF[1,3]
#IMPORTANT, DO NOT FACTOR TEXT DATA
theDF <- data.frame(first=x, second=y, sport=q, stringsAsFactors = FALSE)
theDF[1,3]

class(theDF[1,2:3])

theDF[1:2,3]

theDF[c(1:3),2:3]
class(theDF[,3])

#now type is dataframe
theDF[,3, drop=FALSE]
#we can use the column names assigned by us
theDF[, c("sport", "first")]

#2-Lists
dataFrame <- data.frame(c(1:3),c(1:3),c("Istanbul","London","Paris"))
dataFrame <- data.frame(First=c(1:3),Second=c(1:3)^2,City=c("Istanbul","London","Paris"))
dataFrame

list <-list(dataFrame,c(1:10),c(1:3))
names(list)
names(list)<- c("dataframe","vector1","vector2")
list[1]
list[[1]][1 ,]

#add new object to list
list[[4]] <- c(1:5)
names(list)<- c("dataframe","vector1","vector2","vector3")
names(list)

#manipulate vector3
list[[4]][1:5]
#add another object to list
list[["newVector"]] <- c(-2:-10)
list

#3-Matices (similar to data frames but needs to store same type)
A <- matrix (1:10, nrow=5)
A
B <- matrix (21:30, nrow=5)
B
A+B
A%*%t(B)
colnames(A)
colnames(A)<- c("left","right")
A
rownames(A)<- c("1","2","3","4","5")
A
c(1:3)

