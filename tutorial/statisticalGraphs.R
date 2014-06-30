#####################################
#Statistical graphs with ggplot2
#author : Z.B.Celik
#Date   : 06/23/2014
#####################################
require (ggplot2)
data(diamonds)
diamonds
#basics of our data
head(diamonds)
NCOL(diamonds)
NROW(diamonds)
class(diamonds)

#1 Histogram
hist(diamonds$carat, xlab = "carat", col = "blue", main = "Histogram Plot of carat column", ylab="frequency")

#2 Scatter Plot
plot( diamonds$carat, diamonds$price) 
plot (price ~ carat, data=diamonds, main="price vs carat")

#3-boxplot
boxplot(diamonds$carat)

#More about ggplot2
#ggplot(data) + geom_point(aes(x,y))

#4-density plot
ggplot(data=diamonds) + geom_histogram(aes(x=carat), binwidth=0.5)
ggplot(data=diamonds) + geom_histogram(aes(x=carat), binwidth=0.1, main="carat histogram", xlab="x")
#density 1d kernel density estimate
ggplot(data=diamonds) + geom_density(aes(x=carat), fill="grey50")

#5 scatter plots with ggplot
ggplot(data=diamonds) + geom_point(aes(x=carat,y=price))+ aes(color=color) + aes(shape=cut)
ggplot(diamonds, aes(y=price, x=carat))+geom_point()

#6 boxplots with ggplot
ggplot(data=diamonds) + geom_boxplot(aes(y=carat,x=1))
#or we can write
ggplot(diamonds, aes(y=carat,x=1)) + geom_boxplot()
ggplot(diamonds,aes(y=carat,x=cut)) + geom_boxplot()
#in order to not to write over and over for more than one graph in same figure
g <- ggplot(diamonds, aes(y=carat,x=cut))
g + geom_violin() + geom_point()
#we may need to add some jitter
g + geom_jitter() + geom_violin()

#7 line plots
head(economics)
NCOL(economics)
NROW(economics)
ggplot(economics, aes(x=date,y=pop))+geom_line()
#how can we get the year and month from date
require(lubridate)
economics$year <- year(economics$date)
economics$month <- month(economics$date)
head(economics,n = 10)
#two new columns are added as year and month
#now find the year that are greater than 2000
econ2000 <- economics[which(economics$year>2000), ]
nrow(econ2000)
head (econ2000)
#make the months as Jan, Feb etc.
econ2000$month <- month(econ2000$date, label=TRUE)
head(econ2000)

#getting more interpretation with facet_wrap() and facet_grid()
g<- ggplot(data=diamonds, aes(x=carat, y=price)) 
g+geom_point(aes(color=color)) + facet_wrap(~cut)

g + geom_point(aes(color=color)) + facet_grid(cut~clarity)

ggplot(data=diamonds, aes(x=carat)) + geom_histogram(aes(color=color))+facet_wrap(~color)+
    scale_color_discrete() +
    scale_fill_discrete() 

#controlling colors
ggplot(data=diamonds, aes(x=carat,y=price, color=color, shape=cut, size=depth)) + geom_point()

#Adding themes to graphs

