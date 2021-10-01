library (datasets) # load package
rm(list=ls()) # clean memory
data(iris) # import dataset
head (iris) # visualize 'head' dataset
# note that using data automatically create an object called 'iris'

summary(iris) #  object summary

str(iris) # examine the structure of the object

fix(iris) # spreadsheet

students<-read.table('https://www.dipintothereef.com/uploads/3/7/3/5/37359245/students.txt',header=T, sep="\t", dec='.') # read data set from url
str(students)

# students[,1]
students$height

students[1,]

students[1,1] # element in the first row, first column
students$height[1] # first element in our vector height

students$gender=="female" # condition

f<-students$gender=="female" # filter

females<-students[f,] # selection
females

rownames(females)<-c('Vanessa', 'Vicky', 'Michelle', 'Joyce', 'Victoria')
females

# NOT RUN:  levels(iris$Species)
setf<-iris$Species=="setosa"
setosa<-iris[setf,]
verf<-iris$Species=="versicolor"
versicolor<-iris[verf,] 
virf<-iris$Species=="virginica"
virginica<-iris[virf,] 

sample(data, size, replace = FALSE, prob = NULL)
# check in detail source code 
# View(sample) OR getAnywhere(sample()) 

# NOT RUN, number of rows in females: nrow(females)
1:nrow(females) # create a vector from 1 to nrow(females)
sf<-sample(1:nrow(females), 2) # filter randonly 2 students on my 10 students
sf # my two students
females[sf,] # apply my filter

ind1<-order (students$height ) # create the vector of order: ind1
rownames(students) # the first ind '1 | height 167' should move at position 5
students [ind1,] # sorting my data with my vector of order, check ind.1 is at position 5 

students[order(students$height),]

ind2<-order(-students$height)
ind3<-order(students$height,decreasing =T)

colors<-ifelse(students$gender=='male', 'blue','red') # if condition is true it will take the value 'blue', if not the value 'red' 

students$colors<-ifelse(students$gender=='male','blue','red') # create a new column

students$gender<-ifelse(students$gender=='male', 'blue','red') # replace an existing column

students$height <= 165 # students shorter or equal to 165 cm
students$shoesize < 37 # students with shoes size less than 37
students$height <= 165 & students$shoesize < 37 # students with height and shoes size <37
students$dual.cond<-ifelse(students$height<=165 & students$shoesize<37,'blue','red') # Use with ifelse()
students # only one student follow the two conditions

#`students` dataset
students$gender<-ifelse(students$gender=='blue','male','female')
students$colors<-NULL
students$dual.cond<-NULL

# `iris` dataset
iris$colors<-ifelse(iris$Species=='setosa','purple', ifelse(iris$Species=='versicolor','blue','pink'))
iris[order(iris$Sepal.Width, decreasing = T),]

library (dplyr)
selected <- select(iris, Sepal.Length, Sepal.Width, Petal.Length) #To select the following columns
head(selected) # print the beginning of the data set created
selected1 <- select(iris, Sepal.Length:Petal.Length) #To select all columns from Sepal.Length to Petal.Length
head(selected1, 4) #To print first four rows of the data set created                       
selected1 <- select(iris,c(3:5)) #To select columns with numeric indexes
head(selected1)

selected <- select(iris, -Sepal.Length, -Sepal.Width)
head(selected)

#To select the first 3 rows with Species as setosa
filtered <- filter(iris, Species == "setosa" )
head(filtered,3)

#To select the last 5 rows with Species as versicolor and Sepal width more than 3
filtered1 <- filter(iris, Species == "versicolor", Sepal.Width > 3)
tail(filtered1)

#To create a column “Greater.Half” which stores TRUE if given condition is TRUE
col1 <- mutate(iris, Greater.Half = Sepal.Width > 0.5 * Sepal.Length)
tail(col1)

table(col1$Greater.Half)

#To arrange Sepal Width in ascending order
arranged <- arrange(col1, Sepal.Width)
head(arranged)
#To arrange Sepal Width in descending order
arranged <- arrange(col1, desc(Sepal.Width))
head(arranged)

summarised <- summarise(arranged, Mean.Width = mean(Sepal.Width))
head(summarised)

#To find mean sepal width by Species, we use grouping as follows
gp <- group_by(iris,Species)
mn <- summarise(gp,Mean.Sepal = mean(Sepal.Width))
mn

#To get rows with the following conditions
iris %>% filter(Species == "setosa",Sepal.Width > 3.8)

iris  %>% group_by(Species) %>% summarise(Mean.Length = mean(Sepal.Length))

rairuoho<-read.table('Data/rairuoho.txt',header=T, sep="\t", dec=".")
head(rairuoho)

