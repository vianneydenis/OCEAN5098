# R update (to run in R native GUI only)
if(!require(installr)) {
  install.packages("installr"); require(installr)} 
updateR()

# install the package `abc` with its name
install.packages("abc")

# function are case sensitive
# all information after `#` is ignored
# it is call a comment. Commenting is very important 

# use/load the package `abc` with its name
library("abc")

install.packages('vegan')
library('vegan')

?median

?median
# or
help(median)

??median

getwd() #get the location of your working directory

setwd()
#get the location of your working directory

q()

a<-'corals' # create an object 'a' containing 'corals'
b<-'are' # create an object 'b' containing 'are'
c<-'cool'# create an object 'c' containing 'cool'
ls # list objects 'a', 'b', 'c'

rm(list=ls()) # rm: remove ls: list of all objects present in memory

3+2 # addition
3-2 # substraction
3*2 # multiplication
3/2 # division
3^3 # power
log(2) # logarithm
exp(2) # exponential
(5 + 3) / 4 # define priority using () or {} 
pi*4 # common function

library(readxl) # I am loading a package (library) allowing me to read .xls file
read_excel('Data/reef_fish.xlsx') # I am reading my file
fish<-read_excel('Data/reef_fish.xlsx') # I am importing my file in an object called 'fish'

fish<-read.table('Data/reef_fish.txt', header=T, sep='\t', dec='.') # reading txt file

fish<-read.table ("D:/.../Topic 1/Data/reef_fish.txt",header = TRUE,sep="\t", dec=".")# long version
fish<-read.table("taiwan.txt", TRUE, "\t",".")# you can also shorten some part once you get use to it, but be careful when using this

fish<-read.table(file.choose (), header = TRUE,sep="\t", dec=".")

fish<-read.table('Data/reef_fish.txt', header=T, sep='\t', dec='.')
barplot(fish$richness, main="Top 10 reef fish Richness (Allen, 2000)", horiz=TRUE, names.arg=fish$country, cex.names=0.5, las=1)
```{.r .distill-force-highlighting-css}
```
