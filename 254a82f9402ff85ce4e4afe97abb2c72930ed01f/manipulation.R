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
sf<-sample(1:nrow(females), 2) # filter 2 female students on my initial 5 female students
sf # my two female students
females[sf,] # apply my filter

# NOT RUN, ind 1 should move at position 5: students
ind1<-order (students$height) # vector order
students [ind1,] # sorting my data with my vector of order, check ind.1 is at position 5 

students[order(students$height),]

ind2<-order(-students$height)

# If condition true, it gives 'blue'. If false, it gives red.
colors<-ifelse(students$gender=='male', 'blue','red') 
colors

students$colors<-ifelse(students$gender=='male','blue','red') # create a new column

students$gender<-ifelse(students$gender=='male', 'blue','red') # replace an existing column

students$height <= 165 # students shorter or equal to 165 cm
students$shoesize < 37 # students with shoes size smaller than 37
students$height <= 165 & students$shoesize < 37 # students equal or shoter than 165 and shoes size smaller than 37
# NOT RUN: students$dual.cond<-ifelse(students$height<=165 & students$shoesize<37,'blue','red') 

# `iris` dataset
iris$color<-ifelse(iris$Species=='setosa','purple', ifelse(iris$Species=='versicolor','blue','pink'))
iris[order(iris$Sepal.Width, decreasing = T),]
```{.r .distill-force-highlighting-css}
```
