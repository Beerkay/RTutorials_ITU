#####################################
#Basics of Programming
#author : Z.B.Celik
#Date   : 06/23/2014
#####################################

#1- functions
say.hello <- function(){
    print ("hello world !")
}
say.hello
say.hello()
#functions with arguments
hello.person <- function(first, last){
    print(sprintf("Hello %s %s", first, last))
}
hello.person("Berkay", "Celik")
#or we can specy arguments as
hello.person(last="Celik",first="Berkay")
#returning from functions, R just returns the last computation
square.num <- function(x){
    x * x
}
square.num(9)
#or we can specify the return
square.num <- function (x){
    return(x*x)
}
square.num(9)

#using do.call()
do.call(square.num, args=list(9)) # list is optional here

#functions may take other functions as an argument
run.this <- function(x, func=mean) #func is a function variable and default is mean
{
    do.call(func, args=list(x))
}

run.this(x=1:10)#calculates mean 
class(x=1:10)
x=1:10
x
run.this(x=1:10, sum) #sum of the x vector
run.this(x=1:10, sd)

#Using if statements
#ifelse
y=1
ifelse(y==1,"yes", "no")
vectorX <- c(1,0,1,1,NA)
ifelse(vectorX==1,"Yes", "No")#NA outputs as is, as expected

#for loop
for (i in 1:10)
{
    print (i)
}

fruit <- c("apple","banana","pomegranate")
fruitLength = rep (NA, length(fruit)) #replicate 3 times in this case
names(fruitLength) <- fruit
fruitLength

for (a in fruit)
{
    fruitLength[a] <- nchar(a)
}
fruitLength
a
