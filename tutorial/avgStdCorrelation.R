#####################################
#Basics Statistics, calculating averages, standard deviation and correlation
#author : Z.B.Celik
#Date   : 06/24/2014
#####################################

#first create a sample of numbers
x1 <- rnorm(100)
x1 <- sample(1:100)
x1
y1<-as.factor(x1)

x<- sample(x=1:100, size=100, replace=TRUE)
x
y<- as.factor(x)

mean(x)
median(x)
#we may have some missing data, let's create one
y<-x
y[sample(x=1:100,size=20,replace=FALSE)] <-NA
y
mean(y) #output wiLL be NA
mean(y, na.rm=TRUE)

#weighted average, expected mean
grades <- c(95, 72, 87, 66)
grades
weights <- c(1/2,1/4,1/8,1/8)

weighted.mean(x = grades, w = weights)
mean(x)
var(x)
#calculate variance by hand
sum((x-mean(x))^2)/(length(x)-1)
sqrt(var(x))
sd(x)

sum(x)
min(x)
max(x)

#summary statistics
summary(x)
summary(y)

#correlation:
head(economics)
cor(economics$pce, economics$psavert)
econCor<-cor(economics[, c(2,4:6)])
require(reshape2)
econMelt <- melt(econCor, varnames =c ("x","y"), value.name = "Corelation")
head(econMelt)
econMelt[1,1:3]
econMelt <- econMelt[order(econMelt$Correlation), ]

ggplot(data=econMelt, aes(x=x, y=y)) + geom_tile (aes(fill=Corelation)) + labs(x=NULL, y=NULL)+ 
    scale_fill_gradient2(limits=c(-1,1), low=("red"), mid = "white", high = "steelblue")
#dealing with missed data in correlation
#waiting...
