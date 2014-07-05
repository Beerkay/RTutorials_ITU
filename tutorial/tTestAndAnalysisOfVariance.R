#####################################
#Compare samples with t-tests and analysis of variance
#author : Z.B.Celik
#Date   : 06/25/2014
#####################################
data("tips", package="reshape2")
head(tips)
#1-two tailed t test with one sample
#information about data and manual calculation of t-score
NROW(tips)
NCOL(tips)
sampleMean <- mean(tips$tip)
sampleSd <- sd(tips$tip)
sampleMean
sampleSd
populationMeanPredicted <- 2.5
tScoreManually <- (populationMeanPredicted-sampleMean)/ (sampleSd/sqrt(NROW(tips$tip)))

#this is the sample standard deviation times our t score so the area of the p value
theValueAwayFromMean <- populationMeanPredicted + -tScoreManually*sampleSd

#we can also draw random numbers from t distribution similar to normal dist. we have covered
#reminder for the probailities: dt,pt,qt,rt
pt (q = theValueAwayFromMean, df=243)
tipsData<-c(unique(tips$tip))
sd(tipsData)

#we test the mean of the tip column with t-test, and we believe that mean is 2.5
#more specifically we say that our hypothesis for the mean of tip column is 2.5 (population)
#question is should I accept the population mean of the tip data as 2.5
#we apply t test,
#we should review hypothesis testing, this one is two-tailed hypothesis testing
t.test(tips$tip, alternative = "two.sided", mu=2.5)

randT <- rt(30000, df= NROW(tips)-1)
tipTTest  <- t.test(tips$tip, alternative = "two.sided", mu=2.5)
head(randT)
randTDataFrame <- data.frame(x=randT)
require(ggplot2)
ggplot(data=randTDataFrame) + geom_density(aes(x=x), fill="grey", color="grey") + xlab("samples from t distribution") +
    geom_vline(xintercept=tipTTest$statistic)

#####################################################
##2-one tailed t test with one sample
#our hypothesis this time is population (true) mean is greater than 2.5
t.test(tips$tip, alternative="greater", mu=2.5)

#####################################################
##3-two sample  t test with one sample
#before going thru some knowledge about the tests

#shapiro: tests the Null hypothesis that "the samples come from a Normal distribution" 
#against the alternative hypothesis "the samples do not come from a Normal distribution".
#the shapiro.test tests the NULL hypothesis that the samples came from a Normal distribution.
#This means that if your p-value <= 0.05, then you would reject the NULL hypothesis that 
#the samples came from a Normal distribution.

#ansari: test the distributions differ only in variance, if p value is high variances are equally enough.

#welch t test: In statistics, Welch's t test is an adaptation of Student's t-test intended for use with two samples 
#having possibly unequal variances

#experiments:
aggregate (tip~sex, data=tips, mean)
aggregate (tip~sex, data=tips, var)
#t test requires same variances of to groups seems different to us but we need to test it.

shapiro.test(tips$tip) #not normally distributed
#look individually, not normally distributed, low p value
shapiro.test(tips$tip[tips$sex=="Female"])
shapiro.test(tips$tip[tips$sex=="Male"])
#visualize them
ggplot(data=tips) + aes(x=tip, fill=sex) + geom_histogram(binwidth=0.5, alpha=1/2)

ansari.test(tip ~ sex, tips)#p-value = 0.376 meaning variances are equal enough
#Two Sample t-test
#we approved that variances are equal in nonparametric way and now we can test if there is a
#difference in between mean of the tips of the females and males.
#p-value = 0.1665 is above the cutoff, the means are equal in two independent samples.
t.test (tip~sex, data=tips, alternative="two.sided", var.equal=TRUE)
#if we found that variances are unequal so we need to conduct welch two sample test
#Welch Two Sample t-test
t.test (tip~sex, data=tips, alternative="two.sided", var.equal=FALSE)

#now let's visuallize
require (plyr)
tipSummary <- ddply(tips, "sex", summarize, tip.mean=mean(tip), tip.sd=sd(tip), 
                    Lower=tip.mean - 2 * tip.sd/sqrt(NROW(tip)),
                    Upper=tip.mean + 2 * tip.sd/sqrt(NROW(tip)))
                    
tipSummary

ggplot(tipSummary, aes(x=tip.mean,y=sex)) + geom_point() + geom_errorbarh(aes(xmin=Lower,xmax=Upper), height=0.2)

#####################################################
##4-Paired t test with
require (UsingR)
father.son
head(father.son)
NROW(father.son)

t.test(father.son$fheight, father.son$sheight, paired = TRUE, alternative="two.sided")

#####################################################
##5-ANOVA
#test tips vary by day
head(tips)
unique(tips$day)
aov(tip~day-1,tips) #without -1 it also calculates the intercept.