TW_corals<-read.table('Data/tw_corals.txt',header=T, sep="\t", dec=".")
TW_corals

library(tidyr)
TW_corals_long <- TW_corals %>% pivot_longer(Southern_TW:Northern_Is, names_to = "Region", values_to = "Richness")
TW_corals_long <-TW_corals %>% pivot_longer(cols = everything(), names_to = "Region", values_to = "Richness")
TW_corals_long 

TW_corals_wide <- pivot_wider(TW_corals_long, names_from = Region, values_from = Richness) 
TW_corals_wide

income<-read.table('Data/metoo.txt',header=T, sep="\t", dec=".", na.strings = "n/a")
income

income_long <- income %>%  pivot_longer(cols = -state, 
                         names_to = c("sex","work"), 
                         names_sep = "_", 
                         values_to = "income")
                         
income_long

income_long %>% pivot_wider(names_from = c(sex,work), 
            values_from = income,
            names_sep = ".")

# Let's first create a delimited table
income.long <- income %>%  pivot_longer(cols = -1, 
                         names_to = "var1", 
                         values_to = "income")
income.long

# Split var1 column into two columns
income.sep <- income.long %>%  separate(col = var1, 
                    sep = "_", 
                    into = c("sex", "work"))
income.sep

income.long %>% separate_rows(var1, sep = "_")

x <- c(1.0, -3.4, 2, 140.1)
mode(x)

typeof(x)

x <- 4
typeof(x)

x <- 4L
typeof(x)

x <- c("a", "f", "project", "house value")
typeof(x)

x <- 3
y <- 5.3

x + y

x <- "3"
y <- "5.3"
# Error in x + y: non-numeric argument to binary operator

x <- c(TRUE, FALSE, FALSE, TRUE)

x <- as.logical(c(1,0,0,1))

a <- c("M", "F", "F", "U", "F", "M", "M", "M", "F", "U")
a.fact <- as.factor(a)

typeof(a)

typeof(a.fact)

a.fact

attributes(a.fact)

levels(a.fact)

factor(a, levels=c("U","F","M"))

iris.sel<- subset(iris, Species == "setosa" | Species == "virginica") # let's subset two species
levels(iris.sel$Species) # the 3 species are still there
boxplot(Petal.Width ~ Species, iris.sel, horizontal = TRUE) # This can be a nuisance when plotting the data subset

iris.sel$Species <- droplevels(iris.sel$Species)
levels(iris.sel$Species)
boxplot(Petal.Width ~ Species, iris.sel, horizontal = TRUE)

x <- c(23, NA, 1.2, 5)

y <- c(23, NULL, 1.2, 5)

mean(x)

mean(y)

x <- c(674 , 4186 , 5308 , 5083 , 6140 , 6381)
x

x[3]

x[c(1,3,4)]

x[2:4]

x[2] <- 0
x

x <- c("all", "b", "olive")
x

x <- c( 1.2, 5, "Rt", "2000")

typeof(x)

m <- matrix(runif(9,0,10), nrow = 3, ncol = 3)
m

m <- array(runif(27,0,10), c(3,3,3))
m

name   <- c("a1", "a2", "b3")
value1 <- c(23, 4, 12)
value2 <- c(1, 45, 5)
dat    <- data.frame(name, value1, value2)
dat
str(dat) # provide structure
attributes(dat) # provide attributes
names(dat) # extract colum names
rownames(dat) # extract row names

A <- data.frame(
     x = c(7.3, 29.4, 29.4, 2.9, 12.3, 7.5, 36.0, 4.8, 18.8, 4.2),
     y = c(5.2, 26.6, 31.2, 2.2, 13.8, 7.8, 35.2, 8.6, 20.3, 1.1) )
B <- c(TRUE, FALSE)
C <- c("apples", "oranges", "round")
lst <- list(A = A, B = B, C = C)

str(lst)
names(lst)

lst$A

lst[[1]]
class(lst[[1]])

lst.notags <- list(A, B, D)
lst.notags

names(lst.notags)

M <- lm( y ~ x, A)
str(M)
names(M)

str(M$qr)

M$qr$rank

y   <- c("23.8", "6", "100.01","6")
y.c <- as.numeric(y)
y.c

as.integer(y)

numchar <- as.character(y.c)
numchar

numfac <- as.factor(y)
numfac

charfac <- as.factor(y.c)
charfac

as.character() #	Convert to character
as.numeric()  as.double()	# Convert to double
as.integer()	# Convert to integer
as.factor()	# Convert to factor
as.logical()	#Convert to a Boolean

students$height<-as.numeric(students$height) # assigned numerical value to this column
class(students$height) # check the change was made
```{.r .distill-force-highlighting-css}
```
