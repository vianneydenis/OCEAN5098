## ----  eval=T-------------------------------------------------------
x <- c(1.0, -3.4, 2, 140.1) # numeric and double
typeof(x) 
mode(x)


## ----  eval=T-------------------------------------------------------
x <- 4
typeof(x)


## ----  eval=T-------------------------------------------------------
x <- 4L
typeof(x)


## ----  eval=T-------------------------------------------------------
x <- c("bubul", "magpie", "spoonbill", "barbet")
typeof(x)


## ----  eval=T-------------------------------------------------------
x <- 3
y <- 5.3
x + y


## ----  eval=T-------------------------------------------------------
x <- "3"
y <- "5.3"

# not run:  x+ y

###########################################################
# Error in x + y: non-numeric argument to binary operator #
###########################################################



## ----  eval=T-------------------------------------------------------
x <- c(TRUE, FALSE, FALSE, TRUE)


## ----  eval=T-------------------------------------------------------
x1<-c(1,0,0,1)
x2 <- as.logical(c(1,0,0,1))
# OR: x3 <- as.logical(c(1,0,0,1))


## ----  eval=T-------------------------------------------------------
a <- c("M", "F", "F", "U", "F", "M", "M", "M", "F", "U")
typeof(a) # mode character
class(a)# class character
a.fact <- as.factor(a)
class(a.fact)# class factor


## ----  eval=T-------------------------------------------------------
mode(a.fact)
typeof(a.fact)


## ----  eval=T-------------------------------------------------------
a.fact


## ----  eval=T-------------------------------------------------------
attributes(a.fact)


## ----  eval=T-------------------------------------------------------
levels(a.fact)


## ----  eval=T-------------------------------------------------------
factor(a, levels=c("U","F","M"))


## ---- code_folding = 'Show Solution',  eval=F-----------------------
iris.sel<- subset(iris, Species == "setosa" | Species == "virginica")
levels(iris.sel$Species)  # 3 species are still there
# boxplot(Petal.Width ~ Species, iris.sel, horizontal = TRUE)


## ----  eval=F-------------------------------------------------------
rownames(iris.sel) = seq(length=nrow(iris.sel))


## ----class.source = "fold-show",  eval=T----------------------------
x <- c(23, NA, 1.2, 5)


## ----class.source = "fold-show",  eval=T----------------------------
y <- c(23, NULL, 1.2, 5)


## ----class.source = "fold-show",  eval=T----------------------------
mean(x)


## ----class.source = "fold-show",  eval=T----------------------------
mean(y)


## ----class.source = "fold-show",  eval=T----------------------------
x <- c(674 , 4186 , 5308 , 5083 , 6140 , 6381)
x


## ----class.source = "fold-show",  eval=T----------------------------
x[3]


## ----class.source = "fold-show",  eval=T----------------------------
x[c(1,3,4)]


## ----class.source = "fold-show",  eval=T----------------------------
x[2:4]


## ----class.source = "fold-show",  eval=T----------------------------
x[2] <- 0
x


## ----class.source = "fold-show",  eval=T----------------------------
x <- c("all", "b", "olive")
x


## ----class.source = "fold-show",  eval=T----------------------------
x <- c( 1.2, 5, "Rt", "2000")


## ----class.source = "fold-show",  eval=T----------------------------
typeof(x)


## ----class.source = "fold-show",  eval=T----------------------------
m <- matrix(runif(9,0,10), nrow = 3, ncol = 3)
m


## ----class.source = "fold-show",  eval=T----------------------------
m <- array(runif(27,0,10), c(3,3,3))
m


## ----class.source = "fold-show",  eval=T----------------------------
name   <- c("a1", "a2", "b3")
value1 <- c(23, 4, 12)
value2 <- c(1, 45, 5)
dat    <- data.frame(name, value1, value2)
dat
str(dat) # provide structure
attributes(dat) # provide attributes
names(dat) # extract colum names
rownames(dat) # extract row names


## ----class.source = "fold-show",  eval=T----------------------------
A <- data.frame(
     x = c(7.3, 29.4, 29.4, 2.9, 12.3, 7.5, 36.0, 4.8, 18.8, 4.2),
     y = c(5.2, 26.6, 31.2, 2.2, 13.8, 7.8, 35.2, 8.6, 20.3, 1.1) )
B <- c(TRUE, FALSE)
C <- c("apples", "oranges", "round")
my.lst <- list(A = A, B = B, C = C)


## ----class.source = "fold-show",  eval=T----------------------------
str(my.lst)
names(my.lst)


## ----class.source = "fold-show",  eval=T----------------------------
my.lst$A


## ----class.source = "fold-show",  eval=T----------------------------
my.lst[[1]]
class(my.lst[[1]])


## ----class.source = "fold-show",  eval=T----------------------------
lst.notags <- list(A, B, D)
lst.notags


## ----class.source = "fold-show",  eval=T----------------------------
names(lst.notags)


## ----class.source = "fold-show",  eval=T----------------------------
M <- lm( y ~ x, A)
str(M)
names(M)


## ----class.source = "fold-show",  eval=T----------------------------
str(M$qr)


## ----class.source = "fold-show",  eval=T----------------------------
M$qr$rank


## ----class.source = "fold-show",  eval=T----------------------------
y   <- c("23.8", "6", "100.01","6")
y.c <- as.numeric(y)
y.c


## ----class.source = "fold-show",  eval=T----------------------------
as.integer(y)


## ----class.source = "fold-show",  eval=T----------------------------
numchar <- as.character(y.c)
numchar


## ----class.source = "fold-show",  eval=T----------------------------
numfac <- as.factor(y)
numfac


## ----class.source = "fold-show",  eval=T----------------------------
charfac <- as.factor(y.c)
charfac


## ----class.source = "fold-show",  eval=F----------------------------
as.numeric()  # Coerce to numeric
as.double()	# Coerce to double
as.integer()	# Coerce to integer
as.character() #	Coerce to character
as.logical()	# Coerce to Boolean (logical: TRUE | FALSE)
as.factor()	# Coerce to factor
as.Date()  # Coerce to date
as.data.frame()  # Coerce to data frame
as.list() # Coerce to list

```{.r .distill-force-highlighting-css}
```
