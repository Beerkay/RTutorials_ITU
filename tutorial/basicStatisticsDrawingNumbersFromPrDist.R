#####################################
#Basics Statistics, Drawing Numbers From Probability Distributions
#author : Z.B.Celik
#Date   : 06/23/2014
#####################################
#1- Normal Distribution
#functions: rnorm(), dnorm(), pnorm(), qnorm()
require (ggplot2)
randomNormalDist <- rnorm(3000) #~N(u=0,sd=1)
randomNormalDist
#check if our data comes from a normal dist, normality test by shapiro-wilk
shapiro.test(randomNormalDist)

randomNormalDensity <- dnorm(randomNormalDist)
randomNormalDensity
myData <- data.frame(randomNormalDist,randomNormalDensity)
colnames(myData) <- c("x","probability")
myData
graph <- ggplot(data=myData, aes(x=x,y=probability)) 
graph <- graph + labs(x="random variable", y="Density")
graph + geom_point()

pnorm(c(-2,-3,0,2,3))

myrandomNumbersNormal5 <- rnorm(5)
myrandomNumbersNormal5
pnorm(myrandomNumbersNormal5)
qnorm(pnorm(myrandomNumbersNormal5))
identical(myrandomNumbersNormal5, qnorm(pnorm(myrandomNumbersNormal5)))

#2-Binomial Distribution, rbinom(), dbinom(), pbinom(), qbinom()
#interpretation: how many successes will be drawn out of 10 trials
rbinom(n = 2, size = 10, prob = 0.5)
#interpretation: how many successes will be drawn out of 1 trial
rbinom(n=10, size=1, prob=0.4)
#let's plot 
binomData <- data.frame(Success=rbinom(n=100000, size=1000, prob=0.3))
ggplot(binomData, aes(x=Success)) + geom_histogram()
#we can visuallize better
binom5 <- data.frame(Successes=rbinom(n=10000,size=5,prob=0.3), size=5)
head(binom5,n=5)
NROW(binom5)
binom10 <- data.frame(Successes=rbinom(n=10000,size=10,prob=0.3),size=10)
binom100 <- data.frame(Successes=rbinom(n=10000,size=100,prob=0.3),size=100)
binom1000 <- data.frame(Successes=rbinom(n=10000,size=1000,prob=0.3),size=1000)
binomAll <- rbind(binom5,binom10,binom100,binom1000)
head (binomAll, n=10)
binomAll
tail(binomAll,n=10)
ggplot(binomAll, aes(x=Successes)) + geom_histogram() + facet_wrap(~size, scales="free")

#dbinom, pbinom,qbinom
dbinom(x=3,size=10,p=0.3)
pbinom(q = 3, size=10, p=0.3)
pbinom(q = 10, size=10, p=0.3)#cdf should be 1, let's check it
qbinom(p=0.26, size=10,prob=0.3)
qbinom(p = c(.3, .35, .4, .5, .6), size=10 ,prob = 0.3)
myData <- data.frame(numberofSuc=qbinom(p = c(.3, .35, .4, .5, .6), size=10 ,prob = 0.3))
myData$probabilities <- c(.3, .35, .4, .5, .6)
myData
ggplot(myData, aes(x=numberofSuc,y=probabilities)) + geom_point()

#some tests
myData <- data.frame(numberofSuc=qbinom(p = c(.3, .35, .4, .5, .6), size=10 ,prob = 0.3), probabilities=c(.3, .35, .4, .5, .6))
sum(myData$numberofSuc)

#3-Poisson Distribution, counting incidents.rpois() ,dpois() ,qpoins() ,ppois()

pois1 <- data.frame (count=rpois( n=10000, lambda = 1),Lambda=1)
head (pois1)
pois2 <- data.frame (count=rpois (n=10000, lambda = 2), Lambda=2)
tail(pois2)
pois5 <- data.frame (count=rpois(n=10000, lambda = 5), Lambda=5)
head (pois5)
pois10 <- data.frame (count=rpois(n=10000, lambda = 10), Lambda=10)
pois20 <- data.frame (count=rpois(n=10000, lambda = 20), Lambda=20)

myPoisData <- rbind(pois1, pois2, pois5, pois10, pois20)

head (myPoisData, n=25)
tail(myPoisData, n=25)
ggplot (myPoisData, aes(x=count)) + geom_density()


color<-as.factor(myPoisData$Lambda)

ggplot (myPoisData, aes(x=count)) +
    geom_density ( aes (group = Lambda, fill=as.factor(myPoisData$Lambda),color= as.factor(myPoisData$Lambda)) ,adjust=4,  alpha=1/4) +
    scale_color_discrete() +
    scale_fill_discrete() + ggtitle ("PMF") + xlab("value") +ylab("probability")

