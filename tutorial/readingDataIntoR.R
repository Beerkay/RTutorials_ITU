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


