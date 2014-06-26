#####################################
#Reading data into R
#author : Z.B.Celik
#Date   : 06/23/2014
#####################################
#you can find csv file at http://www.jaredlander.com/data/tomato%20First.csv
tomato <- read.table(file="data/Tomato First.csv", header = TRUE, sep = "," , stringsAsFactors = TRUE)
head(tomato)
class(tomato)

rownames(tomato)
length(tomato)
NROW(tomato)
NCOL(tomato)
tomato[1,2:3]
#it's noted that to get data from csv, not xls
vector1 <- tomato[1]
t(vector1)

#from mysql database we can get data, check for details under notes/ConnectingMySQLTableFromRUsingDSN
require(RODBC)
db <-odbcConnect("rtest")
db
tomatoTable <- sqlQuery (db, "SELECT * FROM tomato", stringsAsFactors=FALSE)
head(tomatoTable)
#unfortunately package ‘RMySQL’ is not available (for R version 3.0.1)

#save and load data to .rdata
n <- 20
r <-1:10
w <- data.frame(n,r)
w
save(n,r,w, file="data/multiple.rdata")
rm(n,r,w)
n
r
w
load("data/multiple.rdata")
n
w

#using R datas or from other packages

require(ggplot2)
data()
data(BOD)
BOD

data("tips", package="reshape2")
tips

#getting data from web pages
require(XML)
theURL <- "http://www.w3schools.com/html/html_tables.asp"
W3Table <- readHTMLTable(theURL,which=1, header=FALSE, stringAsFactors=FALSE)
W3Table
